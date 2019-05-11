#!/bin/bash
#
# Send-File-Sample.sh - Example script of sending a file from storage to device
# tested with connectd package 2.3.17
# and weavedconnectd version 1.3-07z1
#
# Upload files as "General purpose content" in your remote.it account in order
# to use this script to transfer a file to one or more devices.
#
# The partial file spec in the (Select File) statement below can be used to
# restrict the file types shown in the selection list when this script runs.
# As written, shows all files.  Change the -f() term to: -f (Select File|.zip)
# to show only ZIP files in your storage uploads.
#
# r3_header, -f (Select File|.), -e (20160)
#
# VERIFIED March 21, 2019 - GSW

# version info
VERSION="1.0.12"
MODIFIED="May 06, 2019"

DEBUG_ON=1
SHOW_STATUS=1
TOOL_DIR=/usr/bin
DEBUG_DIR=/tmp

#
# API for short code
#
apiURI="/tiny/lookup/"

#
# API server to use
#
apiMethod="https://"
apiVersion="/api"
apiServer="device.remot3.it"

# use this parameter to limit the transfer speed, if desired
LIMIT_SPEED="1000k"

# Task expires in X minutes
TASK_LIFE_IN_MINS=20160 #minutes
# Convert to seconds
TASK_LIFE=$(expr $TASK_LIFE_IN_MINS \* 60) #Seconds

# detect which package is installed (connectd or legacy weavedconnectd)
# and set the NOTIFIER variable accordingly
if [ -e /usr/bin/connectd_task_notify ]; then
    NOTIFIER=connectd_task_notify
elif [ -e /usr/bin/task_notify.sh ]; then
    NOTIFIER=task_notify.sh
else
    Log "[remote.it] - Cound not find notifier script."
    exit 1
fi

Log "NOTIFIER: $NOTIFIER"

#----------------------------------------------------------
#
# Check to see if API is available
#
Internet_Available()
{
	ret=0
    nc -z ${apimethod}${apiServer} 80  >/dev/null 2>&1
    online=$?
    if [ $online -eq 0 ]; then
        Log "$0 Internet Available"
        ret=1
    else
        Log "$0 Internet Not Available"
    fi
    return $ret
}

#----------------------------------------------------------
#
# Waits until API is available
#
Wait_For_Internet()
{
	while [ 1 ]
	do
		Has_Task_Expired
	
		# task has not expired
		if [ $? -eq 0 ]; then
	
			# check to see if internet is available
			Internet_Available
		
			if [ $? -eq 1 ]; then
				# internet is available, return
				sleep 2
    			Log "$0 Wait_For_Internet- available"
				return 0
			fi 
		
			# wait for 15 seconds and recheck internet 
			sleep 15
			Log "$0 Looping while internet not available"
		fi
	done
}

#----------------------------------------------------------
#
# Check to see if task has expired
#
Has_Task_Expired()
{
	now=$(date +%s)
	delta=$((now-$START))
    Log "Has_Task_Expired: $delta"
	
	if [ $delta -gt $TASK_LIFE ]; then
		# exit the script since task has expired
		exit 1
	else
		return 0
	fi
}

#----------------------------------------------------------
#
# Log if DEBUG_ON is set to /tmp
#
Log()
{
    if [ $DEBUG_ON -eq 1 ]; then
        ts=$(date)
        echo "$ts $1" >> ${DEBUG_DIR}/$(basename $0).log
    fi
}

#----------------------------------------------------------
#
# JSON parse (very simplistic):  get value frome key $2 in buffer $1,  values or keys must not have the characters {}[", 
#   and the key must not have : in it
#
#  Example:
#   value=$(JSONval "$json_buffer" "$key") 
#                                                   
JSONval()                                              
{
    temp=`echo "$1" | sed -e 's/[{}\"]//g' | sed -e 's/,/\'$'\n''/g' | grep -w $2 | cut -d"[" -f2- | cut -d":" -f2-`       
    echo ${temp}                                                
}                                                   

