# Peer to Peer vs. Proxy Connections

## Peer to Peer Connections

![](.gitbook/assets/diagram-direct.svg)

In order to make a peer to peer \(P2P\) connection the remote.it connectd daemon needs to be running on both systems, but has several advantages over using a proxy connection.

* Data does not pass through our servers. Only the connection initialization touches the cloud.
* Data throughput is significantly faster.
* The connection will stay active as long as there is an internet connection available to both devices.
* The URL will remain the same and can be bookmarked.

We are working on new ways to make P2P connections. Currently you have to use the connectd daemon or the Windows Connect application.

## Proxy Connections

![](.gitbook/assets/diagram-connect.svg)

Proxy connections are the simplest to set up and test with as you only need our connectd daemon on the target device. However there are limitations compared to a direct P2P connection.

* URL and port will change every time you connect
* There is an 8 hour time limit before the connection will auto-close



