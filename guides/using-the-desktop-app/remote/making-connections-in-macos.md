# Making connections in macOS

Make sure your connection is active \(blue\).

![](../../../.gitbook/assets/image%20%2817%29.png)

If you see the green "Connect" button, click on it and wait until it turns blue as shown above.

![](../../../.gitbook/assets/image%20%28411%29.png)

### Launch URL

You can see the connection URL and port, e.g. **localhost:33001**.  You can use this directly, or you can create a Launch URL to streamline certain operations if your browser supports application launching. 

#### Launch URL for SSH

![](../../../.gitbook/assets/image%20%28160%29.png)

* \[username\] is only available for SSH connections.  It is the SSH username you specified.
* \[host\] is usually localhost, or 127.0.0.1.
* \[port\] is the port assigned to this connection.

## SSH Connections

* The SSH username is a user-configurable login name that will be included in the connection login string.  This setting only appears on SSH connections.  

![](../../../.gitbook/assets/image%20%28336%29.png)

* Click on the "Launch SSH" button as shown below.

![](../../../.gitbook/assets/image%20%28357%29.png)

If you have not configured the SSH username, you'll be prompted as shown:

![](../../../.gitbook/assets/image%20%28348%29.png)

Click on "Launch" to open the terminal and automatically launch the SSH command.  You'll see this warning the first time you make a connection:

![](../../../.gitbook/assets/image%20%2897%29.png)

Type in "yes" followed by the Enter key.  Enter the password when prompted, then you will be logged into your device's console.

![](../../../.gitbook/assets/image%20%2893%29.png)

## VNC Connections

* When you select the "Launch VNC" action \(monitor icon\), the VNC command attempts to execute automatically.  This should work when making a Mac to Mac connection.  

![](../../../.gitbook/assets/image%20%28231%29.png)

* If you are connecting from a Mac to a Raspberry Pi running RealVNC, you should install the RealVNC Viewer and use the "Copy VNC" option instead.

![](../../../.gitbook/assets/image%20%28501%29.png)

* When you select the clipboard icon, the connection address is copied to the clipboard.  You can then paste it into your VNC application \(RealVNC Viewer is shown here\).

![](../../../.gitbook/assets/image%20%28294%29.png)

* Provide the username and password to complete the VNC connection.

![](../../../.gitbook/assets/image%20%28418%29.png)

You should now see the desktop of your connected device.

![](../../../.gitbook/assets/image%20%28100%29.png)

## Web connections

Select the arrow to launch the connection URL directly in your default browser.

![](../../../.gitbook/assets/image%20%28415%29.png)

![](../../../.gitbook/assets/image%20%28457%29.png)



