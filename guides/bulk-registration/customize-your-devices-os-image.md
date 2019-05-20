---
description: >-
  Bulk Registration sends the following information from your Platforms to
  remote.it's registration server at boot time: a) Hardware ID b) Registration
  Key c) Bulk Identification Code.
---

# Customize your Platform's OS image

### Preparing your Platform's OS for remote.it Bulk Registration

remote.it Bulk Registration requires you to upload a comma separated variable \(CSV\) file containing information about your mass produced Platforms.  This procedure is described on the next page.    The CSV file must include at least one value \(which we call the **Hardware ID**\) that **must be unique** for all of your Platforms.  You also need to supply a Registration Key.

### Install the connectd package on your device

You may wish to try the interactive installer to test the connectd package on your Platform.  If you do so, be sure to delete all remote.it Services using the interactive installer.  Confirm that the folder _/etc/connectd/services_ is empty prior to continuing with configuration for Bulk Registration.

### **Read Hardware ID and Registration Key at Boot Time**

**Hardware ID**: a unique machine-readable identifier which is known in advance by the OEM.

1. By default, this is the MAC address of the wlan0 network interface. 
2. The Hardware ID can be easily changed to a different value \(for example a serial number, IMEI, or MSN\) by writing the desired value to the file /etc/connectd/hardware\_id.txt.

**Registration Key**: a not necessarily unique identifier known in advance by the OEM.  

1. It can be the same as the Hardware ID, a different unique value, or even a constant.
2. By default, the registration key is the MAC address of the eth0 network interface.
3. The registration key can be easily changed to a different value \(for example a constant, ****serial number, IMEI, or MSN\) by writing the desired value to the file /etc/connectd/registration\_key.txt.

### Using network interfaces other than wlan0 or eth0 to supply the MAC address

The Raspberry Pi 3 with built in wireless LAN, along with the Raspbian Stretch operating system, automatically calls the wireless LAN adapter "wlan0" and the Ethernet adapter "eth0".  However, your Platform may not use these names, or it may only have one network interface available.

Run the "ip -br link" command to view your network interfaces, their names, and MAC addresses.

```text
$ ip -br link
lo               UNKNOWN        00:00:00:00:00:00 <LOOPBACK,UP,LOWER_UP>
enp3s0           UP             1c:1b:0d:be:19:0e <BROADCAST,MULTICAST,UP,LOWER_UP>
wlp2s0           DOWN           f0:03:8c:1b:e5:45 <BROADCAST,MULTICAST>
$
```

This example \(from a Gigabyte Brix PC running  Ubuntu\) shows 3 network adapters:

1. "lo" is the loopback network interface and should not be used for bulk registration.
2. "enp3s0" is the ethernet adapter on this device and is enabled \("UP"\).  Its MAC address is 1c:1b:0d:be:19:0e.
3. "wlp2s0" is the wireless adapter on this device and is disabled \("DOWN"\).  Its MAC address is f0:03:8c:1b:e5:45.  

{% hint style="info" %}
As long as the MAC address is readable and not all zeroes, the network adapter can be used for Bulk Registration even if it is "DOWN", although clearly you need at least one network interface to be "UP", otherwise you will not be able to connect to the internet!
{% endhint %}

It is your choice which network adapter to use for Hardware ID and which to use for Registration Key.  If you only have one network adapter available, we recommend that you use that for both the Hardware ID and the Registration Key.

For this example, let's suppose that you wish to use the MAC address of enp3s0 for your Hardware ID and the MAC address of wlp2s0 for your Registration Key.

1. Edit the file /usr/bin/connectd\_options.
2. Find the line: REG\_ID\_ADAPTER="wlan0" and change it to REG\_ID\_ADAPTER="enp3s0"
3. Find the line: REG\_KEY\_ADAPTER="eth0" and change it to REG\_ID\_ADAPTER="wlp2s0"
4. Save the file /usr/bin/connectd\_options
5. Delete the file /etc/connectd/hardware\_id.txt
6. Delete the file /etc/connectd/registration\_key.txt

### Confirm your settings for Hardware ID and Registration Key

Run the command "sudo connectd\_control show".  This confirms your settings for the Hardware ID and Registration Key.

```text
$ sudo connectd_control show
Hardware ID is f0038c1be545
Registration key is 1c1b0dbe190e
Bulk ID Code is missing. Add your code to bulk_identification_code.txt.
$
```

