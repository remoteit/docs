---
description: >-
  We’ve included a couple of scripts to help you make sure that your device’s OS
  image is ready for duplication.
---

# Production Preparation

To check that your device's OS image is ready for cloning, run:

```text
sudo connectd_check_production_ready
```

Sample output:

```text
pi@raspberrypi:~ $ sudo connectd_check_production_ready
CPU ID:00000000890252e3
Hardware ID:b827eb0252e3
Registration Key:ACTION: registration key is not set properly. Fix oemGetDefaultRegistrationKey() in /etc/connectd/oem_settings
Ok:  device is cloneable for production
pi@raspberrypi:~ $
```

Known issue: Note that even though the message says "OK", the "ACTION" message indicates that you need to do something first.

In this case, check /etc/connectd/oem\_settings. The issue is that this Raspberry Pi has no wireless LAN adapter, the MAC address of which is used for the Registration Key. I edited the network adapter used for the Registration Key to be “eth0” instead of “wlan0”.

When everything is OK, the connectd\_check\_production\_ready command will return without any "ACTION" messages:

```text
pi@raspberrypi:~ $ sudo connectd_check_production_ready
CPU ID:00000000890252e3
Hardware ID:b827eb0252e3
Registration Key:b827eb0252e3
Ok:  device is cloneable for production
pi@raspberrypi:~ $
```

Once all errors and warnings are resolved, use connectd\_prepare\_production:

```text
pi@raspberrypi:~ $ sudo connectd_prepare_production
You should correct all ACTION and FAIL conditions before continuing
CPU ID:00000000890252e3
Hardware ID:b827eb0252e3
Registration Key:b827eb0252e3
Ok:  device is cloneable for production
Do you want to setup this system for cloning (y/n)? y
Please check blinking LED on the Pi to confirm identity. It will blink for about 30 seconds.
..........
Are you sure? This is permanent! (y/n)? y
remote.it server channel daemon start/stop script Version: 2.5.28
connectd_schannel.arm-linaro-pi not currently active. Nothing to stop.
STATUS: No active devices to stop
OK: factory reset
Enter the Bulk Identification Code: 877B54F9-185C-49E1-1178-79777F9538C3
Created symlink /etc/systemd/system/multi-user.target.wants/connectd.service → /lib/systemd/system/connectd.service.
Created symlink /etc/systemd/system/multi-user.target.wants/connectd_schannel.service → /lib/systemd/system/connectd_schannel.service.
Ready: The device is cloneable for production.
pi@raspberrypi:~ $
```

This command will blink an LED on the Raspberry Pi to help you identify it in the event you have several of them. You will be asked to enter the Bulk Identification Code which you saved earlier. 

Finally, the script confirms that the device is ready to prepare for cloning:

```text
Ready: The device is cloneable for production.
```

