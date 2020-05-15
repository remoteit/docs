#!/bin/bash
# The above line should be the shell you wish to execute this sccript with.
# Raspberry Pi supports bash shell
#
# remote.it Bulk Management Status Script 
#
# $1 parameter is the jobID used for completion status
# $2 is API server
#
# This example script first clears all the status columns (StatusA-E) in the remote.it portal.
# Next this script grabs the following Pi system values and returns them to the remote.it portal.
#
#StatusA = os-release ID per /etc/os-release
#StatusB = Linux version info per uname -a
#StatusC = System uptime since last boot
#StatusD = counts and returns the number remote.it Services
#StatusE = connectd package version

TOOL_DIR="/usr/bin"
NOTIFIER="connectd_task_notify"

# Clear all status columns A-E in remote.it portal

ret=$(${TOOL_DIR}/$NOTIFIER a $1 $2 "")
ret=$(${TOOL_DIR}/$NOTIFIER b $1 $2 "")
ret=$(${TOOL_DIR}/$NOTIFIER c $1 $2 "")
ret=$(${TOOL_DIR}/$NOTIFIER d $1 $2 "")
ret=$(${TOOL_DIR}/$NOTIFIER e $1 $2 "")

# Update status column A (StatusA) in remote.it portal
#-------------------------------------------------
# retrieve the os ID as reported by the command “cat /etc/os-release”
os=$(cat /etc/os-release | grep -w ID | awk -F "=" '{print $2 }')
# send to status column a in remote.it portal
ret=$(${TOOL_DIR}/$NOTIFIER a $1 $2 $os)
#-------------------------------------------------

# Update status column B (StatusB) in remote.it portal
#-------------------------------------------------
# retrieve the Linux kernel version
fwversion=$(uname -a)
# send to status column b in remote.it portal
ret=$(${TOOL_DIR}/$NOTIFIER b $1 $2 "$fwversion")
#-------------------------------------------------

# Update status column C (StatusC) in remote.it portal
#-------------------------------------------------
# retrieve the system uptime 
uptime=$(uptime | sed 's/^.*up *//; s/, *[0-9]* user.*$/m/; s/day[^0-9]*/d, /;s/\([hm]\).*m$/\1/;s/:/h, /;s/^//')
# send to status column c in remote.it portal
ret=$(${TOOL_DIR}/$NOTIFIER c $1 $2 "$uptime")
#-------------------------------------------------

# Update status column D (StatusD) in remote.it portal
#-------------------------------------------------
# retrieve the number of active remote.it Services
nsvcs=$(ps ax | grep connect | grep -v grep | wc -l)
# send to status d
ret=$(${TOOL_DIR}/$NOTIFIER d $1 $2 "$nsvcs")
#-------------------------------------------------

# Update status column E (StatusE) in remote.it portal
#-------------------------------------------------
# use free command to retrieve free memory space value
cversion=$(dpkg -s connectd | grep Version)
# send to status e
ret=$(${TOOL_DIR}/$NOTIFIER e $1 $2 "$cversion")
#-------------------------------------------------

#=======================================================================
# Lastly finalize job, no updates allowed after this
ret=$(${TOOL_DIR}/$NOTIFIER 1 $1 $2 "Job complete")

# Use this line in case of error, and add desired message
#${TOOL_DIR}/$NOTIFIER 2 $1 $2 "Job Failed"