Note that the colons have been removed from the MAC addresses.  

{% hint style="info" %}
Note that the Bulk ID code is missing.  This is normal at this stage.  The Bulk ID code will be described and added in a following step.
{% endhint %}

### Using values other than MAC addresses for Hardware ID and Registration Key

{% hint style="info" %}
You may wish to use something besides a MAC address for the Hardware ID and Registration Key.  The only requirement here is that the Hardware ID MUST be unique for all Platforms being bulk registered to a given remote.it account.
{% endhint %}

We do not supply functions or scripts to return product serial numbers, IMEIs, MSN, or any other unique information for Bulk Registration, but it is easy for you to supply your own.  The details will be specific to your product.

Let's suppose that your Platform uses an IMEI and an MSN, and that there are command line functions that will show these values.  We will call those functions getIMEI and getMSN \(the user must supply these functions\).  You'll want to be sure that the return value is just the value in question, without any spaces or extra text, for example: 

```text
$ getIMEI
351756051523999
$
$ getMSN
14932456079
$
```

{% hint style="info" %}
You may find it necessary to use Linux utilities "awk" and "sed" to properly format these values.
{% endhint %}

For testing purposes, run the following commands as root, or using "sudo":

```text
getIMEI > /etc/connectd/hardware_id.txt
getMSN > /etc/connectd/registration_key.txt
connectd_control show
```

Example output of "sudo connectd\_control show":

```text
$ sudo connectd_control show
Hardware ID is 351756051523999
Registration key is 14932456079
Bulk ID Code is missing. Add your code to bulk_identification_code.txt.
$
```

**Add the Bulk Identification Code**

First make sure you have completed the Product Definition step.

Now, add the Bulk Identification Code from the Product Information and Usage dialog to:

**/etc/connectd/bulk\_identification\_code.txt**

![](../../.gitbook/assets/image%20%28116%29.png)

#### **Confirm your Bulk Registration settings**

To confirm that your expressions for hardware\_id and registration\_key are working properly, and bulk\_identification\_code.txt is set properly, run "_connectd\_control show_**"**

**Sample output is:**

```text
~ $ connectd_control show
Hardware ID is f0038c1be545
Registration key is 1c1b0dbe190e
Bulk ID Code is 2513F28C-13AD-BEBE-7329-D70C2F5F34A6
~ $
```

**These values should match your expectations:**

### **Configure remote.it to start at boot \(systemd OS\)**

Run "_sudo connectd\_startup\_control_" and enter menu options as shown.

```text
gary@gary-S551LA ~ $ sudo connectd_startup_control

remote.it connection installer Version: 2.3.17 lib_v2.1.17
Modified: April 15, 2019 (library) April 17, 2019
Build date: Thu Apr 18 18:15:02 PDT 2019
======================= Main Menu =======================

    1) Set connectd_start to run at boot (systemd)
    2) Disable connectd_start at boot
    3) Exit

=========================================================
Choose a menu selection (1 - 3):
1

Created symlink from /etc/systemd/system/multi-user.target.wants/connectd_schannel.service to /lib/systemd/system/connectd_schannel.service.
connectd_start configured to boot (systemd)
======================= Main Menu =======================

    1) Set connectd_start to run at boot (systemd)
    2) Disable connectd_start at boot
    3) Exit

=========================================================
Choose a menu selection (1 - 3):
3
$




```

Confirm that connectd.service is configured to start at boot time. Check that the response to the command:

```text
systemctl status connectd | grep Loaded
```

is exactly as shown:

```text
   Loaded: loaded (/lib/systemd/system/connectd.service; enabled; vendor preset: enabled)
```

Confirm that connectd\_schannel.service is configured to start at boot time.  Check that the response to the command:

```text
systemctl status connectd_schannel | grep Loaded
```

is exactly as shown:

```text
Loaded: loaded (/lib/systemd/system/connectd_schannel.service; enabled; vendor preset: enabled)
```

### Configure remote.it to start at boot \(all other OS\)

If the OEM cannot use the supplied systemd compatible startup scripts, then the following calls should be placed into the OEM's startup script.

```text
# any vendor specific commands to set Hardware ID and Registration Key
# should be placed here
/usr/bin/connectd_start
/usr/bin/connectd_schannel start
```

```text

```

