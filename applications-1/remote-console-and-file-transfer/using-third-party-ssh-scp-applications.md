---
description: >-
  These instructions describe how to connect to a remote.it-enabled SSH service
  using third-party applications such as (but not limited to) FileZilla, PuTTY
  and WinSCP.
---

# Using Third-Party SSH/SCP/SFTP Applications

**Works With:**

* Devices: All remote.it-compatible devices running an SSH server.
* Clients: Third-Party SSH applications such as [PuTTY ](http://www.chiark.greenend.org.uk/~sgtatham/putty/)or [SSH Secure Shell](http://ccm.net/download/download-1423-ssh-secure-shell), and SCP applications such as [WinSCP](http://winscp.net/eng/index.php), and SFTP applications such as [FileZilla](https://filezilla-project.org/index.php).

### Connect to your remote.it SSH Service

Make sure that you have created a remote.it account and installed a remote.it Service for SSH as described at the link below.

{% page-ref page="../../guides/using-the-interactive-installer/add-a-service-to-an-application.md" %}

#### Using a proxy connection via the web portal

Log in to your remote.it account, locate your SSH Service in your Device's Service List, and click on the Service's Name.

{% hint style="info" %}
Note: 

Connections made through the remote.it [web portal](../../guides/using-the-web-portal/) or using the [API](../../api-reference/overview.md) expire and need to be refreshed periodically.  For this reason it is impractical to bookmark such a connection.  If you would like to bookmark a remote.it connection in your application, you should use [peer to peer ](../../peer-to-peer-p2p-vs.-proxy-connections/peer-to-peer-connections.md)mode.
{% endhint %}

Click on the Device Name in Manage Devices view, then select the SSH Service from the Device Services dialog:

![](../../.gitbook/assets/image%20%28188%29.png)

The dialog shown below will appear after the connection is established.  You’ll need to copy and paste the hostname and port values from this dialog into the proper locations on your SSH/SCP application. 

![](../../.gitbook/assets/image%20%28375%29.png)

#### Using a P2P connection

If you are using a connection from the [Desktop ](../../guides/using-the-desktop-app/)application or a [P2P connection](../../advanced-users/using-connectd-in-p2p-initiator-mode/) made on the command line, the value to use for **hostname** is:

```text
127.0.0.1
```

and **port** should be whatever port was assigned to this connection by the Desktop or your command line.

### **Using remote.it with PuTTY for a secure remote terminal**

Launch PuTTY, then copy the hostname and port values to their corresponding locations in the connection dialog.  Make sure that the SSH protocol is selected.  Other SSH terminal applications will have similar fields.  A p\[roxy address is shown here but peer to peer connections can also be used.

![](../../.gitbook/assets/image%20%2872%29.png)

Click on “Open” to establish the connection.  You will probably see this SSH Security Alert, which is normal.   If you are using a peer-to-peer connection, click on "Yes" so that this warning will not be seen again.  If you're using a proxy connection, click on "No".  Since proxy connections change, there is no benefit to storing the key in the cache.

![](../../.gitbook/assets/image%20%28105%29.png)

Click on “Yes” to proceed.  Now you can log in by entering the device's SSH credentials.

![](../../.gitbook/assets/image%20%28192%29.png)

You are now connected to your device and can run commands in the terminal window, just as if you were sitting right next to it.

### Using remote.it with FileZilla **for file management and transfer on macOS, Linux and Windows**

Download and install the [FileZilla ](https://filezilla-project.org/index.php)application.

Open the FileZilla application and note the QuickConnect bar near the top:

![](../../.gitbook/assets/image%20%287%29.png)

Fill out the 4 fields in the Quickconnect bar.  Username and Password are the SSH login credentials for the target device, not your remote.it account.

{% hint style="info" %}
Note: you have to preface the hostname with "sftp://" as shown.
{% endhint %}

![](../../.gitbook/assets/image%20%28356%29.png)

When you connect, you will see the following warning:

![](../../.gitbook/assets/image%20%28195%29.png)

To connect, just click on OK.  If you are using the Desktop or command line approach to create a P2P connection, you can also check the "Always trust this host..." option, which will prevent this warning from appearing again the next time you connect \(as long as you use the same port\).  Since the proxy addresses and ports from connections made through the web portal will change, you **should not** select the "Always trust this host..." checkbox when using a proxy connection to prevent unneeded entries being added in your known hosts file.

### **Using remote.it with WinSCP for file management and transfer on Windows**

WinSCP is another popular secure file manager and transfer utility for Windows.  Copy the Host name and Port values from the remote.it SSH connection dialog to WinSCP’s connection screen and select “SCP” as the file protocol.  Click on “Login” to connect.

![](../../.gitbook/assets/image%20%28438%29.png)

As with PuTTY, you be warned that there is not a key cached for this address.  Select “Yes” to complete the connection.

![](../../.gitbook/assets/image%20%28357%29.png)

Now you can manage your remote and local files easily.

![](../../.gitbook/assets/image%20%28439%29.png)

