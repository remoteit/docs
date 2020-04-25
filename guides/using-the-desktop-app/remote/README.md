---
description: >-
  The Remote view shows all of the Devices in your account and lets you search
  for and select one to make a connection.
---

# Devices

Here you will ﬁnd all the devices you have access to. You can search, sort, and refresh your devices with the tools at the top of the page. Below that you will see all your devices displayed, either in alphabetical order or by device state.

Next to each device you can see the number of services \(by the dashed underscores\) and the connection state of the services \(blue is active, green is online but not connected, grey is offline\).

![](../../../.gitbook/assets/image%20%28296%29.png)

Hover your mouse pointer over the dashes to access the individual Services on your Device. The Service name will pop up as a tool tip as shown. Clicking on the dash will take you to a screen where you can create and use your connection.

Click on a device to connect to and manage its Services.

![](../../../.gitbook/assets/image%20%28422%29.png)

* If a Service is online and has already been connected, the blue "Disconnect" button will be shown.
* If a Service is online and not yet connected, the green "Connect" button will be shown.
* If a Service is offline, the button will display "Offline".

## Device Details

* Device ID: this is a unique identifier for each service in your account.  This is set at the time you register each service.
* Hardware ID - this value is unique per Device, or group of Services.  It is used to group the Services on a Device together.
* Internal IP: the current device's LAN IP address
* External IP: the current device's public IP address

## Service Details

Click on a Service name or the arrow on the right side to open the Service Details view.

## Before Connecting

![](../../../.gitbook/assets/image%20%2844%29.png)

* Port is the port value to use with the Bind IP address. 
* Bind IP address is used together with the Port to create the connection at &lt;Bind IP Address&gt;&lt;Port&gt;, e.g. 127.0.0.1:34000.  The remote.it daemon creates the remote connection using localhost.
* The Connection Name is the full name of the remote Service that you are currently connected to.  The full name appends the Service Name to the Device Name.
* The launch URL is a configurable string that lets you format the command line for launching the service to your needs via the browser.    This requires support in your browser, which works better on macOS than Windows for some applications.
* Local Network Sharing, when enabled, allows other computers on the LAN to connect to your IP address in order to share a remote.it connection.  Leave it turned off to block this feature.
* "Reconnect on Disconnect" will automatically attempt to reestablish a connection which drops due to a disruption of the network connection.
* The Raw Connection Log may be requested by our Support in the event you have any trouble connecting.

## After connecting

Additional information will be shown and some values will be updated.

* URL is the path to your remote connection.  
* Duration shows how long this connection has been active.
* Throughput shows the current short term average data rate in both directions.

![](../../../.gitbook/assets/image%20%28313%29.png)

