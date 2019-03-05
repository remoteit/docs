---
description: >-
  Configuring a remote.it Service to connect to a web server on your Windows
  machine
---

# Create a local remote.it web Service

For this example, since Windows does not run a web server by default, I installed the "[Fenix](http://fenixwebserver.com/)" web server to act as a file browser on my Windows laptop.  Other servers such as [node-red](https://nodered.org/) also use a browser connection.

In the "Local Services" panel, click on "Add":

![](https://remot3it.zendesk.com/hc/article_attachments/360018011772/mceclip18.png)

Now set the "Type" to "Web Proxy", and the port to 80 \(in this example, your server may be at a different port\).

![](https://remot3it.zendesk.com/hc/article_attachments/360018011872/mceclip19.png)

Leave the other fields at their default settings, then click on "Save".

![](https://remot3it.zendesk.com/hc/article_attachments/360018011952/mceclip20.png)

Now you have a Service defined for "My-Windows-Laptop\_Web\_Proxy\_80".

![](https://remot3it.zendesk.com/hc/article_attachments/360018011992/mceclip21.png)

I can now connect to that link and see the folder view shown by the web server:

![](https://remot3it.zendesk.com/hc/article_attachments/360017894911/mceclip22.png)

