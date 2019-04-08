# Add a Service to a LAN application

In addition to supporting remote.it connections to TCP servers on the device itself, remote.it also allows connections to other TCP servers on the LAN.  This is an incredibly powerful feature that lets you make remote.it connections to TCP servers running on other devices on your LAN without having to install any software on them at all.  

There are some limitations: the other devices must have either a static IP or support mdns.

At the Main Menu, select option 2 for "Attach/reinstall a remote.it Service to a LAN application".  The installer asks you for the IP address or mdns address.

![](../../../.gitbook/assets/image%20%2811%29.png)

Let's install a service for the web interface on my router.   This happens to have a static IP address \(here, 192.168.1.1\).  I'll use a web service on port 80.

Now you will see the "Protocol Selection Menu".

![](../../../.gitbook/assets/image%20%2853%29.png)

Select option 2 for web and enter the requested information.  When the list of installed Services redraws, you will see your new remote.it web Service in the table along with the detected LAN application.  It is not possible to detect the program running a LAN application so you will see "OK" here or "not detected".

![](../../../.gitbook/assets/image%20%2844%29.png)

Note that the "LAN Address" for the "Router-UI" remote.it Service shows the IP address you entered.  If you used an mdns address, that would be shown here instead.

Now, when you access your Device at the remote.it web portal, you will see the entry for the LAN application Service alongside your other Services.

![](../../../.gitbook/assets/image%20%2835%29.png)

Clicking on the "Router UI" link now takes you to your router's UI.

![](../../../.gitbook/assets/image%20%28117%29.png)

The interactive installer can be used in a similar way for all types of supported TCP Services on other LAN devices.

