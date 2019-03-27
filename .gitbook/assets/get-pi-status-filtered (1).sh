#!/bin/bash
# The above line should be the shell you wish to execute this script.
# Raspberry Pi supports bash shell
#
# remote.it Bulk Management Status Script 
#
# $1 parameter is the jobID used for status updates
# $2 is API server
#
# This example script first clears all the status columns (Status A-E) in the remote.it portal.
# Next this script grabs the following Pi system values and returns them to the remote.it portal.
#
# Status A = Free disk space. listed by partition.  Filtered to show only non zero size partitions.
# Status B = Linux version info per uname -a, filtered to show Kernel version.
# Status C = System uptime since last boot.  Reformatted.
# Status D = list of all running processes.  filtered to show connectd processes
# Status E = connectd package version.  filtered to show only the version.

TOOL_DIR="/usr/bin"
NOTIFIER="connectd_task_notify"

JobId="$1"
API="$2"

Status()
{
	ret=$(${TOOL_DIR}/$NOTIFIER "$1" "$JobId" "$API" "$2")
}

# Clear all status columns A-E in remote.it portal

Status a ""
Status b ""
Status c ""
Status d ""
Status e ""

# Update status column A (StatusA) in remote.it portal
#-------------------------------------------------
# retrieve the free disk space
df > /tmp/df.txt
if [ -e /tmp/df2.txt ]; then
    rm /tmp/df2.txt
fi
# now filter the result to only show non-zero size partitions
while IFS='' read -r line || [[ -n "$line" ]]; do
    nbytes="$(echo $line | awk '{ print $3 }')"
    if [ "$nbytes" != "0" ]; then
       echo $line >> /tmp/df2.txt
    fi
done < /tmp/df.txt

diskfree="$(cat /tmp/df2.txt)"
echo "$diskfree" > $0.log
# send to status column a in remote.it portal
Status a "$diskfree"
#-------------------------------------------------

# Update status column B (StatusB) in remote.it portal
#-------------------------------------------------
# retrieve the Linux kernel version
fwversion="Kernel: $(uname -a | awk '{print $3 }')"
echo "$fwversion" >> $0.log
# send to status column b in remote.it portal
Status b "$fwversion"
#-------------------------------------------------

# Update status column C (StatusC) in remote.it portal
#-------------------------------------------------
# retrieve the system uptime 
uptime="$(uptime)"
echo "$uptime" >> $0.log
# send to status column c in remote.it portal
Status c "$uptime"
#-------------------------------------------------

# Update status column D (StatusD) in remote.it portal
#-------------------------------------------------
# get the list of all running processes
nsvcs="$(ps ax | grep connectd | grep -v grep)"
echo "$nsvcs" >> $0.log
# send to status d
Status d "$nsvcs"
#-------------------------------------------------

# Update status column E (StatusE) in remote.it portal
#-------------------------------------------------
# use dpkg command to retrieve info about the connectd package
cversion="connectd $(dpkg -s connectd | grep Version)"
echo "$cversion" >> $0.log
# send to status e
Status e "$cversion"
#-------------------------------------------------

#=======================================================================
# Lastly finalize job, no updates allowed after this
Status 1 "Job complete"

# Use this line in case of error, and add desired message
# Status 2 "Job Failed"

