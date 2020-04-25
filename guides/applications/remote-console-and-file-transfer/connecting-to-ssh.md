---
description: 'Works with Windows 10, macOS or Linux Command Lines.'
---

# Connecting to an SSH service

remote.it offers a variety of ways to connect to your remote device using SSH.  You can use a standalone SSH client application such as PuTTY, or command-line scripts, depending on your Operating System.

**Summary:** These instructions will connect a Windows 10, macOS or Linux computer using a terminal window \(or Windows command prompt\), to a remote.it-enabled SSH service.

**Works With:**

* Devices: All remote.it-compatible devices running an SSH server.
* Clients: Windows 10 command prompt, macOS terminal and Linux console or terminal window.

#### Connect to a remote.it enabled SSH Device

Sign In to your remote.it account, locate your Device in the on the Devices page, and click on the device name.  

![](../../../.gitbook/assets/image%20%2876%29.png)

You will then see a window showing the services available on that device.  You will need to set your pop-up blocker, if any, to allow popups from the remote.it web site.

![](../../../.gitbook/assets/image%20%28369%29.png)

Click on the link of the remote.it SSH Service you wish to connect to.  

Within a few moments, you will see a dialog with connection details.

![](../../../.gitbook/assets/image%20%2839%29.png)

We have supplied some pre-formatted ssh command lines using the **pi** and **root** usernames for your convenience.

If you are using a different username, use the third option where we’ve inserted the word **LOGIN** as a place holder for you to enter your own username. 

![](../../../.gitbook/assets/image%20%2812%29.png)

#### Use the remote.it proxy address and port in your SSH command line

Select the entire line and copy it to your terminal or command prompt \(don't hit ENTER yet\).  Now edit the word "LOGIN" \(you'll need to use the left arrow and then backspace over it\) and replace it with your username.  The example shows the username as “ubuntu”. 

![](../../../.gitbook/assets/image%20%28180%29.png)

Now press “Enter”.  This initiates the login. You will probably see the following security message \(or something similar\), which is entirely normal.   Type "yes" when prompted to continue with login.

```text
The authenticity of host '[proxy21.rt3.io]:35136 ([69.64.70.155]:35136)' can't be established. 
ECDSA key fingerprint is SHA256:Gg2MC6laKkCs5PbY4Y1IVVlrZA7eJbSHI4kOz7T0kp4. Are you sure you want to continue connecting (yes/no)?
Type “yes” to accept the new SSH key into your key cache.
```

Enter your password when prompted.

Now you are logged in and can run console commands as you normally would.

#### Suppressing security warnings

When you connect to an SSH remote.it Service using the proxy address from the remote.it web portal or the /device/connect API endpoint, you will get a new URL periodically and so it may not make sense to either check the host authenticity or to save the host details in the known hosts list.

{% hint style="info" %}
Some people prefer to see all security warnings.  If you'd rather see all security warnings, then don't use these options.
{% endhint %}

In order to suppress the authenticity warning and prevent saving of the remote.it URL in the known hosts file, add the following flags to your SSH command line:

```text
-o "StrictHostKeyChecking=no" 
-o "UserKnownHostsFile /dev/null"
```

The sample command line becomes:

```text
ssh -l root proxy21.rt3.io -p 35136 -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile /dev/null"
```

You will still see a message that the hosts file got updated.  However we told the command to send that information to /dev/null rather than the actual known hosts file.

```text
Warning: Permanently added '[proxy13.remot3.it]:32076,[69.64.70.155]:32076' (ECDSA) to the list of known hosts.
```

If you run the ssh command again, you will see the same warning, indicating that in fact the host name was not written to the actual known hosts file.

