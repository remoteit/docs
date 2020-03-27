# Peer to Peer vs Proxy Connections

## Peer to Peer Connections

![](../.gitbook/assets/diagram-direct.svg)

In order to make a peer to peer \(P2P\) or direct connection the remote.it connectd daemon needs to be running on both systems, but has several advantages over using a proxy connection.

* Data does not pass through our servers. Only the connection initialization touches the cloud.
* Data throughput is significantly faster.
* The connection will stay active as long as there is an internet connection available to both devices.
* The URL will remain the same and can be bookmarked.

A P2P connection looks similar to:

```text
127.0.0.1:34000
```

* 127.0.0.1 is a "localhost" address.
* 34000 is a user-configurable port to use for this connection.

To learn how to make a P2P connection, please see:

{% page-ref page="../guides/using-the-desktop-app/" %}

{% page-ref page="../guides/using-connectd-in-p2p-initiator-mode/" %}

## Proxy Connections

![](../.gitbook/assets/diagram-connect.svg)

Cloud proxy connections are the simplest to set up and test with as you only need our connectd daemon on the target device. However there are limitations compared to a direct P2P connection.

* The URL and port will change every time you connect

### Proxy connection expiration

Proxy connections, which are made when you connect using the web portal or the /device/connect API endpoint, are not permanent. As long as an active tunnel is maintained, the proxy address will remain active for about 8 hours. How an active tunnel is maintained depends on the type of service you are using.

**SSH**  
Establishing and keeping an SSH session open to the endpoint maintains an active tunnel, even if you are not typing. If you disconnect the SSH client, the proxy will expire in another 15 minutes.

**SCP**  
Doing file transfers via SCP command line only keeps the tunnel active for the duration of the file transfer. You may do multiple SCP commands using the same proxy URL and port, as long as they are less than 15 minutes apart. The proxy will time out 15 minutes after the end of the last transfer if no further commands are executed inside that window.

**VNC and RDP**  
For VNC and RDP, as long as the VNC or RDP client is connected to the server, the tunnel is open, even if you aren’t doing anything.

**Web servers**  
If you connect to a web page, simply keeping the web page visible is not sufficient to maintain the tunnel. You’ll have to navigate around or refresh the browser. Web connection proxies expire 15 min after the last web request is issued. The proxy will timeout 15 minutes after the last web request if no further web requests are executed inside that window.

**Other service types**  
The behavior of other service types will depend on whether an active client-server maintains a TCP connection. If a TCP connection remains open, the proxy connection will remain active for about 8 hours. If not, the proxy connection will expire about 15 minutes after the last TCP connection closes.

**Why?**  
We’ve shortened the expiration time on proxy connections to prevent unused connections being left open and consuming unnecessary resources on our servers that would reduce capacity and needlessly burden the service. This helps to improve overall performance of the remote.it service.

In addition, users whose targets are on metered cell connections were experiencing data charges accumulating even after they stopped using the connection. The shortened timeout will help reduce those data charges.

To learn how to make proxy connections, click on one of the links below.

{% page-ref page="../guides/using-the-web-portal/the-view-devices-page/proxy-connections.md" %}

{% page-ref page="../api-reference/devices/connect.md" %}

