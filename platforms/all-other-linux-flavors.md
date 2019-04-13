---
description: instructions for non-Debian Linux Operating Systems
---

# All other Linux flavors

**To install the connectd package**

The auto-install.sh script will download and install a tar file to your system. A list of files contained in the tar file can be found in /etc/connectd/builddate.txt.

To run the auto-install-sh script, copy and paste the following 3 lines to your console:

```text
curl -LkO https://raw.githubusercontent.com/remoteit/installer/master/scripts/auto-install.sh
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

**To configure remote.it Services on your Linux Device**

{% page-ref page="../guides/using-the-interactive-installer/" %}

