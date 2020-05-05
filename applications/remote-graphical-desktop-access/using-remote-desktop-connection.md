---
description: >-
  Remote Desktop Connection is a Windows/Linux tool which lets you connect to
  your computer's GUI over a network.
---

# Using RDP Remote Desktop Connection

These instructions tell you how to view and control your Windows PC or a Raspberry Pi from a remote location using a Windows computer and Remote Desktop Connection.  Windows 10 Pro and Server versions include the Windows Remote Desktop server.  Most versions of Windows include the Remote Desktop Client which you can use with remote.it to connect to one of these systems.

**Summary:** These instructions show you how to install xrdp on your Raspberry Pi to allow a network connection from a Windows PC running Windows Remote Desktop.  Next, you’ll learn how to configure a remote.it Service that is compatible with xrdp so that you can easily connect to your Pi from outside of your local network.

**Works With:**

* Devices: Windows 10, any Debian-based Linux operating system.
* Clients: Windows 10.

To enable remote.it to make a Remote Desktop Connection to your Windows PC, please read [this article](https://remot3it.zendesk.com/hc/en-us/articles/360021173091-remote-it-Connect-for-Windows-now-available).

{% hint style="info" %}
Why would you want to use RDP on a Linux system when VNC is available?  We can't think of any really important reason other than if you had a combination of Windows and Linux systems and wanted to use the same client software on all of them.
{% endhint %}

#### **Installing the xrdp Windows Remote Desktop service on your Raspberry Pi**

In a terminal window on your Raspberry Pi, run the following commands:

**sudo apt-get update  
sudo apt-get install xrdp**

Next, confirm that xrdp is in fact running with the command:

**ps ax \| grep xrdp**

![](../../.gitbook/assets/image%20%28437%29.png)

You should see something similar to the image above.  The first column of numbers on the left is likely to be different.

#### **Adding a remote.it Service for xrdp**

Run the remote.it configuration script:

**sudo connectd\_installer**

At the Main Menu, install a new remote.it Service for xrdp using **RDP, default port 3389**.

![](../../.gitbook/assets/image%20%28327%29.png)

![](../../.gitbook/assets/image%20%28432%29.png)

When you are done, you will see your rdp Service in the list.

![](../../.gitbook/assets/image%20%2848%29.png)

**Using Remote Desktop Connection with remote.it**

To connect, sign in to your remote.it account and locate the Device you just installed in the Device List.

![](../../.gitbook/assets/image%20%28272%29.png)

Click on the Device Name to open the Device Services dialog box:

![](../../.gitbook/assets/image%20%2814%29.png)

Click on the link of the rdp connection you wish to connect to.  Within a few moments you will see the "TCP Connection" dialog.

![](../../.gitbook/assets/image%20%28330%29.png)

Start the Remote Desktop application, copy and paste the address from the remote.it dialog to the “Computer” field as shown in the example below \(using the values that are displayed when the connection dialog box appears\), then click on “Connect”.

![](../../.gitbook/assets/image%20%28111%29.png)

When you see this dialog, click on "Connect":

![](../../.gitbook/assets/image%20%28322%29.png)

When you see the security warning, click on “Yes” to continue.

![](../../.gitbook/assets/image%20%28120%29.png)

#### **Windows RDP Connection Login**

Select the account you wish to use and enter the password, then click on "OK".  If you wish to choose an account other than "Administrator", click on "More choices".

![](../../.gitbook/assets/image%20%28515%29.png)

#### **Linux RDP Connection Login**

At the **xrdp** login screen, enter your Pi’s user name and password \(default pi/raspberry\), then click on “OK”.

![](../../.gitbook/assets/image%20%28231%29.png)

