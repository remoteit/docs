# Raspberry Pi

{% hint style="warning" %}
Do you already have a configured Raspberry Pi? You can install on of the following:

[Device Package](../device-package/installation.md) if you only need to support connections to the Pi and want a small footprint

[CLI](../cli/overview.md) if you do not need a UI and are comfortable using the command line or scripting

[Desktop](../desktop/overview-and-installation.md) if you want a fully supported UI to configure other devices and/or connect to other devices.
{% endhint %}

remote.itPi is an SD card operating system image for Raspberry Pi bundled with remote.it. The remote.itPi image includes the free remote.it application to enable instant remote access using SSH or VNC to any private network where the Pi is connected.

Once connected to the network, the Pi will provide direct remote access for authenticated users to any computers, routers, NAS storage boxes, printers, etc. connected to the same remote network.

## Installation

There are 3 options available:

1. [ARM](https://downloads.remote.it/remote.itPi/latest/remote.itPi.img.zip) - 32-bit supporting SSH and VNC by default (GUI enabled OS)
2. [ARM64](https://downloads.remote.it/remote.itPi/latest/remote.itPi\_arm64.img.zip) - 64-bit supporting SSH and VNC by default (GUI enabled OS)
3. [ARM - Lite](https://downloads.remote.it/remote.itPi/latest/remote.itPi\_lite.img.zip) - 32-bit supporting SSH by default (Headless OS)

To get started, you will need the following

* remote.it Desktop installed on your computer
* remote.it Pi Image
* Formatted micro SD card & reader
* OS image writer (Rasberry Pi Imager, balenaEtcher, or similar)

{% tabs %}
{% tab title="Video Guide" %}
This video demonstrates the installation using the [Raspberry Pi Imager](https://www.raspberrypi.org/software/).&#x20;

{% embed url="https://youtu.be/j9EsCvBF-cA" %}
{% endtab %}

{% tab title="Step by Step Guide" %}
This guide uses the Raspberry Pi Imager

{% hint style="info" %}
If you encounter any issues using the Raspberry Pi Imager, try the [Balena Etcher](https://www.balena.io/etcher/) application instead.
{% endhint %}

1. Extract the contents of the downloaded zip file onto your computer.
2. Insert the micro SD into your micro SD card reader, then connect the card reader to your computer and open the Raspberry Pi Imager app
   1. If you haven't formatted your micro SD, you can use Raspberry Pi Imager to do so by selecting the "Erase" in Operating System options and then selecting your SD card.
3. Burn the image
   1. Under "Operating System," click **CHOOSE OS**. When prompted, select the "**Use custom"** option. Locate and select the **remote.itPi.img** that you extracted from the .zip file.
   2. Under "SD Card," click **CHOOSE SD CARD**. When prompted, select your formatted micro SD's drive.
   3. Click **WRITE** to begin writing the remote.itPi image onto the micro SD. This process will take a few minutes.
4. Add wifi accessibility **(Optional)**
   1. Add a wpa\_supplicant.conf file to the root of your SD card (this will be read by the raspberry pi on boot and will set these configurations for the wireless networking. File configuration options and details can be found on the raspberrypi.org website here [https://www.raspberrypi.org/documentation/configuration/wireless/headless.md](https://www.raspberrypi.org/documentation/configuration/wireless/headless.md)
   2. Eject the micro SD card from your computer.
5. Insert the micro SD card into your Raspberry Pi and power on.
   1. If you are using ethernet for internet connection, ensure that you have an ethernet cable connected with access to the internet
   2. Wait a few minutes for your Raspberry Pi to complete the boot process
6.  Find you Raspberry Pi on the LAN and register it to your account

    1. Using a remote.it feature to discover the Raspberry Pi, open [http://find.remote.it](http://find.remote.it) in your browser which will search for your Raspberry Pi on the LAN
       1. Make sure you have disabled any pop-up blocker extensions or software for the remote.it domain
    2. After scanning completes and is successful,  click the "CONNECT" button on your Raspberry Pi device see [find.remote.it](raspberry-pi.md#find-remote-it) below for more details.
    3. Sign In to your remote.it account (you can create one here if you do not have one)
    4. Register your Raspberry Pi with remote.it by providing a name and clicking "REGISTER"
       1. You should see the installed services depending on your image this could be SSH, VNC, and remote.it Admin Panel. DO NOT remove the SSH or the remote.it Admin Panel as this will prevent your from accessing your Raspberry Pi with remote.it.

    Congratulations! Your Raspberry Pi is now registered to your remote.it account and you can now connect to remote.it Pi from any device using remote.it or a browser.
{% endtab %}
{% endtabs %}

## find.remote.it

**find.remote.it** is a network tool that lets you locate and connect to or register all the devices on your LAN which have the **remoteit** package installed.  This update enables a fully web based configuration tool for your local area network.

Once you have a **remoteit** enabled device running on your LAN, you can access it using [http://find.remote.it](http://find.remote.it). Use the left and right arrows to navigate through all of your LAN devices if you have more than one.

### Browser Security Warning

You may see a browser security warning when accessing find.remote.it on your LAN. [remote.it](http://remote.it) uses a certificate to allow encryption of your connection during the initial setup of your device. We can’t ask you to get a domain name and a certificate so we can communicate with your new device, so we have done that for you with a self-signed certificate. That means you will have to acknowledge it is OK to trust us and the self-signed certificate. If you are uncomfortable with this practice, or do not understand, you do not have to allow the connection.  You can use the remoteit [Command Line Interface](https://support.remote.it/hc/en-us/articles/360050382811) instead.

### Troubleshooting

#### Your client PC is not on the same LAN as the device

If you are setting up remoteit on a hosted server such as an EC2 instance at AWS, then your client PC is not on the same LAN as the target device.  While you could set up a temporary Security Group to allow external access to the device, this won't work either.  In this case, use the [Command Line Interface](https://support.remote.it/hc/en-us/articles/360050382811).

#### Your Router is Using IP Isolation mode

You may encounter issues configuring your device from another computer on the same LAN if your router is currently using IP Isolation mode.  The details may vary from router to router, but most commonly, this prevents clients attached to the wireless LAN to directly communicate with any other devices on the LAN.  If this is the case, you may try:

* Disabling IP Isolation mode in your router
* Connecting your client PC to the network using an Ethernet cable
* Configuring your device directly though its own console (i.e. keyboard and monitor) using the remote.it [Command Line Interface](https://support.remote.it/hc/en-us/articles/360050382811).

#### Miscellaneous other reasons

find.remote.it may fail for other reasons which may be difficult to diagnose.  You may also try:

* Accessing the newly installed web admin page using \<IP address>:29999 in your browser, where \<IP address> is the LAN IP address of the device you are attempting to configure.
* Configuring your device directly though its own console (i.e. keyboard and monitor) using the remote.it [Command Line Interface](https://support.remote.it/hc/en-us/articles/360050382811).
* Make sure that the [remote.it agent is running properly](https://support.remote.it/hc/en-us/articles/360046373452).

## Adding/removing services

You can make additional services available on remote.it, such as a web page. Make sure that these services are running on your Raspberry Pi and then add them using the Desktop Application or CLI.

You can also remove available services on remote.it by using the Desktop Application or CLI. Please note that once deleted, you can add that service type back, but it will actually be a new service definition.
