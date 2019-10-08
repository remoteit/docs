#!/bin/bash
#
# remote.it Bulk Management Script
#
# Reboot Devices
# compatible with connectd package 2.1 or later
# works with systems that have the "cron" utility installed
#
# $1 parameter is the jobID used for completion status
#
# $2 parameter is the API server to use for completion status
#
VERSION="1.0.5"
MODIFIED="February 11, 2019"

TOOL_DIR="/usr/bin"
NOTIFIER=connectd_task_notify
FOLDER="/root/.remote.it"
source "$TOOL_DIR"/connectd_library

###############################################################

prepare_and_reboot()
{
if [ ! -d "$FOLDER" ]; then
mkdir "$FOLDER"
fi

# save command and parameters for pass of uncompleted command through reboots
# cron reboot job needs to be in place to scan and execute commands left in the file above
REBOOTFILE="$FOLDER"/reboot.sh
echo "#!/bin/bash" > "$REBOOTFILE"
echo "# REBOOT DEVICE" >> "$REBOOTFILE"
echo "source /usr/bin/connectd_library" >> "$REBOOTFILE"
# connectd start includes the "wait for internet available" function
echo "connectd_start" >> "$REBOOTFILE"
echo "sleep 5" >> "$REBOOTFILE"
echo "${TOOL_DIR}/$NOTIFIER a $1 $2 'Rebooted.'" >> $REBOOTFILE
echo "${TOOL_DIR}/$NOTIFIER 1 $1 $2 'Job Complete'" >> $REBOOTFILE
echo "cronRemoveLine '@reboot bash -x $REBOOTFILE >> /tmp/rebootlog'" >> $REBOOTFILE
echo "rm $REBOOTFILE" >> $REBOOTFILE
chmod +x $REBOOTFILE
cronAddLine "@reboot bash -x $REBOOTFILE >> /tmp/rebootlog"
sync
sleep 2
/sbin/reboot
}

echo "--- Rebooting device ---" > /tmp/"$0".txt


# Display rebooting message in Status column A
ret=$(${TOOL_DIR}/$NOTIFIER a $1 $2 "Rebooting...")

#
# this would be the place to add anything else you wanted to do prior to rebooting

prepare_and_reboot $1 $2