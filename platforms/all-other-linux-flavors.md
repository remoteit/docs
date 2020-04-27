---
description: instructions for Debian and non-Debian Linux Operating Systems
---

# All Linux distributions

## **To install the connectd package**

If you have a Debian compatible OS, the auto-install.sh script will download and install a compatible Debian package on your system.   

If you don't have a Debian compatible OS, the auto-install.sh script will download a compatible Debian tar file onto your system.   Then just follow a few steps to install it.

#### Non-root user

To download and run the auto-install.sh script, copy and paste the following 3 lines to the device's console, then press the "Enter" key:

```text
curl -LkO https://raw.githubusercontent.com/remoteit/installer/master/scripts/auto-install.sh
chmod +x ./auto-install.sh
sudo ./auto-install.sh
```

#### Root user

```text
curl -LkO https://raw.githubusercontent.com/remoteit/installer/master/scripts/auto-install.sh
chmod +x ./auto-install.sh
./auto-install.sh
```

### Debian OS:

The Debian architecture will be determined and a suitable package will be downloaded and installed using the "dpkg" command.

If you wish to install a tar package instead \(e.g. in case the script can't find a compatible Debian package\), then run:

```text
sudo ./auto-install.sh f
```

### Non-Debian OS:

Some files will be downloaded and tested in order to find a package which will run on your device.  You may see some error messages during this step.  Assuming that a matching package can be identified, the following instructions will be displayed for you to complete manually.  The exact file name may be different than that shown below.

```text
We downloaded the file connectd_2.4.26_arm-linaro-pi.tar to the current folder.
As root, or using sudo, move this file to the / folder.
e.g.
mv connectd_2.4.26_arm-linaro-pi.tar /

Now switch folders to the / folder, e.g.
cd /

Then extract the files to your system with the following command:
tar xvhf connectd_2.4.26_arm-linaro-pi.tar
```

After you run these commands, a list of files contained in the tar file will be found in /etc/connectd/builddate.txt.

If you don't see any warnings, run:

```text
sudo connectd_installer
```

to proceed to configure your device.

If auto-install.sh cannot find a matching package, please contact support@remote.it with the output of the following commands:

```text
uname -a
cat /etc/os-release
cat /proc/cpuinfo
file /bin/ls
```

For more details about tested Linux platforms, please see:

{% page-ref page="supported-platforms.md" %}

**To configure remote.it Services on your Linux Device**

{% page-ref page="../adding-remote.it-to-your-device/using-the-interactive-installer/" %}

