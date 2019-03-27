---
description: A simple example showing strategies for developing your own scripts
---

# Detailed scripting example

Most users of remote.it start by installing a remote.it Service for SSH.  With an SSH connection you can really do "anything" possible on your device as long as you have the login password \(and in some cases, a separate root password\).

Let's suppose that you tend to run the following commands at the console to check various aspects of your device's operation.

* df - report free disk space
* uname - report information about the OS
* ps ax - show all running processes
* uptime - shows the amount of time since the device rebooted
* dpkg - show the version of an installed Debian package

In each case, I use the following expression format to assign the output of a command to a shell variable:

```text
diskfree="$(df)"
```

Then, I send the value of the variable to a log file on the device, so if needed, I have some traces of what the script actually did.

```text
echo "$diskfree" >> $0.log
```

Finally, I report this value to the "Status A" cell.

```text
Status a "$diskfree"
```

Notice that "Status" is actually a function declared earlier in this script.  You should include this \(and the other declared variables\) in each of your scripts to make readability better.

```text
TOOL_DIR="/usr/bin"
NOTIFIER="connectd_task_notify"
JobId="$1"
API="$2"

Status()
{
	ret=$(${TOOL_DIR}/$NOTIFIER "$1" "$JobId" "$API" "$2")
}
```

The following script performs those functions and reports the results back to the 5 Status Columns in the "View Devices" mode.

{% file src="../../.gitbook/assets/get-pi-status-basic.sh" %}

You will notice that when you upload and run this script, some of the status columns get quite filled with data, not all of which may be interesting.  This may be OK for one or a small number of devices, but it can become unmanageable with a large number of devices.

The following script introduces additional shell commands to filter the results down to a manageable state.

{% file src="../../.gitbook/assets/get-pi-status-filtered.sh" %}

 This article does not seek to teach you how to write these expressions using shell language.  You should understand that while you can return multi-line status responses, it may be helpful to filter some of the command output to make the results more readable and meaningful.





 

