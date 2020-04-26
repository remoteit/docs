# Auto Registration Information

{% hint style="info" %}
Auto registration is currently hosted at [https://beta.remote.it](https://beta.remote.it)
{% endhint %}

### Device Identification <a id="Device-Identification"></a>

Auto registered devices identify themselves using two pieces of information. These are platform specific and customized by the Developer. For the standard RPi package, the ARM CPU ID and the active network MAC address are the system identifiers. These are provided to the service upon registration and if either change, the Clone or Duplicate Detection process will force the device to reset and register again using the new system identifiers.

For other devices, Developers can use the /etc/connectd/oem\_settings file to customize these identifiers.

### Automatic Duplicate Detection <a id="Automatic-Duplicate-Detection"></a>

In normal cases, especially with RPi, it’s likely the SD card would be moved to another device or a new prepared SD card placed in a previously registered device. In these cases, [remote.it](http://remote.it) has the ability to detect a duplicate and force the device to re-register. This is new behavior that occurs when the device is started.

When duplicate detection occurs, remote.it will show a newly cloned device with an incremental counter appended to the hardware ID and name. Below is an example of a duplicate/cloned reset device.

![](../../../../.gitbook/assets/image%20%28412%29.png)

### Need help?

 For more information or help, contact [support@remote.it](mailto:support@remote.it).

