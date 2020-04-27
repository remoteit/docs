---
description: 'Includes Ubuntu, Linux Mint, Armbian, Debian, OSMC, Kali and more.'
---

# Debian OS family

The Debian operating system is widely adopted and has many variations \(e.g. Raspbian, Ubuntu, Linux Mint, Armbian and more\). The Debian packaging system helps you to keep your entire system up to date and manage dependencies between different packages.

The remote.it "connectd" package supports the Debian packaging system for the following Debian architectures:

* armhf
* armel
* arm64
* amd64 \(current and older libraries\)
* i386 \(current and older libraries\)

{% hint style="info" %}
"Installing the connectd package" as described on this page is the process of placing the files associated with the remote.it secure connection and bulk scripting features on to your device. This process is a necessary step prior to running "connectd\_installer" which configures remote.it Services according to your preferences.
{% endhint %}

## Raspberry Pi with Raspbian Stretch or Buster

### To install the connectd package

Run the following commands at the console.

```text
sudo apt update
```

This command updates the list of available packages on your device. It does not actually update any software packages.

```text
sudo apt install connectd
```

This downloads and installs the connectd Debian package for the Raspberry Pi.

### To remove the connectd package, leaving configuration files in place

```text
sudo apt remove connectd
```

### To completely remove the connectd package, including configuration files

```text
sudo apt purge connectd
```

### To configure remote.it Services on your Raspberry Pi

Follow the link below.

{% page-ref page="../adding-remote.it-to-your-device/using-the-interactive-installer/" %}

## Other Debian based Operating Systems

### To install the connectd package

The auto-install.sh script will download and install a Debian package if you have a Debian based OS.

To run the auto-install-sh script, copy and paste the following 3 lines to your console:

```text
curl -LkO https://raw.githubusercontent.com/remoteit/installer/master/scripts/auto-install.sh
chmod +x ./auto-install.sh
sudo ./auto-install.sh
```

If you don't see any warnings, run:

`sudo connectd_installer`

to proceed to configure your device.

For more information, please see: 

{% page-ref page="supported-platforms.md" %}

### To configure remote.it Services on your Debian Linux Device

Follow the link below.

{% page-ref page="../adding-remote.it-to-your-device/using-the-interactive-installer/" %}

### To completely remove the connectd package, including configuration files

```text
sudo dpkg -purge connectd
```

### To remove the connectd package, leaving your configuration files in place

```text
sudo dpkg --remove connectd
```

### Why would you want to want to remove everything except your configuration files?

That's an interesting question, as most of the time, nobody will need to do this. Even if you wish to upgrade your connectd package, you can run either

```text
sudo apt update
sudo apt install connectd
```

for Raspbian, or

```text
curl <link to deb file>
sudo dpkg -i <deb file>
```

for other Debian based operating systems, and the correct files will get updated while your configuration files will remain in place.

However, there may come a time when keeping your configuration files in place while replacing all of the binaries and support scripts is necessary. If so, run:

```text
sudo dpkg --remove connectd
sudo dpkg -i <Debian file name>
```

Here is [an article with more detail](https://askubuntu.com/questions/187888/what-is-the-correct-way-to-completely-remove-an-application#187891) about using the features of the Debian packaging system.

