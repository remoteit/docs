# Setup your Raspberry Pi

## Overview

There are many ways to setup your Raspberry Pi, and while it is outside the scope of this document to show you how. We will give you a brief overview of the process. The outline to getting setup is as follows:

1. Download a recent version of [Raspbian](https://www.raspberrypi.org/downloads/raspbian/)
2. Write the Raspbian operating system image to an SD card. We recommend using [Etcher](https://www.balena.io/etcher/) for that.
3. Configure SSH on your Pi.

## Install Raspbian

For more details we recommend [following this guide first](https://hackernoon.com/raspberry-pi-headless-install-462ccabd75d0). It should get you 90% the way towards having a working Raspberry Pi using a "headless" install. A headless install allows you to setup a Raspberry Pi without needing a monitor, keyboard or mouse.

In essence, you should download a Raspbian image and flash it to an SD card. Once you do that, you need to enable SSH. 

## Enable SSH on Your Raspberry Pi

To enable SSH on your Pi, you need to create a blank file at the root of the operating system called `ssh`. This will tell Raspbian that you'd like to enable SSH and when you first boot up the operating system, it will be enabled for you.

On a Mac, plugin your SD card and run:

```bash
touch /Volumes/boot/ssh
```

For other operating systems, just open up the SD card and create a blank file at the root of the card named `ssh` and then eject the SD card.

Now you are ready to turn on your P!

