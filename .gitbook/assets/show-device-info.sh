#!/bin/sh
# This script displays your OS identifier, remote.it connectd daemon version,
# number of connectd services running, uptime, and CPU model name
# in status columns A through E.
#
# $1 parameter is the jobID used for completion status
#
#
VERSION="1.0.7"
MODIFIED="July 05, 2019"
TOOL_DIR="/usr/bin"

# api and jobID are passed in from the script job server
api=$1
jobID=$2

# the following block is included to allow compatibility with both
# the deprecated weavedconnectd package as well as the current connectd package
if [ -e "$TOOL_DIR"/task_notify.sh ]; then
    NOTIFIERSCRIPT=task_notify.sh
    package=weavedconnectd
elif [ -e "$TOOL_DIR"/connectd_task_notify ]; then
    NOTIFIERSCRIPT=connectd_task_notify
   package=connectd
fi

# the following logger command demonstrates writing script variables to the system log
# which can be useful for debugging or tracking purposes
logger "$NOTIFIERSCRIPT"

# Status() is used to communicate info back to the remote.it job server
# send 2 parameters: code, message
# code is a, b, c, d, or e to write "message" to a status cell
# code is 1 to indicate script succeeded
# code is 2 to indicate that script failed

Status()
{
	ret=$(${TOOL_DIR}/"$NOTIFIERSCRIPT" $1 $api $jobID "$2")	
}

# first, clear status cells a through e
Status a ""
Status b ""
Status c ""
Status d ""
Status e ""

# first status variable is os ID from the uname command
osID=$(uname -a)
logger "$osID"

# second status variable is the remote.it package version
daemonVersion="$package $(dpkg -s $package | grep Version)"


logger "$daemonVersion"

# third status variable is the number of connectd services running (excludes connectd_schannel)
sys=$(ps ax | grep "connectd\." | grep -v grep | wc -l)
logger "$sys"

# retrieve the system uptime and format it for the fourth status variable 
uptimeX=$(uptime | sed -E 's/^[^,]*up *//;s/, *[0-9]* users.*//;s/ *days*/d/;s/ *hours*/h/;s/ *mins*/m/;s/([0-9]*):(0|)([0-9]*)/\1h, \3m/;s/m,.*$/m/;s/^/0d, 0h, 0m, /;s/ *[0-9]*h,(.*[0-9]*h)/\1/;s/ *[0-9]*d,(.*[0-9]*d)/\1/;s/ *[0-9]*m,(.*[0-9]*m)/\1/;s/^/ /;s/([^0-9])([0-9][^0-9])/\10\2/g;s/([0-9]*m), ([0-9]*[hd])/\2, \1/;s/([0-9]*h), ([0-9]*d)/\2, \1/;s/^ *//;s/^([0-9]{2}d)/0\1/;s/  / /;')

# retrieve the CPU model name and use for the fifth status variable
cpuinfo="$(grep "model name" /proc/cpuinfo | tail -n 1 | awk -F":" '{ print $2 }')"

# send to status a through e

Status a "$osID"
Status b "$daemonVersion"
Status c "$sys services"
Status d "$uptimeX"
Status e "$cpuinfo"

# Lastly finalize job, no updates allowed after this
Status 1 "Job complete!"

