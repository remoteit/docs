# Plan what you want to connect to

remote.it lets you make secure remote connections to TCP based services on your device.  Most users start with an SSH connection to port 22, which gives you remote console access.  

You can also install services for:

* http based web server or application \(default port 80\)
* https based web server or application \(default port 443\)
* VNC server \(Virtual Network Console, a remote graphical desktop system\) \(default port 5900\)
* nxWitness \(remote video application\) on port 7001
* any other TCP based service on any port

The remote.it installer does not install or manage any of the server applications listed above.  Most systems at least support ssh and scp \(secure remote console and file transfer\) by default.  Beyond that you will usually have to install the application yourself.

#### Connecting to "LAN Applications"

We define a "LAN Application" as a TCP service that is running on a different device on your LAN.  For example, the web UI on your router is an example of a "LAN application".  Using the "LAN Application" option allows you to access TCP servers on your LAN without needing to install the remote.it connectd package on the device itself.

For a LAN application, you will need to know the device's IP address \(which should be static or otherwise fixed, for example using "DHCP Reservation" or a similar feature on your router.  Another possibility is to use mdns.

#### Configuring SSH and VNC on the Raspberry Pi

The Raspberry Pi uses the "raspi-config" program to enable or disable SSH and VNC.

_sudo raspi-config_

![Choose option 5, &quot;Interfacing Options&quot;](../../.gitbook/assets/image%20%28181%29.png)

Next you can enable or disable SSH or VNC.  We recommend that you not disable SSH, and you can use VNC if you want to have access to the graphical desktop.  By default Raspbian Stretch installs RealVNC server on port 5900.

![](../../.gitbook/assets/image%20%28166%29.png)

On all Linux systems, you can use the following command to show active tcp servers which you can connect to.

_sudo netstat -lpn \| grep tcp_

![](../../.gitbook/assets/image%20%28108%29.png)

Lines beginning with "tcp" represent ipV4 services, while those marked tcp6 are compatible with ipV6.  

For tcp servers, the port is indicated by:

&lt;interface&gt;:port

&lt;interface&gt; might represent a specific hardware interface on the device.  Most often it is set to "0.0.0.0" which means "all interfaces".

This example shows these applications were detected:

* mosquitto on port 1883
* vncserver-x11 on port 5900
* nginx on port 80
* sshd on port 22

Usually, there is a line corresponding to an application for both tcp and tcp6.  In this example, all of the applications just above have matching entries in tcp6.  Sometimes, as in this case with "xrdp", you will see a port assignment for tcp6 that is not matched by one for tcp.  However, the tcp \(ipV4\) server is in fact available.  To be sure, you can try connecting to this port using your device's IP address on the LAN \(that is, without using remote.it\).

These are the port numbers that you will need to use when running the interactive installer.

