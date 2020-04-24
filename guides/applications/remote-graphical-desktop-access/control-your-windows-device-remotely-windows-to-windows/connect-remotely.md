---
description: >-
  Learn how to connect remotely to your target computer from a different Windows
  Machine, using the built-in RDP software.
---

# Connect Remotely

Open the remote.it Desktop App on the computer you will be connecting from and sign in with the same credentials as you used on the other device.

After a few minutes, the Device you registered earlier will appear under the _Devices_ tab. Click on it, and you’ll see the RDP Service that you created.

![If I click on my windows2windows Device, I will find my RDP Service.](https://lh5.googleusercontent.com/j2uQ309dd9LAAngN8LJjDk10uuNIqVkM12smI83PCFCG6asuzLGOExJRl_EbahMzos0MMNEm11fzlsL9nDtNTfNAey7vBzY6H-Ndd5WPU0NjACyyOAsijNa2YdnOv3TlUSn4YK9p)

Click the green “Connect” button next to the Service. The button will turn blue, signifying that you are now connected.

![I&apos;ve now connected to my other computer with remote.it!](../../../../.gitbook/assets/2.PNG)

Click the clipboard icon to copy the address to your clipboard. This is the address that you will use to connect to the original Device. 

It will be a localhost address, meaning that you will be connecting directly to your target Device. This is known as a Peer to Peer Connection. If you're curious about Peer to Peer Connections, check out the following guide:

{% page-ref page="../../../../peer-to-peer-p2p-vs.-proxy-connections/" %}

Once the address is copied to your clipboard, open the RDP client application on your client Windows machine. It is called “Remote Desktop Connection”. Paste the address into the text field and click “Connect”.

![I pasted in the address I got from the clipboard icon on the Desktop App.](https://lh5.googleusercontent.com/n_XjYPfnymsDnz4Sv7FtCykiZ5tvc2ylolfjbiGPSRXtG3NqjW2n2ODWCw_VUhN-GAiJtLDGeXL4cIVhWoV7aYZpZzQlr0RGa4oqA4XEOUL0q56in5AoafhC5yiUR4r5nJa0CJ8l)

Enter the username and password of the target Windows Device and press “Ok”. Click “Yes” when prompted.

![The window should look like this \(Windows 10\).](https://lh6.googleusercontent.com/HnJQtCBUadjnRD0cyZyqK2OGPOs7Pgl2fMJcEyEre9Gr8f4MT5bfuknhR-t147AO1elksXD-R4tzeKqFyqjvjLIoEfd-0yNCRzyLruqZkdJ2hngbGI_mj7XVh1ewztr25S6tah08)

You are now remotely connected and controlling your Windows Device and can use it as usual! 

![](https://lh6.googleusercontent.com/38ejhTBv4VlmIOQmcaRqXYPXXk1bzFq6fqCvn6FF5P3buvDXJYoqDLX4dId5n1crhnMoQJbM2WYGv8FicEZqO84w33W007cxrwiyNbPVYOWwK7E6-Twe1XzhFy9TEoBgz1eoBGyn)

Whenever you want to access the connection, just connect through the remote.it Desktop App, copy the address, and paste it into the RDP client.

Continue with the tutorial to learn how to terminate your connection:

{% page-ref page="terminate-the-connection.md" %}

