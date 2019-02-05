---
description: >-
  These instructions describe how to connect to a remote.it-enabled SSH service
  using third-party applications such as PuTTY, FileZilla and WinSCP.
---

# Using Third Party SSH/SCP Applications

**Works With:**

* Devices: All remote.it-compatible devices running an SSH server.
* Clients: Third-party SSH applications such as [PuTTY ](http://www.chiark.greenend.org.uk/~sgtatham/putty/)or [SSH Secure Shell](http://ccm.net/download/download-1423-ssh-secure-shell), and SCP applications such as [FileZilla ](https://filezilla-project.org/)or [WinSCP](http://winscp.net/eng/index.php).

#### Connect to your remote.it enabled SSH device and copy the hostname and port values to your application.

Make sure that you have created a remote.it account and installed a remote.it Service  for SSH on port 22 as described at the link below.

{% page-ref page="../../../using-the-interactive-installer/add-a-service-to-an-application.md" %}

Log in to your remote.it account, locate your SSH Service in your Device's Service List, and click on the Service Name.

{% hint style="info" %}
Note – you need to connect through the web site each time you connect to your SSH service.  remote.it's servers will give you a new connection address to any device within each login session.
{% endhint %}

  Click on the Device Name in Manage Devices view, then select the SSH connection from the Device Services dialog:

This dialog will appear after the connection is established.  You’ll need to copy and paste the Hostname and Port values from this dialog into the proper locations on your SSH/SCP application. 

**Using remote.it with PuTTY for a secure remote terminal**

Launch PuTTY, then copy the Hostname and Port values to their corresponding locations in the connection dialog.  Make sure that the SSH protocol is selected.  Other SSH terminal applications will have similar fields.

Now click on “Open” to establish the connection.  You will probably see this SSH Security Alert, which is normal.  Click on “Yes” to proceed.

Now you are connected to your device and can run commands in the terminal window just as if you were sitting right next to it.

**Using remote.it with FileZilla for file management and transfer**

The process is similar for FileZilla, a cross-platform secure file manager utility.  Copy the Hostname and Port values from the remote.it connection dialog to FileZilla’s connection screen as shown.  Be sure to add **sftp://** before the host name as shown.  Click on “Quickconnect” to connect.

![](https://remot3it.zendesk.com/hc/article_attachments/360014746052/mceclip5.png)

Similar to PuTTY, you will see a security alert: the “Unknown Host Key” warning.  Select “OK” to complete the connection.[![](https://remot3it.zendesk.com/hc/article_attachments/360014775851/mceclip9.png)](https://i2.wp.com/www.weaved.com/wp-content/uploads/2015/10/filezilla-unknown-host-key.png?fit=466%2C217&ssl=1)

**Using remote.it with WinSCP for file management and transfer on Windows**

WinSCP is another popular secure file manager and transfer utility for Windows.  Copy the hostname and port values from the remote.it connection dialog to WinSCP’s connection screen and select “SCP” as the file protocol.  Click on “Login” to connect.![](https://remot3it.zendesk.com/hc/article_attachments/360014746172/mceclip8.png)

As with PuTTY, you will see a warning that there is not a key cached for this address.  Select “Yes” to complete the connection.![](https://remot3it.zendesk.com/hc/article_attachments/360014746112/mceclip7.png)

