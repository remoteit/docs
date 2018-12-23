# Setup remote.it on a RaspberryPi

## Overview

## Setup your Pi

There are many ways to setup your RaspberryPi, and while it is outside the scope of this document to show you how. We will give you a breif overview of the process. The outline to getting setup is as follows:

1. Download a recent version of [Raspbian](https://www.raspberrypi.org/downloads/raspbian/)
2. Write the Raspbian operating system image to an SD card. We recommend [Etcher](https://www.balena.io/etcher/)
3. Configure SSH on your Pi

### Setup Raspbian

For more details we recommend [following this guide first](https://hackernoon.com/raspberry-pi-headless-install-462ccabd75d0). It should get you 90% the way towards having a working RaspberryPi using a "heaadless" install. A headless install allows you to setup a RaspberryPi without needing a monitor, keyboard or mouse.

In essence, you should download a Raspbian image and flash it to an SD card. Once you do that, you need to enable SSH. To do that, you need to create a blank file at the root of the operating system called `ssh`.

On a Mac, plugin your SD card and run:

```shell
touch /Volumes/boot/ssh
```

Now you are ready to turn on your Pi

## Turn on your Pi

1. Insert your SD card into your Pi
2. Connect your RaspberryPi ethernet to your laptop
3. Plug the USB power plug into your RaspberryPi, which will cause your Pi to boot up

## SSH into your Pi

Now, you can SSH into your Pi (assuming everything went well!). Do do that, on your laptop, open up the Terminal (or whatever command line tool you prefer to use) and run:

```shell
ssh pi@raspberrypi.local
```

If all goes well, you will be prompted to accept the public key of the Pi and then you will be prompted to login. The default password on a Pi is `raspberry`.

## Change your password

We highly recommend chaning the root password of your Pi since the `raspberry` password is very well know and opens up your Pi to attack. To change your password, run:

```shell
passwd
```

You will be prompted to type your old pasasword then set your new password.

## Setup your network

You have three options when it comes to setting up your Pi to access the internet.

### Ethernet setup

The simplest option is to plug an ethernet cord from your Pi to your router so it is hard wired. This is the most reliable way to setup but means your Pi has to be plugged into your route which is not always possible or feasable.

### Wifi setup

A common option is to connect your Pi to Wifi so you can have it located anywhere your Wifi network has coverage.

To do this, the easiest way is to use the built in `raspi-config` command which allows you to configure many things on your Pi. Run:

```shell
sudo raspi-config
```

1. Go to “Network Options”
2. Select “Wi-Fi”
3. Select your country
4. Enter your network’s SSID (network name)
5. Enter your network password, or leave blank if you’re on an open network

Now you should be connected to your Wifi network, congrats!

\*Note: Once WiFi is configured your pi will no longer be available at raspberrypi.local. If you need to reconnect to your pi before you have remote.it installed you will need to make note of it's IP address. This can be found by running `ifconfig` and searching for it at the [top of the output](https://stackoverflow.com/questions/8529181/which-terminal-command-to-get-just-ip-address-and-nothing-else).

### Celular modem

One of the key benefits of using remote.it is that we fully support connections over cellular.

Setup is similar to the WiFi setup above, only you will configure setup to attach to a local hot-spot or internal modem.

## Check your network connection

To check that you are connected to the internet, try pinging Google:

```shell
ping google.com
```

You should see a bunch of output like this:

```shell
64 bytes from 172.217.6.78: icmp_seq=0 ttl=52 time=14.868 ms
64 bytes from 172.217.6.78: icmp_seq=1 ttl=52 time=20.153 ms
64 bytes from 172.217.6.78: icmp_seq=2 ttl=52 time=18.833 ms
```

If you see a bunch of `timeout` messages, that means your not connected and you'll need to try and diagnose why you can't connect to your network.

To close this `ping`, type `Ctrl + c`.

## Install remote.it

There are two ways to install remote.it on your pi

### Quick install

1. Login to your remote.it account and click the 'download' link in the menu.
2. Select the linux version of remote.it
3. Copy the custom download and install link
4. Log it your pi and paste the link into your terminal

```shell
wget https://remote.it/downloads/app?uuid=123e4567-e89b-12d3-a456-426655440000
```

### Manual install

```shell
sudo apt−get dist−upgrade
sudo apt-get update
```

```shell
sudo apt-get install remoteit
sudo remoteit
```

[Setup Instructions]