#----------------------------------------------------------
#
# translate short code
#
Translate()
{
    ret=0
    # make api call
    translate_url=${apiMethod}${apiServer}${apiVersion}${apiURI}${short_code}

    Log "Translate URL call using URL $translate_url"

    resp=$(curl -s -S -X GET -H "content-type:application/json" -H "apikey:WeavedDeveloperToolsWy98ayxR" "$translate_url")
    
    status=$(JSONval "$resp" "status")

    Log "Translate return status $status"

    if [ "$status" == "true" ]; then
        item=$(JSONval "$resp" "item")
        #
        # Convert from base64
        decode=$(echo "$item" | base64 --decode)
       
        Log "item $item -> $decode"
   
        echo -n "$decode"
    else
        printf "Fail"
        ret=1
    fi

    return $ret
}

#----------------------------------------------------------
#
# Download package and retry when connectivity issue occur
# 
READTIMEOUT=120
READRETRIES=5
Download_With_Retry()
{
    filename=$(echo "$1" | awk '{ print $3 }')
	Log "Filename: $filename"

    # remove any possible existing file of same name we are about to download
    if [ -e "$filename" ]; then
        rm "$filename"
    fi

	if [ -z $2 ]; then
		LIMITRATE="100k"
	else 
		LIMITRATE=$2
	fi
	Log "Limitrate: $LIMITRATE"
	
	# while task has not expired
    while Has_Task_Expired; do    	
		wget_o=$(wget -c --limit-rate="$LIMITRATE" --read-timeout="$READTIMEOUT" -t $READRETRIES --no-check-certificate $1 )
		retval=$?
			
		# download was successful
		if [ $retval -eq 0 ]; then
			return 0
		else
			# wget returned error, check for connectivity issue
			if [ $retval -eq 4 ]; then
				Task_Update "Download interrupted, retry in 5 sec."
				sleep 5
			else
				# other wget error code, update task status
				Status_B "Download Error"
				Status_C "wget returned $retval"
				Task_Failed "Error - wget download returned $retval"
				exit 1 
			fi
		fi
    done
}

#----------------------------------------------------------
#
# Task Update
#
Task_Update()
{
    if [ $SHOW_STATUS -eq 1 ]; then
		retry=1
		
		while [ $retry -eq 1 ]
		do
			Wait_For_Internet
			ret=$(${TOOL_DIR}/"$NOTIFIER" 0 $jobid $api_server "$1")
			Log "Task_Update return value: $ret"
			
			if [[ "$ret" == *"200"* ]]; then
				retry=0
			else
				if [[ "$ret" == *"403"* ]]; then
					exit 1
				else
					sleep 60
				fi
			fi
		done
	fi
}

