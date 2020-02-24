---
description: instructions for non-Debian Linux Operating Systems
---

# Other Linux flavors

**To install the connectd package**

The auto-install.sh script will download and copy a tar file to your system.   To download and run the auto-install.sh script, copy and paste the following 3 lines to the device's console, then press the "Enter" key:

```text
curl -LkO https://raw.githubusercontent.com/remoteit/installer/master/scripts/auto-install.sh
chmod +x ./auto-install.sh
sudo ./auto-install.sh
```

Some files will be downloaded and tested in order to find a package which will run on your device.  Assuming that a matching package can be identified, the following instructions will be displayed for you to complete manually.  The exact file name may be different than that shown below.

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

{% page-ref page="../guides/using-the-interactive-installer/" %}

