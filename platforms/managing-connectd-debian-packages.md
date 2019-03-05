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

## Raspberry Pi with Raspbian Stretch

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

{% page-ref page="../guides/using-the-interactive-installer/" %}

## Other Debian based Operating Systems

Determine your device's Debian architecture.

```text
sudo dpkg --print-architecture
```

Locate the matching package at the releases page:

{% embed url="https://github.com/remoteit/installer/releases" caption="" %}

For example, supposing that your Debian architecture is "amd64", look for connectd\_&lt;version&gt;\_amd64.deb.

{% hint style="info" %}
Older x86 based Debian operating systems use a different binary structure, although they report as "amd64" or "i386" identically to the newer versions.

If you encounter any issues, use the corresponding files which have "-etch" in the file name.
{% endhint %}

### Download the Debian package to your system with curl

Right click on the file name at the releases page to copy the download link for the next step.

![](../.gitbook/assets/image%20%2888%29.png)

Use the copied link in a "curl" command as shown below.

```text
$ curl -LkO https://github.com/remoteit/installer/releases/download/v2.2.5/connectd_2.2.5_amd64.deb
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   615    0   615    0     0   1112      0 --:--:-- --:--:-- --:--:--  1112
100  111k  100  111k    0     0  67632      0  0:00:01  0:00:01 --:--:--  307k
$
```

### To install the connectd package

```text
sudo dpkg -i connectd_2.2.5_amd64.deb
```

### To configure remote.it Services on your Debian Linux Device

Follow the link below.

{% page-ref page="../guides/using-the-interactive-installer/" %}

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

