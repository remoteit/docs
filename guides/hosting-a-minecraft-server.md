---
description: How to securely set up a free Minecraft Server without having to port forward.
---

# Hosting a Minecraft Server

## Overview

In this guide you will learn how to host a Minecraft multiplayer server using remote.it. Hosting a server in this way is secure, totally free, and doesn't require port forwarding. Additionally, you only have to go through this set up process once, and anyone else using remote.it can join.

**The steps to setup are:**

1. Set up a Minecraft Server.
2. Host the server using remote.it.
3. Share the server with whoever you want.
4. Connect to the server through remote.it.
5. Connect to the server through Minecraft.

## Set up

Before starting the process of setting up your Minecraft server to run on remote.it, please make sure to [**create**](https://app.remote.it/auth/#/sign-up) an account and [**download**](https://github.com/remoteit/desktop/releases/latest) and install the desktop app. If you need help setting up a Minecraft server, there are many resources online detailing [**how to**](https://minecraft.gamepedia.com/Tutorials/Setting_up_a_server), as well as a remote.it ****[**video tutorial.**](https://www.youtube.com/watch?v=natSu296POg) ****

{% hint style="info" %}
**NOTE:** DO NOT port forward! Set up the server to run on your machine locally and remote.it will take care of the rest.
{% endhint %}

Below is an image of what your server should look like when it's ready to be hosted. You should be able to connect to it using your local IP address, but it won't be accessible by anyone outside of your local network yet.

![An example of what you should have set up \(Windows\).](../.gitbook/assets/1%20%282%29.png)

## Host using remote.it

Launch the desktop app and log in, then navigate to the _Hosted_ tab at the bottom and register your device.

![Name your device, then press the Register button.](../.gitbook/assets/1-new.PNG)

Next, navigate to the _Network_ tab and click scan to scan your local network. Make sure your Minecraft server is running first. 

![Scan the network your local machine is on.](../.gitbook/assets/2-new.PNG)

Scroll down and find your system, labeled _This system_.

![](../.gitbook/assets/3-new.PNG)

Click on your IP address. If your Minecraft server is running, the app will detect and display it.

![The Minecraft Server will have the port 25565 displayed to the left.](../.gitbook/assets/4-new.PNG)

Click the add button next to the Minecraft Server option. You will be taken to the _Hosted_  tab again. 

You can only use alphanumeric characters, spaces, underscores, and hyphens in your device name. Click the blue check mark to add the service when done.

{% hint style="info" %}
**NOTE:** If the Host IP Address is blank, don’t worry about it. The app will fill it in for you once you press the check mark.
{% endhint %}

![](../.gitbook/assets/5-new.PNG)

## Share the server

The server is now hosted through remote.it. To allow players to join, you must share the device with them. Make sure that everyone who wants to access the server has a free remote.it account and has downloaded the desktop app. 

Go to [**app.remote.it**](https://app.remote.it/auth/#/sign-in) ****and navigate to the _Contacts_ page. Click the _Create Contact_ button and enter the name and email of the person you wish to add to your server. Then click _Create Contact_. 

![](../.gitbook/assets/7.png)

Navigate to the _Devices_ page and click the check mark next to the device that is hosting the server. Click on _Actions_, then _Share_. Choose the people you want to play with from the drop down menu and _Add Sharing_.

{% hint style="warning" %}
**NOTE:** You should not allow contacts to execute scripts on the device.
{% endhint %}

![You may share the device to as many people as you want.](../.gitbook/assets/8%20%281%29.png)

Now, have the people you want to play with log in to the desktop app. 

## Connect using remote.it

The device will appear under the _Remote_ tab in a minute or two. 

![The device has appeared on my friends desktop app.](../.gitbook/assets/use-2.png)

They should click on the device, then click _connect_ to connect to the server. 

![Now you are ready to connect to the server through Minecraft!](../.gitbook/assets/use.png)

## Connect with Minecraft

When connected through remote.it, a clipboard icon will appear. Click it, and the IP address for the Minecraft server will be copied to your clipboard. 

![](../.gitbook/assets/capture.PNG)

Paste it into the Minecraft Server Address field and you will be able to connect.

{% hint style="warning" %}
**NOTE:** If http:// appears before the server address, be sure to delete it before attempting to connect.
{% endhint %}

![Note that any sort of insecure port forwarding is not used here.](../.gitbook/assets/captureserv.PNG)

**You’re done!** As long as remote.it is running on both machines and the Minecraft server is up, you will able to play Minecraft together securely without port forwarding.

![Voila!](../.gitbook/assets/13%20%281%29.png)

