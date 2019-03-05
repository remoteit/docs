---
description: >-
  Configuring a remote.it Service to connect to any TCP server on your Windows
  machine
---

# Create a local remote.it TCP service

This example uses TCP port 445.

In the "Local Services" panel, click on "Add", then set "Type" to "Generic TCP", port to 445, and here I've edited the service name to be "My-Windows-Laptop\_SMB\_445" although I could have used the default name.

![](https://remot3it.zendesk.com/hc/article_attachments/360018012532/mceclip23.png)

This creates a new Service which I can access through the remote.it web portal \(on another machine\):

![](https://remot3it.zendesk.com/hc/article_attachments/360018012672/mceclip24.png)

As with SSH and web Service connections, you can also make a P2P connection from another Windows PC running remote.it Connect for Windows.

