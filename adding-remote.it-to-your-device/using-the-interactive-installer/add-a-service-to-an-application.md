---
description: Add a remote.it Service to any TCP server on your device
---

# Add a Service to an application

After the first time you log in, when you run connectd\_installer again, you will start here.

You will see the "Main Menu".  There is a table of installed services but you may not have any installed yet.  You should install one!  

![](../../.gitbook/assets/image%20%28342%29.png)

Let's install a service for the SSH connection.  Because the service we wish to connect to is on this device \(as compared to a different device on the same LAN\), use option 1, "Attach/reinstall a remote.it Service to an application".

Now you will see the "Protocol Selection Menu".

![](../../.gitbook/assets/image%20%28203%29.png)

Choosing a protocol here helps determine how the remote.it web portal will respond when you make a connection.

* ssh: connection displays a dialog with sample command lines for an ssh connection.
* Web - connection opens in your web browser.
* Secure Web - connection opens in your browser.  You can expect to see security warnings when you use this option.
* VNC - shows a dialog with connection information and options.  
  * browser based client 
  * separate application 
  * Mac screen sharing
* nxWitness - opens the nxWitness application on mobile clients

Select option 1 for SSH and enter the requested information.  Whenever you select a protocol, you are given the opportunity to use the default port assigned to that server.

* SSH = port 22
* Web = http on port 80
* Secure Web = https on port 443
* VNC = port 5900
* nxWitness = port 7001
* Custom TCP = no default value

When the list of installed Services redraws, you will see your new remote.it ssh Service in the table along with the detected application.

![](../../.gitbook/assets/image%20%2884%29.png)

The interactive installer can be used in a similar way for all types of supported TCP servers.

