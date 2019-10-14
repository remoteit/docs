---
description: Using the most common TCP services with remote.it
---

# Applications

After you make a connection, you'll want to use it in your client application.  Here are several articles which describe using remote.it with the most popular applications.

By far the most common application to use with remote.it is SSH, or network console.  SSH gives you direct access to your device's command line.  SSH also enables SCP and SFTP file transfer.

{% page-ref page="remote-console-and-file-transfer/connecting-to-ssh.md" %}

{% page-ref page="remote-console-and-file-transfer/using-scp-command-line-for-secure-file-transfer.md" %}

{% page-ref page="remote-console-and-file-transfer/using-third-party-ssh-scp-applications.md" %}

VNC is "Virtual Network Client" which gives you access to your Linux device's graphical desktop, if it is running one.

{% page-ref page="remote-graphical-desktop-access/using-realvnc-on-raspberry-pi.md" %}

{% page-ref page="remote-graphical-desktop-access/using-tightvnc-on-debian.md" %}

RDP \(Remote Desktop Protocol\) is similar to VNC although it is typically used on Windows systems.

{% page-ref page="remote-graphical-desktop-access/using-remote-desktop-connection.md" %}

A web, or http connection should be used for any browser based application, such as:

* A web browser
* LuCI administrator UI on OpenWRT
* PiHole DNS ad blocker
* node-red

{% page-ref page="using-with-a-web-server.md" %}



Samba lets you access Windows drives on a LAN from a Linux PC

{% page-ref page="samba-windows-file-sharing-for-linux.md" %}

