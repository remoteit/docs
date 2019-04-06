# Supported platforms and installation

remote.it works on nearly any device that has a Linux or Windows operating system and can connect to the internet. We are known to work on the following operating systems and architectures:

## Operating systems

* Linux/Unix \(Ubuntu, Raspbian, CentOS, OpenWRT, etc.\)
* Windows 7 and 10

{% page-ref page="windows-quick-start/" %}

## Linux CPU Architectures

* Intel/AMD
* Arm
* MIPS

## Linux Distributions

The connectd package has been tested with the following distributions:

* Debian
* Raspbian
* Ubuntu
* Linux Mint
* OSMC
* Kali
* Armbian
* Amazon Linux
* OpenWRT
* Vyos
* CentOS

## OS Requirements

Our installer is designed to work with any Linux variant supporting the OS Requirements listed below.  If you find a platform that doesn't work, let us know at support@remote.it.

* The installer scripts require the Bourne sh, normally found in /bin/sh.
* curl with SSL support is required to access remote.it's APIs

## Raspberry Pi with Raspbian Stretch

The Pi Foundation hosts the connectd package at their repositories for a streamlined installation experience.  If you are using Raspbian Stretch, follow the link below.  For older versions of Raspbian or any other Linux OS running on Raspberry Pi, skip ahead to "Download a package for any Linux".

{% page-ref page="quick-start-on-raspberry-pi/" %}

## Download a package for any Linux

The auto-install.sh script will download and install a Debian package if you have a Debian based OS.  For all others, a tar file is downloaded and extracted to your system.  A list of files contained in the tar file can be found in /etc/connectd/builddate.txt.

To run the auto-install-sh script, copy and paste the following 3 lines to your console \(the wget command and the URL which follows are one line\):

`wget` [`https://raw.githubusercontent.com/remoteit/installer/master/scripts/auto-install.sh`](https://raw.githubusercontent.com/remoteit/installer/master/scripts/auto-install.sh)`chmod +x ./auto-install.sh`

`sudo ./auto-install.sh`

If you don't see any warnings, run:

`sudo connectd_installer`

to proceed to configure your device.

