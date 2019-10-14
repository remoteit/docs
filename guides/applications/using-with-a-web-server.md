---
description: Also covers use with web based applications such as LuCI and Node-Red.
---

# Connecting to a web server

These instructions explain how to connect to any http web-based UI or REST interface on your remote Debian Linux PC or Raspberry Pi.  By default, these connections will open as a new tab in the current web browser.

**Summary:** Configure a remote.it Service that is compatible with an http web server to allow you to connect to your PC's web server securely from outside of your local network.

### **Works With:**

* Devices:
  * Any Debian Linux PC, including Raspberry Pi running the [Raspbian ](https://www.raspberrypi.org/downloads/)operating system.
  * Any standard http web server, e.g. apache2, nginx, lighttpd, etc.
* Clients: Windows, Mac OS/X or Linux running Chrome, Firefox, or Safari.

Please note that the Raspberry Pi and many Linux distributions do not install a web server by default. Here are links to some popular Linux web servers:

* [nginx](http://nginx.org/)
* [lighttpd](https://www.lighttpd.net/)
* [apache2](https://httpd.apache.org/)

 Install one of these web servers, or any web server of your choice.

Next, check which port your web server is listening on with the command:

```bash
sudo netstat -lpn | grep tcp
```

This command will show all currently active tcp listeners \(servers\) running on your Linux PC.  Look for the name of your web server in the list.  There may be more than one entry.  The port should match the port you used when setting up your http server \(default is 80\)  Make note of this port number as you will need it in the next section where you will be adding the remote.it Service.

```bash
$ sudo netstat -lpn | grep tcp
[sudo] password for user:
tcp 0 0 127.0.0.1:3306 0.0.0.0:* LISTEN 1796/mysqld
tcp 0 0 0.0.0.0:5900 0.0.0.0:* LISTEN 2623/x11vnc
tcp 0 0 0.0.0.0:80 0.0.0.0:* LISTEN 1835/nginx -g daemo
tcp 0 0 127.0.1.1:53 0.0.0.0:* LISTEN 1860/dnsmasq
tcp 0 0 0.0.0.0:22 0.0.0.0:* LISTEN 1362/dropbear
tcp 0 0 127.0.0.1:631 0.0.0.0:* LISTEN 1176/cupsd
tcp 0 0 0.0.0.0:23 0.0.0.0:* LISTEN 1133/inetd
tcp 0 0 0.0.0.0:7001 0.0.0.0:* LISTEN 15119/mediaserver-b
tcp 0 0 0.0.0.0:37530 0.0.0.0:* LISTEN 15119/mediaserver-b
tcp 0 0 0.0.0.0:1883 0.0.0.0:* LISTEN 1293/mosquitto
tcp6 0 0 :::5900 :::* LISTEN 2623/x11vnc
tcp6 0 0 :::80 :::* LISTEN 1835/nginx -g daemo
tcp6 0 0 :::22 :::* LISTEN 1362/dropbear
tcp6 0 0 ::1:631 :::* LISTEN 1176/cupsd
tcp6 0 0 :::1883 :::* LISTEN 1293/mosquitto
$
```

There should be a line beginning with `tcp` - meaning TCP version 4 - that is on port 80 \(`0.0.0.0:80`\) associated with nginx, as well as a line beginning with "tcp6" on port 80 \(`:::80`\) also associated with nginx.  This confirms that your web server is present.  

Some web server applications such as apache2 do not show the "tcp" port, while they do display the "tcp6" port.  They still work on TCP version 4, but will show a warning in the installer menu.

## **Adding a remote.it Service to your web server**

Run the remote.it configuration script:

```bash
sudo connectd_installer
```

At the Main Menu, install a new remote.it Service Attachment for http using the default port of 80.  If the actual port in use is not 80, you will have the opportunity to change this during the installation.

 ![](https://remot3it.zendesk.com/hc/article_attachments/115000328051/blobid0.png)

When you’ve successfully installed your web server and the remote.it http Service, the Main Menu will include an entry for your web server as shown above. Note that some web server applications may show a "not detected" warning here, in spite of working fine. 

## **Making a connection to your web server using remote.it** 

To connect, sign in to your remote.it account and locate the device on the Device page.  Click on the highlighted Device Name to open the Device Services dialog:

![](../../.gitbook/assets/image%20%289%29.png)

Find the name of the web \(http\) Service you installed in the Device Services dialog.

![](../../.gitbook/assets/image%20%28128%29.png)

Click on the highlighted service name to initiate the connection.  In a few seconds a new browser tab will open showing you the default web page of your web server. 

![](https://remot3it.zendesk.com/hc/article_attachments/360018172892/mceclip2.png)

## Connecting to an https \(Secure\) server

When choosing the protocol during Service installation, choose the option for "Secure Web".

When you connect to a remote.it Service, you will encounter a few browser warnings due to certificate issues.  This is normal.  Click on "Advanced Mode" to connect to your web site.

In some cases it may be necessary to set the URL header to "https".

