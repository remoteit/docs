---
description: >-
  You'll want to confirm that your OS image is set up correctly for Bulk
  Registration prior to manufacturing.
---

# Verify Bulk Registration

If you have correctly followed all of the steps in this section, you should be able to reboot your Platform, and after it boots up, the corresponding Device should appear online in the remote.it "Devices" page.

![](../../.gitbook/assets/image%20%28362%29.png)

### Debugging Bulk Registration

In the unlikely event that your Device does not appear online with 5 minutes after booting, please try the following.

Confirm that the Bulk Identification Code, Hardware ID, and Registration Key all look correct:

```text
~ $ connectd_control show
Hardware ID is f0038c1be545
Registration key is 1c1b0dbe190e
Bulk ID Code is 2513F28C-13AD-BEBE-7329-D70C2F5F34A6
~ $
```

Perform a factory reset of the device.

{% hint style="danger" %}
Factory reset clears any downloaded configuration files from your device.  If this device had completed bulk registration already, in order to bulk register this specific device again, you’ll need to first delete the Bulk Registration which referenced this device \(on the Registrations page of the web portal\), and then re-upload and publish the Bulk Registration CSV file again. Use Factory Reset with caution!
{% endhint %}

```text
~ $ sudo connectd_control reset
OK: factory reset
~ $
```

Trigger the download of provisioning \(configuration\) files.  You should see a file download for each Service configured in your Product Definition \(including the Bulk Service\).

```text
$ sudo connectd_control -v dprovision
.
Checking 2513F28C-13AD-BEBE-7329-D70C2F5F34A6
need to download
downloaded provisioning ok (200)
Config file does not exist.
Creating config file...
write config for 2513F28C-13AD-BEBE-7329-D70C2F5F34A6
generate pfile for 2513F28C-13AD-BEBE-7329-D70C2F5F34A6
.
Checking 545293BD-B24E-188C-2CDA-92BD1BC1346C
need to download
downloaded provisioning ok (200)
Config file does not exist.
Creating config file...
write config for 545293BD-B24E-188C-2CDA-92BD1BC1346C
generate pfile for 545293BD-B24E-188C-2CDA-92BD1BC1346C
 ~ $
```

Trigger the connection of the daemons to your account.  You should see the "provisioned... enabled... started" sequence for each Service configured in your Product Definition \(including the Bulk Service\).

```text
_$ sudo connectd_control -v bprovision all
.
Bulk provisioning 2513F28C-13AD-BEBE-7329-D70C2F5F34A6
Hardware ID is f0038c1be545 registration key is 1c1b0dbe190e
Calling API...
OK: 2513F28C-13AD-BEBE-7329-D70C2F5F34A6 is provisioned
OK: 2513F28C-13AD-BEBE-7329-D70C2F5F34A6 enabled
OK: 2513F28C-13AD-BEBE-7329-D70C2F5F34A6 has started
.
Bulk provisioning 545293BD-B24E-188C-2CDA-92BD1BC1346C
Hardware ID is f0038c1be545 registration key is 1c1b0dbe190e
Calling API...
OK: 545293BD-B24E-188C-2CDA-92BD1BC1346C is provisioned
OK: 545293BD-B24E-188C-2CDA-92BD1BC1346C enabled
OK: 545293BD-B24E-188C-2CDA-92BD1BC1346C has started
~ $
```

Within 5 minutes, the status of the device should change to "Online" as indicated by the green check.

![](../../.gitbook/assets/image%20%28366%29.png)

To prepare this device's OS image to be cloned for manufacturing, run:

```text
sudo connectd_control reset
```

{% hint style="danger" %}
Factory reset clears any downloaded configuration files from your device.  If this device had completed bulk registration already, in order to bulk register this specific device again, you’ll need to first delete the Bulk Registration which referenced this device \(on the Registrations page of the web portal\), and then re-upload and publish the Bulk Registration CSV file again. Use Factory Reset with caution!
{% endhint %}

If you are having any difficulty at this point, please send an e-mail to support@remote.it so we can help you!

