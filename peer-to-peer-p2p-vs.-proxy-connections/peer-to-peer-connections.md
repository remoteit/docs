# Peer to Peer Connections

Peer to peer \(P2P\) connections can be made using the connectd daemon on any platform, or using the remote.it Connect for Windows application. 

## Why should you use a P2P connection with remote.it?

1. Persistent connections.  Many people want to have a repeatable address for their remote.it Services in order to be able to bookmark them in various applications.  P2P connections create a persistent and repeatable connection address of the form 127.0.0.1:port on your client computer.
2. Faster connection times.  Once a P2P connection is configured and established on your client computer, you do not have to log in to the remote.it web portal or click on a device name, then choose a service in order to make a connection.
3. No timeouts.  Our proxy servers limit connection time so that our computer resources don't get tied up.  P2P connections do not use our proxy servers and there is no time limit imposed.
4. Faster data throughput.  Some applications such as SSH can work acceptably with low bandwidth.  Others, such as VNC and video streaming, benefit from a P2P connection as the data does not have to pass through our servers on the way to your computer.

### Desktop applications for Mac and Windows now in beta!

The remote.it Desktop applications support P2P mode.

{% page-ref page="../guides/using-the-desktop-app.md" %}

## Windows

Our remote.it Connect for Windows application is a GUI alternative for the Windows OS that can also make peer to peer connections and set up a remote.it Service on the Windows PC.

{% page-ref page="../platforms/windows-quick-start/using-remote.it-connect.md" %}

## Creating a peer to peer connection

Programmers will want to learn how to create a P2P connection by using the connectd daemon in P2P initiator mode in custom applications.  You can find instructions for Mac OS/X, Linux, and Windows PowerShell here:

{% page-ref page="../guides/using-connectd-in-p2p-initiator-mode/" %}

