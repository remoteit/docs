# Using TightVNC on any Debian OS

These instructions explain how to view and control your Debian Linux machine’s graphical desktop from a remote location using TightVNC Viewer. [TightVNC Viewer](http://www.tightvnc.com/) is free and can be installed on Windows, Mac OS X and Linux machines.

While **tightvncserver** can be installed on a Raspberry Pi running the Raspbian OS, we suggest that you use the RealVNC Server pre-installed on the latest versions of Raspbian.

Install **tightvncserver** on your Debian Linux machine to allow a network connection to its graphical desktop from a Windows, Mac, or Linux machine running TightVNC Viewer.  Next, you’ll learn how to configure a remote.it Service that is compatible with **tightvncserver** so that you can easily connect to your machine's GUI from outside of your local network.

**Works With:**

* Devices: Any Debian Linux machine, including Raspberry Pi running the [Raspbian ](https://www.raspberrypi.org/downloads/)operating system.
* Clients: Windows, Mac OS/X or Linux running [TightVNC ](http://www.tightvnc.com/)Viewer.

### **Installing the TightVNC server Virtual Network Console on your Debian device**

In a terminal window on your Debian Family Linux machine, run the following commands:

```bash
sudo apt-get update
sudo apt-get install tightvncserver
```

Next, launch **tightvncserver** with the command:

```text
tightvncserver :1
```

**tightvncserver** will launch and ask you for a password, which you will use later for connection.  You may also enter a different read-only password which will let you view the Linux machine's graphical desktop but not interact with it.

Next, confirm that **tightvncserver** is in fact running with the command:

```bash
ps ax | grep tightvnc
```

Next, check which port **tightvncserver** is listening on with the command:

```bash
sudo netstat -lpn | grep tcp 
```

This command will show all currently active tcp listeners \(servers\) running on your Linux machine. Look for **Xtightvnc** in the list.  There may be more than one entry.  If so, choose the one with the lowest port number.  In the example shown below, that is port 5901.  Make note of this port number as you will need it in the next section where you will be adding the remote.it Service Attachment.

![](../../../.gitbook/assets/image%20%2833%29.png)

### **Adding a remote.it Service Attachment for tightvncserver**

Run the remote.it configuration script:

```bash
sudo connectd_installer
```

At the Main Menu, install a new remote.it Service for VNC.  If the actual port in use is not 5901, you will have the opportunity to set this during the installation.

![](../../../.gitbook/assets/image%20%28312%29.png)

When you’ve successfully installed **tightvncserver** and the remote.it **VNC** Service, the Main Menu will include an entry for **Xtightvnc** as shown above.

##  **Making a VNC connection using remote.it**

To connect, sign in to your remote.it account and locate the device in Devices view.  

![](../../../.gitbook/assets/image%20%28166%29.png)

Click on the highlighted Device Name to open the Device Services dialog:

![](../../../.gitbook/assets/image%20%28320%29.png)

Now click on the highlighted Service Name to initiate the connection.  In a few seconds you’ll see a dialog box similar to this:

![](../../../.gitbook/assets/image%20%2878%29.png)

### **For Option 1:**

Close the menu by clicking the “X” in the upper right corner.  You may see a dialog asking whether you wish to allow Flash to run.  You should allow Flash to run. Next, enter your VNC password and click on “Send” to continue.

### **For Option 2:**

Click on the link provided in the second option, which will open a Safari Window. Allow Screen Sharing to occur. Enter your VNC password when prompted. 

### **For Option 3:**

Start the TightVNC viewer application, then copy and paste the address from the remot3.it dialog option \#3 to the “Remote Host” field as shown below. Now, click on “Connect”.

![](../../../.gitbook/assets/image%20%28100%29.png)

When you see the VNC Authentication dialog, enter your VNC password and click on “OK” to continue.

![](../../../.gitbook/assets/image%20%28103%29.png)

Now you are connected remotely to your device's UI.

