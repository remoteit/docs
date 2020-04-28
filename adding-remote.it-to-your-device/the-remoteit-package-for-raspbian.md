---
description: >-
  Follow these instructions to download and install the remoteit package on a Pi
  already using Raspbian Buster.
---

# The remoteit package for Raspbian

The following instructions assume that you have connected a keyboard and mouse to your Pi as well as having established a network connection, either using Wi-Fi or Ethernet.

On the Raspberry Pi command line, type or copy and paste the following commands and press the "Enter" key.

```text
sudo apt update
sudo apt install -y remoteit
```

Each of these commands will take several tens of seconds to complete as they download required files.  When the process is done, you will see this message displayed:

```text
================================================================================

Continue your device registration at http://find.remote.it

================================================================================
```

Now go to a browser and type find.remote.it into the URL bar and hit the "Enter" key.

* If you're using the Pi's GUI directly, you can use the Pi's browser.
* If you're connected to the Pi using SSH over the LAN, you can copy the URL to a browser on your local PC.

Now you can access the remoteit web Admin Panel following the instructions [here](https://docs.remote.it/adding-remote.it-to-your-device/raspberry-pi-quick-start#find-your-pi-on-the-lan).

