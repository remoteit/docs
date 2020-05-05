---
description: >-
  Follow these instructions to download and install the remoteit package on a Pi
  already using Raspbian Buster.
---

# The remoteit package for Raspbian

The following instructions assume you have access to a command line on your Pi \(using a keyboard and monitor, or over your LAN using SSH\) as well as having established a network connection, either using Wi-Fi or Ethernet.

On the Raspberry Pi command line, type or copy and paste the following commands and press the "Enter" key.

```text
sudo apt update
sudo apt install remoteit
```

Each of these commands will take several tens of seconds to complete as they download required files.  When the process is done, you will see this message displayed.  The details of alternate connection addresses will depend on your network.

```text
================================================================================

Continue your device configuration at http://find.remote.it
                                   or http://raspberrypi.local:29999
                                   or http://192.168.1.243:29999

================================================================================
```

Now go to a browser and type find.remote.it into the URL bar and hit the "Enter" key.

* If you're using the Pi's GUI directly, you can use the Pi's browser.
* If you're connected to the Pi using SSH over the LAN, you can copy the URL to a browser on your local PC.

Now you can access the remoteit web Admin Panel following the instructions [here](https://docs.remote.it/adding-remote.it-to-your-device/raspberry-pi-quick-start#find-your-pi-on-the-lan).

If find.remote.it does not work, try one of the alternate addresses shown when the installation completed.

### Updating the remoteit package

{% hint style="info" %}
We recommend connecting locally when updating existing devices. 
{% endhint %}

When upgrading a remote system, you should use 

```text
nohup sudo apt install remoteit &
```

 to force the upgrade in the background. You may be disconnected during the upgrade, but will be able to reconnect afterwards. The output of the upgrade process will be saved in nohup.out.

### Upgrading from connectd

You can install the remoteit Raspbian package over a previous installation of the older connectd package, version 2.4.26.  Your services and startup scripts will be converted automatically.

{% hint style="warning" %}
Upgrading over connectd ONLY works for Services registered using connectd\_installer or connectd\_register.  Do NOT install remoteit over connectd if you have registered Services using Bulk or Auto Registration.
{% endhint %}

