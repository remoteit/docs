---
description: >-
  LAN sharing allows you to let other people on the same LAN share peer to peer
  connections to remote devices via the remoteit application on your computer.
---

# LAN Sharing

When you use the remoteit App or the headless server to configure peer to peer connections for Devices in your account, you are able to enter the "Bind IP address" as shown:

![](.gitbook/assets/image%20%2825%29.png)

Most of the time, you will set this value to "localhost" which lets you make a peer to peer connection from the computer running the remoteit app or headless server.  However, by setting the "Bind IP Address" to "0.0.0.0", you can allow other users on your LAN to access this peer to peer connection.  This works whether they have a remote.it account or not.

In order to change the Bind IP Address, the Service must be disconnected \(showing the green "Connect" button\). 

![](.gitbook/assets/image%20%28481%29.png)

* Click on the "Bind IP Address" field to edit it.
* Type in 0.0.0.0 as shown.
* Click on the check mark to confirm the change.

![](.gitbook/assets/image%20%28389%29.png)

When you enter a value of 0.0.0.0, the displayed Bind IP Address will change to your current LAN IP address.  This can be given to other people to access your P2P connection.

![](.gitbook/assets/image%20%28101%29.png)

Click on "Connect" in order to establish the P2P connection.

Supposing that your PC's IP address is 192.168.1.160, and the assigned port for this connection is 33001, you can access this connection using:

```text
localhost:33001
```

Other users will be able to access this P2P connection on the LAN using:

```text
192.168.1.160:33001
```

To disable LAN sharing, set the "Bind IP Address" back to "localhost".

{% page-ref page="adding-remote.it-to-your-device/the-remote.it-desktop-app-for-windows-and-macos..md" %}



