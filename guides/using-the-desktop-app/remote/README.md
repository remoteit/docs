---
description: >-
  The Remote view shows all of the Devices in your account and lets you search
  for and select one to make a connection.
---

# Devices

Here you will ﬁnd all the devices you have access to. You can search, sort, and refresh your devices with the tools at the top of the page. Below that you will see all your devices displayed, either in alphabetical order or by device state.

Next to each device you can see the number of services \(by the dashed underscores\)  and the connection  state of the services \(blue is active, green is online but not connected, grey is offline\).

![](../../../.gitbook/assets/image%20%2882%29.png)

Hover your mouse pointer over the dashes to access the individual Services on your Device.  The Service name will pop up as a tool tip as shown.  Clicking on the dash will take you to a screen where you can create and use your connection.

![](../../../.gitbook/assets/screen-shot-2020-03-26-at-8.15.52-am.png)

Click on a device to connect to and manage its Services.

![](../../../.gitbook/assets/image%20%28108%29.png)

#### Device Details

* Device ID: this is a unique identifier for each service in your account.  This is set at the time you register each service.
* Hardware ID - this value is unique per Device, or group of Services.  It is used to group the Services on a Device together.
* Internal IP: the current device's LAN IP address
* External IP: the current device's public IP address

#### Service Details

Click on a Service name or the arrow on the right side to open the Service Details view.

![](../../../.gitbook/assets/image%20%28290%29.png)

#### Before Connecting

![](../../../.gitbook/assets/image%20%28268%29.png)

* Port is the port value to use with the Bind IP address. 
* Bind IP address is used together with the Port to create the connection at &lt;Bind IP Address&gt;&lt;Port&gt;, e.g. 127.0.0.1:34000.  The remote.it daemon creates the remote connection using localhost.
* The Connection Name is the full name of the remote Service that you are currently connected to.  The full name appends the Service Name to the Device Name.
* The launch URL is a configurable string that lets you format the command line for launching the service to your needs via the browser.    This requires support in your browser, which works better on macOS than Windows for some applications.

  ![](../../../.gitbook/assets/image%20%28133%29.png)

* Local Network Sharing, when enabled, allows other computers on the LAN to connect to your IP address in order to share a remote.it connection.  Leave it turned off to block this feature.
* "Reconnect on Disconnect" will automatically attempt to reestablish a connection which drops due to a disruption of the network connection.
* The Raw Connection Log may be requested by our Support in the event you have any trouble connecting.

#### After connecting

Additional information will be shown and some values will be updated.

* URL is the path to your remote connection.  
* Duration shows how long this connection has been active.
* Throughput shows the current short term average data rate in both directions.

![](../../../.gitbook/assets/image%20%28272%29.png)

### SSH Connections

* The SSH username is a user-configurable login name that will be included in the connection login string.  This setting only appears on SSH connections.  

![](../../../.gitbook/assets/image%20%28314%29.png)

* When you select the clipboard icon, the SSH string, including the supplied SSH Username, is copied to the clipboard.  You can then paste it into a terminal or command prompt to initiate an SSH connection.

![](../../../.gitbook/assets/image%20%28365%29.png)

* This is the "SSH string":

```text
ssh -l pi 127.0.0.1 -p 33002 -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile /dev/null"
```

* Pasting that into a Windows 10 command prompt gives:

```text
C:\Users\me>ssh -l pi 127.0.0.1 -p 33002 -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile /dev/null"
Warning: Permanently added '[127.0.0.1]:33002' (ECDSA) to the list of known hosts.
pi@127.0.0.1's password:
Linux raspberrypi 4.19.97-v7l+ #1294 SMP Thu Jan 30 13:21:14 GMT 2020 armv7l

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
Linux raspberrypi 4.19.97-v7l+ #1294 SMP Thu Jan 30 13:21:14 GMT 2020 armv7l

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Tue Mar 24 07:31:50 2020
pi@raspberrypi:~ $
```

You can use the SSH string in Linux and Mac terminal as well.

### VNC Connections

* When you select the clipboard icon, the VNC string is copied to the clipboard.  You can then paste it into your VNC application.

![](../../../.gitbook/assets/image%20%28173%29.png)

* This is the VNC string:

```text
127.0.0.1:33003
```

* This can be copied and pasted into the address bar of the RealVNC Viewer application.

![](../../../.gitbook/assets/image%20%2839%29.png)

* Provide the username and password to complete the VNC connection.

![](../../../.gitbook/assets/image%20%2824%29.png)

![](../../../.gitbook/assets/image%20%28324%29.png)

### Web connections

Select the arrow to launch the connection URL directly in your default browser.

![](../../../.gitbook/assets/image%20%28428%29.png)

![](../../../.gitbook/assets/image%20%28100%29.png)

