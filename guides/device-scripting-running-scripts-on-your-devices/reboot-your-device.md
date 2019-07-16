---
description: This scripts demonstrates passing information through a reboot.
---

# Reboot your device

It's simple enough to write a script that just reboots your device.  It's a little more work to make sure that the status confirms the reboot when it is done.  The attached script demonstrates writing some information about the bulk job prior to rebooting.  

{% file src="../../.gitbook/assets/device-reboot.sh" %}

This script uses "cron" to run the second half of the script after rebooting, so you'll need to have the cron utility installed.

This script adds a line to your crontab to execute the part of the script that reports that the script completed.   The script that runs after rebooting also removes the crontab reference so that it runs only once.

When the rebooting process starts, you should see:

![](../../.gitbook/assets/image%20%2874%29.png)

When it has completed, you should see:

![](../../.gitbook/assets/image%20%2847%29.png)

This can take several minutes to complete.

