# Install remote.it

Congrats, now you should have a running Raspberry Pi and now all you need to do to securely remote access and control it is to setup remote.it!

## Connect to your Pi

If you haven't already, make sure you have your Pi connected to your computer via Ethernet and you have SSHed into it:

```bash
ssh pi@raspberrypi.local
```

## Update your Raspberry Pi

Before you start, make sure to update your Pi's software by running the following on the command line which connected to your Pi:

```bash
sudo apt−get dist−upgrade
sudo apt-get update
```

## Create a remote.it account

Before you install remote.it, create a new account which should just take a minute and is completely free. 

This will allow you to configure your device and access it securely anywhere in the world!

{% hint style="info" %}
remote.it is free for personal use under our Fair Use policy. If you're using remote.it for commercial purposes like developing a product with remote.it embedded in it, using remote.it it on commercial machines or other business related uses, we have a variety of plans to meet your companies needs. Please [contact us with any questions](https://remot3it.zendesk.com)!
{% endhint %}

## Install remote.it

Now that you are all up to date, it is time to install the remote.it connectd library which will allow you to configure services on your device to connect to via remote.it. Run the following to install and start the remote.it installer:

```bash
sudo apt-get install remoteit
sudo remoteit
```

Now you should see a command line prompt that will guide you through the process of configuring remote.it to have access to various services on your machine.

You should first login to your existing remote.it account and then you can start configuring services.

## Configuring services

For now, we recommend starting with SSH and VNC, but ultimately you can use any service on your machine that can connect to a port. Virtually anything that communicates over TCP can be used with remote.it including:

* SSH
* VNC
* HTTP\(S\)
* Nx Witness
* RDP
* Samba
* TCP
* ...and much more!

{% hint style="info" %}
For service types that you don't see in the selection list, just _choose "TCP" as the service type_ and you can always configure the service type later in [the remote.it web portal](https://app.remote.it).
{% endhint %}

{% hint style="info" %}
You can configure as many services as you'd like and you can have multiple of any service type \(for example, you could have two HTTP services running on different ports\)
{% endhint %}

Congratulations! If all went well, you should now have services setup on your Raspberry Pi which you can now connect to via [remote.it](https://app.remote.it)!

