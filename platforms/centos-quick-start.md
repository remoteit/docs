---
description: Use remote.it on 32 or 64-bit Centos 6 and 7
---

# Centos

If you are using the interactive installer program, you may notice that all Applications are shown as "not detected" in the main menu after installing remote.it Services.

```text
=========================  Installed remote.it Services  ======================
 Service Name       | Protocol | LAN Address        | Port | Application
-------------------------------------------------------------------------------
 Centos-SSH         | SSH      | localhost          | 22   | not detected
 web-8080-centos    | HTTP     | localhost          | 8080 | not detected
-------------------------------------------------------------------------------
```

The Linux utilities **netstat** and **nc** \(which are used for detecting applications\) may not be installed by default.  Please note that this has no effect on configuring remote.it Services.  It means the script can't accurately tell whether the applications are responding.

Optional: To install these utilities, run \(as root or using sudo\):

```text
yum update
yum install nc
yum install net-tools
```

### To install the connectd package

The auto-install.sh script will download and install a tar file to your system. A list of files contained in the tar file can be found in /etc/connectd/builddate.txt.

To run the auto-install-sh script, copy and paste the following 3 lines to your console \(the wget command and the URL which follows are one line\):

```text
wget https://raw.githubusercontent.com/remoteit/installer/master/scripts/auto-install.sh
chmod +x ./auto-install.sh
sudo ./auto-install.sh
```

If you don't see any warnings, run:

```text
sudo connectd_installer
```

to proceed to configure your device.

For more details about tested Linux platforms, please see:

{% page-ref page="supported-platforms.md" %}

### To configure remote.it Services on your Linux Device

{% page-ref page="../guides/using-the-interactive-installer/" %}



