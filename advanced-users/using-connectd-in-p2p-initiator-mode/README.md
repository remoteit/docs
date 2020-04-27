---
description: >-
  How to use the connectd daemon on your computer to create a peer-to-peer (P2P)
  connection.
---

# Using connectd in P2P initiator mode

{% page-ref page="../../peer-to-peer-p2p-vs.-proxy-connections/" %}

### Initiators and targets

The **initiator** **device** of a P2P connection is the device that initiates a remote.it connection.  In this example, we expect that the initiator device will be your Mac or Linux PC.

The **target device** is the device which accepts the remote.it P2P connection from the initiator.  The target device will usually be something like a Raspberry Pi or other embedded device but could be any device, including, for example, a cloud-based virtual machine.

### Configure a device to be the target

Whether you wish to connect to a device using a P2P connection on your computer, or using a proxy connection through the remote.it portal, you first need to configure remote.it Services on the target device using the interactive installer. 

{% page-ref page="../../adding-remote.it-to-your-device/using-the-interactive-installer/" %}

### Get the UID of the remote.it Service you wish to connect to

{% page-ref page="where-do-i-find-the-uid-for-my-service.md" %}

### **Choose your OS**

{% page-ref page="connectd.md" %}

{% page-ref page="using-connectd-in-client-mode-on-windows.md" %}

