# Install remote.it connectd

Congrats, now you should have a running Raspberry Pi and now all you need to do to securely remote access and control it is to setup remote.it!

## Connect to your Pi

If you haven't already, make sure you have your Pi connected to your LAN via Ethernet and you have SSH'ed into it from a computer on the same LAN:

```bash
ssh pi@raspberrypi.local
```

## Update your Raspberry Pi

Before you start, make sure to update your Pi's software by running the following on the command line which connected to your Pi:

```bash
sudo apt update
sudo apt dist−upgrade
```

## Install remote.it

Now that you are all up to date, it is time to install the remote.it connectd software which lets you configure services on your device to connect to via remote.it. Run the following to install the remote.it connectd package.

```bash
sudo apt install connectd
sudo connectd_installer
```

Now you should see an interactive installer menu that will guide you through the process of configuring remote.it to access the various TCP services on your device.  Follow the link below for more details on using connectd\_installer.

{% page-ref page="../../using-the-interactive-installer/" %}

