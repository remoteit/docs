# Using remote.it with RealVNC and the Raspberry Pi

These instructions explain how to view and control your Raspberry Pi’s graphical desktop from a remote location using RealVNC.

#### **Enabling VNC on the Pi**

In a terminal window on your Raspberry Pi, run the following commands:

**sudo raspi-config**

Then select 5 Interfacing Options &gt; P3 VNC &gt; Yes

You have now enabled VNC on your Raspberry Pi.

#### **If you are using a non-Raspbian Debian OS**

In a terminal window on your Linux PC, run the following commands:

**sudo apt-get update**

**sudo apt-get install realvnc-vnc-server**

#### **To use Flash VNC**

If you wish to use the Flash \(browser\) VNC option on Windows or Screen Sharing on Mac, then "VNC authentication" mode needs to be set. You can use RealVNC server with RealVNC viewer without configuring VNC authentication.  The default setting “UNIX Authentication” should work OK.

Open your Raspberry Pi’s GUI \(either using the hardware video output connected to a monitor or using RealVNC viewer with the Pi's LAN address\). Now, to set the VNC authentication mode, click on the VNC icon in the upper right hand corner.

![VNC\_Icon.png](https://remot3it.zendesk.com/hc/article_attachments/360006090892/VNC_Icon.png)

Next, click the 3-line button in the right hand corner, and click “Options”.

![Choose\_options.png](https://remot3it.zendesk.com/hc/article_attachments/360006128751/Choose_options.png)

Under “Security”, change the “UNIX Authentication” to “VNC password”. Setting this password allows Flash VNC and Mac screen sharing to work.

![Choose\_\_VNC\_Password\_.png](https://remot3it.zendesk.com/hc/article_attachments/360006128811/Choose__VNC_Password_.png)

To set this password, Go to “Users & Permissions”. Then click “Password” on the right-hand side. Then enter a password. You will use this when using Flash VNC and Mac Screen Sharing.

![Change\_password.png](https://remot3it.zendesk.com/hc/article_attachments/360006128831/Change_password.png)

Then click “Ok”.

\* If the screen is too zoomed in to select “Ok” you must zoom out. You can do this by entering the command _sudo raspi-config_ into the terminal of your Pi. Then select 7 Advanced Options &gt; A5Resolution &gt; DMT Mode 85

Also see [this article from the Pi Foundation](https://www.raspberrypi.org/documentation/remote-access/vnc/) which describes how to set the VNC Authentication mode using command line only.

**Adding a remote.it Service for RealVNC**

Run the remote.it interafctive installer.

{% page-ref page="../../using-the-interactive-installer/" %}

At the Main Menu, select "3" for VNC.

Install a new remot3.it Service for VNC using the default port of 5900.  If the port in use is not 5900, you will have the opportunity to change this during the installation.

When you’ve successfully added the remote.it Service for RealVNC, the list of "Installed remote.it Services" which appears above the Main Menu will include an entry for **vncserver-x11-c** as shown below.

![](../../.gitbook/assets/image%20%288%29.png)

 **Making a VNC connection using remot3.it**

To connect, sign in to your remote.it account and locate the device.  Click on the highlighted Device Name to open the Device Services dialog:

![remote.it\_Find\_device.png](https://remot3it.zendesk.com/hc/article_attachments/360006091132/remote.it_Find_device.png)

Now click on the name of the Service you just installed in the Device Services List.

![remote.it\_Find\_RealVNC.png](https://remot3it.zendesk.com/hc/article_attachments/360006128871/remote.it_Find_RealVNC.png)

Click on the service name to initiate the connection.  In a few seconds you’ll see a dialog box similar to this:

![VNC\_Connection\_Options.png](https://remot3it.zendesk.com/hc/article_attachments/360006128911/VNC_Connection_Options.png)

**For Option 1:**

Close the menu by clicking the “X” in the upper right corner.  You may see a dialog asking whether you wish to allow Flash to run.  You should allow Flash to run. Next, enter your VNC password and click on “Send” to continue.

**For Option 2:**

Click on the link provided in the second option, which will open a Safari Window. Allow Screen Sharing to occur. Enter your VNC password when prompted. 

**For Option 3:**

Start the RealVNC viewer application, then copy and paste the address from the remot3.it dialog option \#3 to the “Remote Host” field as shown below. Now, click on “Connect”.

![VNC\_copy\_and\_waste\_address.png](https://remot3it.zendesk.com/hc/article_attachments/360006130111/VNC_copy_and_waste_address.png)

When you see the VNC Authentication dialog, enter your VNC password and click on “OK” to continue.

![Screen\_Shot\_2018-06-06\_at\_11.52.09\_AM.png](https://remot3it.zendesk.com/hc/article_attachments/360006130171/Screen_Shot_2018-06-06_at_11.52.09_AM.png)

Now you are controlling your Raspberry Pi’s GUI!

