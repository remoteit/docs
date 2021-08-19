# Overview

remote.it allows you to make secure remote connections between two computers. Some of the benefits include:

* Crossing multiple NATs/firewalls
* Using a single TCP port
* **portforwardless:** without requiring port forwarding in the router, significantly reducing your network's vulnerability
* Many TCP-based protocols and applications are supported
  * SSH/SCP - [network console and file transfer](https://support.remote.it/hc/en-us/sections/360009162531-Remote-console-and-file-transfer)
  * VNC, RDP, Mac Screen Sharing - [remotely access the Graphical User Interface \(GUI\)](https://support.remote.it/hc/en-us/categories/360001173912-Applications)
  * http/https \(web servers and applications such as node-red\)
  * SMB \(Samba\) file sharing
  * other protocols supported under the "custom TCP" option, e.g. MQTT

{% hint style="info" %}
We are in the process of adding more to our developer documentation. Can't find what you are looking for? [Please contact us](http://support.remot3.it).
{% endhint %}

## The remote.it components

### remoteit Service Agent

remoteit is the component that is installed on the devices which will be connected. In the case of a peer to peer connection, remoteit will be installed on the connection initiating device as well. You can also interact with remoteit to run network diagnostics and troubleshoot other issues with your device.

### Installation Packages

remote.it supports installation of a desktop application, CLI or just connectd on multiple platforms and architectures.

The [**Desktop**](https://link.remote.it/support/desktop-overview) application provides a UI to interact with your devices which includes configuration, connections, and event logs. This is the easiest application for technical and non-technical users.

The [**CLI**](cli/overview.md) provides a local command line interface to the device to which it is installed. This includes configuration, connections, status, and some debugging tools. This is useful when a UI is not needed, however you may also need to use some API requests to use some of the functions such as connections.

The [**Device Package**](device-package/installation.md) installs the Target Service Daemon component. This is useful when a UI is not needed and a small footprint on the device is needed. For example, an embedded device with limited storage.

### APIs

APIs are the backbone of the applications and provide ways to view and manage your remote.it account as well as your devices, connections, and event logs. Further details on the APIs can be found [here](api-reference/overview.md).

