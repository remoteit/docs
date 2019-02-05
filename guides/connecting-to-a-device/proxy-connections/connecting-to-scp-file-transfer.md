---
description: 'Works with Windows 10, Mac OS X or Linux Command Lines'
---

# Connecting to a SCP file transfer service

#### Transfer files to or from a remote.it Enabled SSH Device using SCP on the command line

Use the method described above to get the URL and port for an SSH connection.

Now you’ll need to type the scp command line using the Hostname and Port value provided.  For the purpose of this example, suppose you are copying the file /home/user/info.txt to the connected device in the location /home/pi/info.txt.  The correct format for the command line is:

**scp -P 38400 /home/user/info.txt your\_username@proxy7.weaved.com:/home/pi/info.txt**

Don’t copy this command line verbatim.  Substitute the Hostname and Port provided in the SSH connection dialog, and the username on the remote system \(NOT your remote.it account name\).  Enter your device’s password when prompted.

You may get a “permission denied” error if the remote user does not have write access to the remote folder.  If you need to copy a file to a write-protected remote folder, you’ll need to first copy it to a write-enabled remote folder, then login using SSH, finally using “sudo mv” to move the file to its final destination.

For more details about using the scp command, please visit http://www.hypexr.org/linux\_scp\_help.php .

