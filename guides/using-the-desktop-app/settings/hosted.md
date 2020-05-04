---
description: Use this option to add remote.it Services to the current Windows or Mac PC.
---

# Set up remote access

On the Settings page, click on "Set up remote access":

![](../../../.gitbook/assets/image%20%28417%29.png)

In the displayed page, you can register and add Services to your local Device. Note that some commonly used services have been located and may be pre-selected.  If you don't want to register Services on any particular port\(s\) at this time, deselect the appropriate checkbox.  You can always manage installed Services later.

![](../../../.gitbook/assets/image%20%28442%29.png)

The remote.it Admin Panel allows you to connect to this configuration application remotely using a web browser.  

![](../../../.gitbook/assets/image%20%2814%29.png)

Choose a name and click the **Register** button. At this point, you may be asked to enter your administrator information.  Afterwards, you'll see a progress indicator until the registration completes.

![](../../../.gitbook/assets/image%20%28160%29.png)

After you've registered your Device and any preselected Services, you can manage your existing Services by editing the details \(just click on the field you wish to change\).  

![](../../../.gitbook/assets/image%20%28405%29.png)

In addition, you can add your own custom service or use the network scanner to automatically ﬁnd services on the LAN or your Device. There are many different kinds of Services you can add. 

* SSH - console access for Linux, Mac, and Windows \(may require setup on Mac and WIndows\)
* VNC - remote GUI access for all platforms - include macOS Screen Sharing
* RDP - Windows Remote Desktop Protocol 
* HTTP or HTTPS \(web servers\)
* TCP \(select this option if you can't find something more specific to work with your application\). 

#### Add from network

To scan your network for Services, click on "Add from Network".  This can take a few minutes if you have a lot of devices on your LAN.

![](../../../.gitbook/assets/image%20%28286%29.png)

If you have more than one active network adapter, you can choose which one to scan.

When the scan completes, you'll see IP addresses for devices which have active TCP listeners detected.

![](../../../.gitbook/assets/image%20%28214%29.png)

Clicking on the down arrow expands to show the list of detected services on that device.

![](../../../.gitbook/assets/image%20%2835%29.png)

Click "Add" to add a connection Service here. 

{% hint style="info" %}
Adding a Service on this Device to a LAN address is different than connecting to a Service installed on the Device at that LAN address.  The Services you add on this screen will only be active when this Device is running, the remote.it Desktop application is active, and connected to the internet.
{% endhint %}

#### Add manually

To add a Service manually, meaning that you need to know the IP address and port ahead of time, click on "Add Manually". 

![](../../../.gitbook/assets/image%20%28374%29.png)

Give the new Service a name and select the Service type. A typical value for the port will be ﬁlled in automatically, however you can change the port and/or host address if you wish. Then click the blue check mark to save this Service.



