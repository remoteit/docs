#!/bin/bash
#
# remote.it Bulk Management Script
#
# Reboot Devices
# compatible with weavedconnectd 1.3-07
# compatible with connectd package 2.1 or later
# not compatible with remoteit package at the moment - will show an error
# works with systems that have the "cron" utility installed and running
#
# $1 parameter is the jobID used for completion status
#
# $2 parameter is the API server to use for completion status
#
VERSION="1.0.7"
MODIFIED="May 09, 2020"
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin

TOOL_DIR="/usr/bin"
TMP_DIR="/tmp"
FOLDER="/root/.remote.it"
REBOOTFILE="$FOLDER"/reboot.sh

# look for weavedconnectd package notifier
if [ -e ${TOOL_DIR}/task_notify.sh ]; then
    NOTIFIER=task_notify.sh
    logger "Weaved reboot script"
else # figure it's connectd or remoteit
    NOTIFIER=connectd_task_notify
    logger "connectd reboot script"
fi

###############################################################

######### Add line to cron ######
cronAddLine()
{
    crontab -l 2> /dev/null 1> "$TMP_DIR"/.crontab_old
    echo "$1" >> "$TMP_DIR"/.crontab_old
    logger "cronAddline $1"
    crontab "$TMP_DIR"/.crontab_old
}
######### End add line to cron ######

addLineToRebootFile()
{
    echo "$1" >> "$REBOOTFILE"
}

prepare_and_reboot()
{
if [ ! -d "$FOLDER" ]; then
mkdir "$FOLDER"
fi

# save command and parameters for pass of uncompleted command through reboots
# cron reboot job needs to be in place to scan and execute commands left in the file above
if [ -e "$REBOOTFILE" ]; then
    rm "$REBOOTFILE"
fi

addLineToRebootFile "#!/bin/bash"
addLineToRebootFile "# REBOOT DEVICE"

if [ -e ${TOOL_DIR}/connectd_library ]; then
# connectd start includes the "wait for internet available" function
    addLineToRebootFile "connectd_start"
else
# weavedstart.sh does not wait for internet
    addLineToRebootFile "weavedstart.sh"
fi

addLineToRebootFile  "cronRemoveLine()"
addLineToRebootFile  "{"
addLineToRebootFile  '    crontab -l | grep -v "$1" | cat > /tmp/.crontmp'
addLineToRebootFile  "    crontab /tmp/.crontmp"
addLineToRebootFile  "}"
addLineToRebootFile "sleep 5"
addLineToRebootFile "${TOOL_DIR}/$NOTIFIER a $1 $2 'Rebooted.'"
addLineToRebootFile "${TOOL_DIR}/$NOTIFIER 1 $1 $2 'Job Complete'"
addLineToRebootFile "cronRemoveLine '@reboot bash -x $REBOOTFILE >> /tmp/rebootlog'"
addLineToRebootFile "rm $REBOOTFILE"
chmod +x $REBOOTFILE

cronAddLine "@reboot bash -x $REBOOTFILE >> /tmp/rebootlog"
echo "Logging root crontab" > /root/cronlog
crontab -l >> /root/cronlog
sync
sleep 2
/sbin/reboot
}

# see if remoteit package is installed
dpkg -s remoteit
if [ $? -eq 0 ]; then
    # Display error message in Status column A
    ret=$(${TOOL_DIR}/$NOTIFIER a $1 $2 "This script is not compatible with the remoteit package.\nPlease contact support@remote.it.")
    # send job failed message (completes the bulk script cycle) 
    ${TOOL_DIR}/$NOTIFIER 2 $1 $2 "Incompatible with remoteit"
exit 1
fi

# see if remoteit-desktop package is installed
dpkg -s remoteit-desktop
if [ $? -eq 0 ]; then
    # Display error message in Status column A
    ret=$(${TOOL_DIR}/$NOTIFIER a $1 $2 "This script is not compatible with the remoteit package.\nPlease contact support@remote.it.")
    # send job failed message (completes the bulk script cycle) 
    ${TOOL_DIR}/$NOTIFIER 2 $1 $2 "Incompatible with remoteit-desktop"
exit 1
fi


# see if cron package is installed
which cron
if [ $? -ne 0 ]; then
    # Display error message in Status column A
    ret=$(${TOOL_DIR}/$NOTIFIER a $1 $2 "This script requires cron.\nPlease contact support@remote.it.")
    # send job failed message (completes the bulk script cycle) 
    ${TOOL_DIR}/$NOTIFIER 2 $1 $2 "cron is not installed"
exit 1
fi

# make sure cron is running
ps ax | grep cron | grep -v grep
if [ $? -ne 0 ]; then
    # Display error message in Status column A
    ret=$(${TOOL_DIR}/$NOTIFIER a $1 $2 "cron is not running.\nPlease contact support@remote.it.")
    # send job failed message (completes the bulk script cycle) 
    ${TOOL_DIR}/$NOTIFIER 2 $1 $2 "cron is not running"
exit 1
fi


# otherwise, continue 

echo "--- Rebooting device ---" > /tmp/"$0".txt

# Display rebooting message in Status column A
ret=$(${TOOL_DIR}/$NOTIFIER a $1 $2 "Rebooting...")

#
# this would be the place to add anything else you wanted to do prior to rebooting

prepare_and_reboot $1 $2