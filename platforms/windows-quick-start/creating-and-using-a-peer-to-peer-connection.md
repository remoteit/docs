---
description: >-
  Peer to peer connections are not subject to connection time limits and do not
  pass data through remote.it servers after the connection is established, so
  throughput is typically improved.
---

# Creating and using a peer to peer connection

### **Configuring a peer to peer connection to an SSH service**

To configure a peer to peer \(P2P\) connection, select the checkbox next to the Device Name, then click on "Setup".  This will open the "Connections" tab showing the Services available on that Device.

Let's create a P2P connection on the SSH Service "Black-Pi-ssh-02":

![](https://remot3it.zendesk.com/hc/article_attachments/360018010492/mceclip9.png)

Check the checkbox to the left of the Service you wish to connect to, then click on "Start":

![](https://remot3it.zendesk.com/hc/article_attachments/360017893311/mceclip10.png)

In a few moments you will see that the "Port" and "Token" fields get populated:

![](https://remot3it.zendesk.com/hc/article_attachments/360017893491/mceclip11.png)

The assigned port \(34000\) can now be used with 127.0.0.1 to initiate an SSH connection, for example:

```text
C:\Users\gary>ssh -l pi 127.0.0.1 -p 34000
The authenticity of host '[127.0.0.1]:34000 ([127.0.0.1]:34000)' can't be established.
ECDSA key fingerprint is SHA256:89b83FWn9SdVi9Mp2jwN8lDWu0STbWxfyLrCUgQsj9E.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '[127.0.0.1]:34000' (ECDSA) to the list of known hosts.
pi@127.0.0.1's password:
Linux raspberrypi 4.9.59-v7+ #1047 SMP Sun Oct 29 12:19:23 GMT 2017 armv7l
The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.
Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Tue Dec 25 19:47:34 2018 from 127.0.0.1
Linux raspberrypi 4.9.59-v7+ #1047 SMP Sun Oct 29 12:19:23 GMT 2017 armv7l
The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.
Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Tue Dec 25 19:47:34 2018 from 127.0.0.1
pi@raspberrypi:~ $
```

### **Configuring a peer to peer connection to a web service**

In the connections pane, select the web service, then click on "Start".  As before, within a few moments you will see the assigned port.

![](https://remot3it.zendesk.com/hc/article_attachments/360017893551/mceclip12.png)

This time, the assigned port is 34001.  You can now use 127.0.0.1:34001 in your browser:

![](https://remot3it.zendesk.com/hc/article_attachments/360017893751/mceclip13.png)

### **Configuring a peer to peer connection to any TCP server**

Similarly to the SSH and web examples shown above, select the Service on the Device to which you wish to make a P2P connection.  Click on "start" to initiate the P2P connection.  Once the port is shown, you can use **127.0.0.1:port** in your application to connect from your client to the target server. 

### **Bookmarking peer to peer remote.it connections**

You can bookmark a peer to peer connection using the 127.0.0.1:port address.  For example, here's a saved PuTTY remote console connection using a peer to peer connection:

![](https://remot3it.zendesk.com/hc/article_attachments/360017895931/mceclip0.png)

The first time you make this connection, you will see the security warning:

![](https://remot3it.zendesk.com/hc/article_attachments/360017895991/mceclip1.png)

As long as you select "Yes" to add this address:port to PuTTY's cache, and use the same address:port for future connections, you should not see this security alert again.

