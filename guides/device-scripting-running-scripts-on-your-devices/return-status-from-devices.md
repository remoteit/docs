---
description: Easily display the results of up to 5 console commands
---

# Show device status

This script returns the following info into status columns A through E:

* Operating System name
* Linux Version
* Uptime
* Number of installed remote.it Services
* Version of of the installed connectd package

![](../../.gitbook/assets/image%20%28110%29.png)

Download the attached file to your system, then upload it to remote.it:

{% file src="../../.gitbook/assets/get-pi-status.sh" caption="Script returns status from any Linux based device" %}

If you are on Windows, editing this file in Notepad will cause issues because the line feeds are not compatible with your Pi's Linux OS. We suggest you use a Linux compatible text editor for Windows such as [Notepad++](https://notepad-plus-plus.org/).

In the script, the `/usr/bin/connectd_task_notify` __script is used to report various interesting bits of info about your systems. `/usr/bin/connectd_task_notify` is installed when you install the connectd package.  The variables `TOOL_DIR` and `NOTIFIER` are used for this purpose.

```bash
TOOL_DIR="/usr/bin" 
NOTIFIER="connectd_task_notify"
```

For example, the OS Name is reported in Status column A. 

```bash
# Update status column A (StatusA) in remote.it portal
#-------------------------------------------------
# retrieve the os ID as reported by the command “cat /etc/os-release”
os=$(cat /etc/os-release | grep -w ID | awk -F "=" '{print $2 }')
# send to status column a in remot3.it portal
ret=$(${TOOL_DIR}/$NOTIFIER a $1 $2 $os)
#-------------------------------------------------  You MUST use the final line:
ret=$(${TOOL_DIR}/$NOTIFIER 1 $1 $2 "Job complete") 
```

This tells the Job Server that your script has completed its task. It may take several minutes for the Job Status to fully update and clear, even after running a script which by itself completes rapidly.

