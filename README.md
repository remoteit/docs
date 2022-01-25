# Get Started

{% hint style="info" %}
We are in the process of adding more to our developer documentation. Can't find what you are looking for? [Please contact us](http://support.remot3.it).
{% endhint %}

## What is it?

remote.it is a platform that brings the world of disconnected networks to your browser, desktop and mobile devices. Securely access devices connected to any network like they were on your own local network.

remote.it lets you connect between your devices on the internet in a secure and convenient manner. In a **connection**, the device which begins the connection is called the **initiator device** and the device which responds is the **target device**.

## Why did we make it?

Our founders expertise started in TCP/IP and it grew from there. As cloud technologies advanced, it begged the question, why hasn’t networking changed? With the cloud, connecting to devices has never been easier. So, we developed [remote.it](http://remote.it) to simplify the way people and businesses connect to devices. Our goal is increase your productivity by reducing your time to device, easing access management, and giving you the peace-of-mind of making connections with no open ports.

## How does remote.it work?

When you register a device, remote.it will maintain a minimal connection while the device is online. When the devices have access to the internet **you** also have access to the device. The service agent requires **outbound** UDP traffic on ports 5959 through 5970 to communicate with remote.it.

When you register a service on a target device you're saying that you will communicate to that device on that particular service port. When ready to access we provide a local device or proxy address and port where all traffic will be routed to the target device and port. &#x20;

![](<.gitbook/assets/local to target.png>)

There are two methods we use to provide that connection access when you're ready for it. You can use either one on the same connection.

More details can be found on our connection types [here](https://link.remote.it/documentation-desktop/linux-connections)

[Proxy Connections](features/connection-options/peer-2-peer-and-proxy.md)- remote.it maintains geolocated initiators that generate unique addresses. These are great if the endpoint you're trying to access is closer to us than you. This connection type is not persistent and has a defined time to live.

![](<.gitbook/assets/p2p vs prox 2.svg>)

[Peer-2-Peer](features/connection-options/peer-2-peer-and-proxy.md)- when you request a peer-2-peer connection the remote.it service builds a tunnel from the initiating device to the target device. This connection can only be initiated on devices that have the service agent installed. This has low latency and will maintain the connection for as long as internet connection is available to both devices.&#x20;

![](<.gitbook/assets/p2p vs prox 1.svg>)

## Let's Start

Here's what is required.&#x20;

1. A remote.it account - create at [app.remote.it](https://link.remote.it/portal)
2. remote.it service agent installed on the target device. This is bundled with all our install options. The minimal install is the [device package](software/device-package/supported-platforms.md).
3. Download our [Desktop](software/desktop/) or [CLI](software/cli/) for Peer-2-Peer connections or our [web portal](https://link.remote.it/portal) for only proxy connections.

Check out the [Glossary](introduction/glossary-of-terms.md) for more details on these terms
