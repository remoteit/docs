# Making connections in macOS

Make sure your connection is active \(blue\).

![](../../../.gitbook/assets/image%20%2815%29.png)

If you see the green "Connect" button, click on it and wait until it turns blue as shown above.

![](../../../.gitbook/assets/image%20%28381%29.png)

### Launch URL

You can see the connection URL and port, e.g. **localhost:33001**.  You can use this directly, or you can create a Launch URL to streamline certain operations if your browser supports application launching. 

#### Launch URL for SSH

![](../../../.gitbook/assets/image%20%28147%29.png)

* \[username\] is only available for SSH connections.  It is the SSH username you specified.
* \[host\] is usually localhost, or 127.0.0.1.
* \[port\] is the port assigned to this connection.

## SSH Connections

* The SSH username is a user-configurable login name that will be included in the connection login string.  This setting only appears on SSH connections.  

![](../../../.gitbook/assets/image%20%28309%29.png)

* Click on the "Launch SSH" button as shown below.

![](../../../.gitbook/assets/image%20%28330%29.png)

If you have not configured the SSH username, you'll be prompted as shown:

![](../../../.gitbook/assets/image%20%28321%29.png)

Click on "Launch" to open the terminal and automatically launch the SSH command.  You'll see this warning the first time you make a connection:

![](../../../.gitbook/assets/image%20%2888%29.png)

Type in "yes" followed by the Enter key.  Enter the password when prompted, then you will be logged into your device's console.

![](../../../.gitbook/assets/image%20%2884%29.png)

## VNC Connections

* When you select the clipboard icon, the VNC string is copied to the clipboard.  You can then paste it into your VNC application.

![](../../../.gitbook/assets/image%20%28247%29.png)

* This is the VNC string:

```text
127.0.0.1:33003
```

* This can be copied and pasted into the address bar of the RealVNC Viewer application.

![](../../../.gitbook/assets/image%20%2860%29.png)

* Provide the username and password to complete the VNC connection.

![](../../../.gitbook/assets/image%20%2836%29.png)

![](../../../.gitbook/assets/image%20%28460%29.png)

## Web connections

Select the arrow to launch the connection URL directly in your default browser.

![](https://github.com/remoteit/docs/tree/ac0b32dabd0132c644ae46ce3793623867217237/.gitbook/assets/image%20%28436%29.png)

![](../../../.gitbook/assets/image%20%28150%29.png)