#----------------------------------------------------------
#
# Send Task Complete notification to server
#
Task_Complete()
{
	retry=1
	
	while [ $retry -eq 1 ]
	do
		Wait_For_Internet
		ret=$(${TOOL_DIR}/"$NOTIFIER" 1 $jobid $api_server "$1")
		
		if [[ "$ret" == *"200"* ]]; then
			retry=0
		else
			if [[ "$ret" == *"403"* ]]; then
				exit 1
			else
				sleep 60
			fi
		fi
	done
}
#----------------------------------------------------------
#
# Send Task Failed notificationto server
# takes 1 parameter which is the message to send.
#
Task_Failed()
{
	retry=1
	
	while [ $retry -eq 1 ]
	do
		Wait_For_Internet
		ret=$(${TOOL_DIR}/"$NOTIFIER" 2 $jobid $api_server "$1")
		
		if [[ "$ret" == *"200"* ]]; then
			retry=0
		else
			if [[ "$ret" == *"403"* ]]; then
				exit 1
			else
				sleep 60
			fi
		fi
	done	
}
#----------------------------------------------------------
#
# Update Status column A
#
Status_A()
{
    if [ $SHOW_STATUS -eq 1 ]; then
		retry=1
		
		while [ $retry -eq 1 ]
		do
			Wait_For_Internet
			ret=$(${TOOL_DIR}/"$NOTIFIER" a $jobid $api_server "$1")
			Log "Status A: ret: $ret rv: $?"
			if [[ "$ret" == *"200"* ]]; then
				retry=0
			else
				if [[ "$ret" == *"403"* ]]; then
					exit 1
				else
					sleep 60
				fi
			fi
		done
	fi
}
#----------------------------------------------------------
#
# Update Status column B
#
Status_B()
{
    if [ $SHOW_STATUS -eq 1 ]; then
		retry=1
		
		while [ $retry -eq 1 ]
		do
			Wait_For_Internet
			ret=$(${TOOL_DIR}/"$NOTIFIER" b $jobid $api_server "$1")
			Log "Status B: $ret"			
			if [[ "$ret" == *"200"* ]]; then
				retry=0
			else
				if [[ "$ret" == *"403"* ]]; then
					exit 1
				else
					sleep 60
				fi
			fi
		done
	fi
}
#----------------------------------------------------------
#
# Update Status column C
#
Status_C()
{
    if [ $SHOW_STATUS -eq 1 ]; then
		retry=1
		
		while [ $retry -eq 1 ]
		do
			Wait_For_Internet
			ret=$(${TOOL_DIR}/"$NOTIFIER" c $jobid $api_server "$1")
			
			if [[ "$ret" == *"200"* ]]; then
				retry=0
			else
				if [[ "$ret" == *"403"* ]]; then
					exit 1
				else
					sleep 60
				fi
			fi
		done
	fi
}

###############################
# Main program starts here    #
###############################
#
# Must have 3 parameters
#
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    usage
    exit 1
fi

jobid=$1
shift
api_server=$1
shift
short_code=$1

START=$(date +%s)

Log "$0 called with jobid $jobid api_server $api_server and shortcode $short_code"
Log " "
Log "START = $START"

command=$(Translate $short_code)

if [ $? -gt 0 ]; then
    Log "[Fail] translate short code $short_code failed"
    exit 1
fi    

Log "Translated short code to $command"
Log " "

#
# Must use eval to correctly expand command
#
eval set -- ${command}

Status_A " "
Status_B " "
Status_C " "
Task_Update "Starting $(basename $0)..."

################################################
# parse the flag options (and their arguments) #
################################################
while getopts f:m:p:l:s: OPT; do
    case "$OPT" in
        f)
            # get file, this should be in the format "file -O output file"
            # you should be in the directory you want here		
	        filename=$(echo $OPTARG | awk '{ print $3 }')
	        newfilename=$(echo $filename | sed s/%20/""/g)

            Status_A "Downloading $newfilename..."
			Log "Downloading $newfilename..."
            Task_Update "Downloading $newfilename..."
	
	        Download_With_Retry "$OPTARG" "$LIMIT_SPEED"
			Log "newfilename: $newfilename..."
	        mv $filename $newfilename
			
            Task_Update "Downloaded $newfilename"	
            ;;
        m)
             ;;
        p)
            ;;
        l)  
            ;;
        s)
            ;;
	esac
done
#===============================================================================
# down here we are sending status back about the transferred file.
# users can choose to do other things here, such as doing something with the file.
Task_Update "File transferred: $newfilename"
size=$(ls -l | grep "$newfilename" | awk '{ print $5 }')

Status_A "$newfilename"
	
Status_B "File size: $size"

md5cksum=$(md5sum "$newfilename"  | awk '{ print $1 }')
Log "md5sum: $md5cksum"

Status_C "MD5: $md5cksum"

# Task_Complete in case of everything went well
Task_Complete "Success - $newfilename transferred."

# Task failed in case that something went wrong
# Task_Failed "Failure message"

