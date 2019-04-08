---
description: >-
  Select a file which you have uploaded to storage to send to one or more
  devices
---

# Send a file to your device

Here is a script which lets you pick a ZIP file from your storage area, which is then downloaded by your device. After that, it reports the file size and MD5 checksum in the status columns.  This is a trivial example and we expect that you will add your own actions to perform upon the file if needed.

#### Upload the script to your account

Download the attached file to your system, then upload it to remote.it:

{% file src="../../.gitbook/assets/send-file-sample.sh" %}

![](http://forum.weaved.com/uploads/default/original/1X/743a3ff82581afab033642185cb53c60136c9fc1.png)

Upload the ZIP file as you did the script, but selecting "General Purpose Content" in the dialog.

Run the script and select the ZIP file you wish to transfer, then click on "Finish".

![](../../.gitbook/assets/image%20%28101%29.png)

Once the process completes, you will see the file name, size, and MD5 checksum as reported from the target Device\(s\):

![](../../.gitbook/assets/image%20%2894%29.png)

