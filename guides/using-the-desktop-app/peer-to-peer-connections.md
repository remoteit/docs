---
description: Learn how to create Peer to Peer Connections using the Desktop Application.
---

# Peer to Peer Connections

## Why Peer to Peer?

Using Peer to Peer Connections \(P2P\) has many advantages, including persistent connections, faster connection times, no timeouts, faster data throughput, and more security. 

To learn more about Peer to Peer Connections, please visit our Technology Overview:

{% page-ref page="../../peer-to-peer-p2p-vs.-proxy-connections/peer-to-peer-connections.md" %}

## Creating P2P Connections

Creating Peer to Peer connections using remote.it is now faster and easier thanks to the Desktop App. 

In remote.it there are devices and services. Services are hosted through devices, and are what remote.it connects to. To create a service, [**download**](https://github.com/remoteit/desktop/releases/latest) ****the desktop app on your chosen device and sign in.

![Sign in using your remote.it information](../../.gitbook/assets/1%20%282%29.png)

Next, navigate to the Hosted tab. Here you can register the device and add services. After you've given your device a name and registered it, you may add services. 

You can add your own custom service by pressing Add, or remote.it can scan for your service. Click Scan for services or navigate to the network tab to find services running on your network.

![After registering your device, add a service using one of the options](../../.gitbook/assets/2%20%283%29.png)

Once you add a service, you will prompted to fill in the appropriate information if it is needed. You can add many services, with TCP, VNC, SSH, and RDP being just a few examples. If you want to add a service on your devices local address, you can leave the Host Address form blank.

![Click the blue checkmark to add your new service](../../.gitbook/assets/3%20%281%29.png)

Once your service is added, you are now ready to connect to it from anywhere using a Peer to Peer Connection!

## Making P2P Connections

The next step is to connect to a service, and doing so through the Desktop App is very straightforward. First, [**download**](https://github.com/remoteit/desktop/releases/latest) the app on the device you want to connect from. Then, launch it, sign in, and navigate to either the Connections tab or the Remote tab.

### Connections Tab

Let's go over the Connections tab first. Here you can see all your possible connections to services, as well as info such as what user owns the service and the address of the connection. Just press Connect to connect to a service, or click on one to see more information.

![An example Connections tab](../../.gitbook/assets/4.png)

### Remote Tab

While in the Connections tab you can only see services, here you can see the actual devices that the services are being hosted through. You can search and sort the devices at the top. The icons next to each device display their state, while the bars on the right display how many services each device has, as well as their states.

To connect to a service in this page, click on the device that the target service is being host through. Then simply click Connect.

![An example Remote tab](../../.gitbook/assets/5%20%282%29.png)

{% page-ref page="../../troubleshooting-connections.md" %}

