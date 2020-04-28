---
description: >-
  How to allow remote access and management of a network through a secondary
  Internet connection using remote.it.
---

# Out of Band Management \(OOBM\)

## What is Out of Band Remote Access?

**Conventional remote access involves connecting to a network through it's primary gateway, typically by connecting to a global public IP address through a specific port, ideally through a secure connection. This is an In-band management solution.**

**As the name implies, Out of Band Management \(OOBM\) allow for remote access through a secondary Internet connection, where this secondary connection is only used for remote access and management. More specifically, although there is an Internet connection that exists on the network, because it is not functioning as the primary gateway, it cannot be used by resources on the network to go out to the Internet.  This concept is perhaps best shown where OOBM is used to remotely access an otherwise private network.**

In the example above, since the router is not connected to the Internet, it is private network with no global public IP address to allow it to be accessed for remote management. One of the clients on the network is a Raspberry Pi configured with the remoteitPi image, which includes the OOBM capability. In the standard configuration, the RaspberryPi's Ethernet network connection is a client onto the private network, while the RaspberryPi's wi-fi interface is used for the OOBM interface.  By default, if this wi-fi interface detects a wi-fi network with the SSID remote.it, then OOBM mode will automatically be enabled.

**Once OOBM mode is enabled, remote access to the LAN is possible. For example, by using the Internet connectivity provided by a mobile phone which is being used as the Hot-spot to provide a wi-fi connection to a Raspberry Pi.**

{% hint style="info" %}
**Note:** Although there is now an Internet connection on the network, this connection is NOT serving as a Internet gateway. The same goes for the equipment on the network, they still do NOT have Internet connectivity. 
{% endhint %}

**In a nutshell, OOBM is a term used to describe a method used to access a remote LAN through a secondary WAN connection that bypasses the primary internet gateway at the remote LAN. It is a way to manage your network equipment with a separate internet connection, so that if your main internet connection goes down you can still connect and carry out various tasks like damage assessment or control.** 

**When the Out of Band indicator lights up on your desktop app, it simply means that you have more than one network connected to your Device.**

**If the OOB indicator is active and one of the networks connected to your Device was to stop functioning, you could still use remote.it to connect to your device because it is still connected to a network.**

![Out of Band Management is unavailable](../../.gitbook/assets/oob-1%20%281%29.png)

![Out of Band Management is available](../../.gitbook/assets/oob-2.png)

{% hint style="info" %}
Please be aware that the OOB Indicator currently only appears on Linux systems.
{% endhint %}

In addition, the OOB path into the remote LAN is an “inbound only” WAN connection and does NOT provide an internet gateway function to other devices on the remote LAN. 

**For example:** During a service outage on the primary internet gateway, a second WAN connection \(using a cellular router for example\) is used to access the remote LAN and  provide a backup, or failover, connection into the remote LAN without acting as an internet gateway to other devices on the remote LAN.

Another form of OOB refers to the remote access of remote LANs that normally have no internet connection. In this scenario, a remote cellular connection provides temporary in-bound access to the remote LAN without serving as an internet gateway for other devices on the remote LAN.

In-band Management is simple, as you only need to create and maintain one network. However, it is potentially less secure because you are mixing all your network traffic together. This means that any attack could compromise user data as well as the management and integrity of your network. Another disadvantage is if your network goes down you lose communications with the devices and servers and can no longer manage them remotely.

The advantage of an Out of Band network is that you are separating your network traffic, so that you are not as vulnerable to attacks. This is because the Management Plane is separate and secure. If your main network goes down for any reason, you can still remotely manage your devices to do things such as damage control. 

Also, you can configure and manage your devices without the need to set up the Data Plane. The of OOB disadvantage is the extra time and cost of setting up a separate network dedicated only to managing your network and devices. With remote.it, however, setting up an OOB Management system is much easier and more cost effective.

You can utilize remote.it with OOB Management to have separate connections all going into one device, so if one of those connections goes down you can still connect to the machine.

