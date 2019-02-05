---
description: 'Works with Windows 10, Mac OS X or Linux Command Lines.'
---

# Connecting to an SSH service

remote.it offers a variety of ways to connect to your remote device using SSH.  You can use a standalone SSH client application such as PuTTY, or command-line scripts, depending on your Operating System.

**Summary:** These instructions will connect a Windows 10, Mac OS X or Linux computer using a terminal window \(or Windows command prompt\), to a remote.it-enabled SSH service.

**Works With:**

* Devices: All remote.it-compatible devices running an SSH server.
* Clients: Windows 10 command prompt, Mac OS/X terminal and Linux console or terminal window.

#### Connect to a remote.it enabled SSH Device

Sign In to your remote.it account, locate your Device in the on the Manage Devices page, and click on the device name.  

![](https://remot3it.zendesk.com/hc/article_attachments/115000702292/mceclip0.png)

You will then see a window showing the services available on that device.

![](https://remot3it.zendesk.com/hc/article_attachments/115000701971/mceclip1.png)

Click on the remote.it SSH Service you wish to connect to, then click on "Confirm".  

Within a few moments, you will see a dialog with connection details.

![](https://remot3it.zendesk.com/hc/article_attachments/115000701991/mceclip2.png)

 The command line is preformatted to work with the ssh command line program.  However, ssh expects the **username** to be included here.  Since we don’t know what your username is, we’ve inserted the word **LOGIN** as a place holder for you to enter your own username.  We have supplied some preformatted lines using the pi and root usernames for your convenience.

![](https://remot3it.zendesk.com/hc/article_attachments/360016001711/mceclip1.png)

Select the entire line and copy it to your terminal or command prompt \(don't hit ENTER yet\).  Now edit the word "LOGIN" \(you'll need to use the left arrow and then backspace over it\) and replace it with your username.  The example shows the username as “ubuntu”. 

 ![](https://remot3it.zendesk.com/hc/article_attachments/360016001551/mceclip0.png)

Now press “Enter”.  This initiates the login. You will probably see the following security message \(or something similar\), which is entirely normal.  Type “yes” to accept the new SSH key into your key cache.

![](https://remot3it.zendesk.com/hc/article_attachments/360016016051/mceclip0.png)

Enter your password when prompted.

Now you are logged in and can run console commands as you normally would.

