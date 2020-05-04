# Using RealVNC on a Raspberry Pi

These instructions explain how to view and control your Raspberry Pi’s graphical desktop from a remote location using RealVNC.

## **Enabling VNC on the Pi**

In a terminal window on your Raspberry Pi, run the following commands:

```bash
sudo raspi-config
```

Then select `5 Interfacing Options > P3 VNC > Yes`

You have now enabled VNC on your Raspberry Pi.

### **Using on a non-Raspbian Debian OS**

In a terminal window on your Linux PC, run the following commands:

```bash
sudo apt-get update
sudo apt-get install realvnc-vnc-server
```

### **Using with Flash VNC**

If you wish to use the Flash \(browser\) VNC option on Windows or Screen Sharing on Mac, then "VNC authentication" mode needs to be set. You can use RealVNC server with RealVNC viewer without configuring VNC authentication.  The default setting “UNIX Authentication” should work OK.

Open your Raspberry Pi’s GUI \(either using the hardware video output connected to a monitor or using RealVNC viewer with the Pi's LAN address\). Now, to set the VNC authentication mode, click on the VNC icon in the upper right hand corner.

![](../../.gitbook/assets/image%20%28300%29.png)

Next, click the 3-line button in the right hand corner, and click “Options”.

![](../../.gitbook/assets/image%20%28112%29.png)

Under “Security”, change the “UNIX Authentication” to “VNC password”. Setting this password allows Flash VNC and Mac screen sharing to work.

![](../../.gitbook/assets/image%20%28429%29.png)

To set this password, Go to “Users & Permissions”. Then click “Password” on the right-hand side. Then enter a password. You will use this when using Flash VNC and Mac Screen Sharing.

![](../../.gitbook/assets/image%20%28456%29.png)

Then click “Ok”.

{% hint style="info" %}
If the screen is too zoomed in to select “Ok” you must zoom out. You can do this by entering the command `sudo raspi-config` __into the terminal of your Pi. Then select 7 Advanced Options &gt; A5Resolution &gt; DMT Mode 85
{% endhint %}

Also see [this article from the Pi Foundation](https://www.raspberrypi.org/documentation/remote-access/vnc/) which describes how to set the VNC Authentication mode using command line only.

## **Adding a remote.it Service for RealVNC**

First, run the remote.it interactive installer.

{% page-ref page="../../adding-remote.it-to-your-device/using-the-interactive-installer/" %}

At the Main Menu, select `3` for VNC.

Install a new remot3.it Service for VNC using the default port of 5900.  If the port in use is not 5900, you will have the opportunity to change this during the installation.

When you’ve successfully added the remote.it Service for RealVNC, the Main Menu will include an entry for **x11vnc** \(or similar\) as shown below.  This shows the name of the process that was found listening to the specified port.

![](../../.gitbook/assets/image%20%28489%29.png)

##  **Making a VNC connection using remot3.it**

To connect, sign in to your remote.it account and locate the device in "Devices".  Click on the highlighted Device Name to open the Device Services dialog:

![](../../.gitbook/assets/image%20%28408%29.png)

Now click on the name of the Service you just installed in the Device Services List.

![](../../.gitbook/assets/image%20%28176%29.png)

Click on the service name to initiate the connection.  In a few seconds you’ll see a dialog box similar to this:

![](../../.gitbook/assets/image%20%2887%29.png)

### **For Option 1:**

Close the menu by clicking the “X” in the upper right corner.  You may see a dialog asking whether you wish to allow Flash to run.  You should allow Flash to run. Next, enter your VNC password and click on “Send” to continue.

### **For Option 2:**

Click on the link provided in the second option, which will open a Safari Window. Allow Screen Sharing to occur. Enter your VNC password when prompted. 

### **For Option 3:**

Start the RealVNC viewer application, then copy and paste the address from the remot3.it dialog option \#3 to the “Remote Host” field as shown below. Now, click on “Connect”.

![](../../.gitbook/assets/image%20%28224%29.png)

When you see the VNC Authentication dialog, enter your VNC password and click on “OK” to continue.

![](../../.gitbook/assets/image%20%28510%29.png)

Now you are controlling your Raspberry Pi’s GUI!

