# Using mdns for LAN applications

When you configure a "LAN Application", you need to specify the IP address, or use an mdns address.  mdns, also known as "Bonjour", gives a device a specific host name which can be used on the LAN.  mdns has an advantage over static or other fixed IP addressing methods, in that when the device or your router reboots, while the device may get a different DHCP address each time, the mdns address will stay the same.

By default, the Raspberry Pi Raspbian Stretch OS enables mdns using the "avahi-daemon" service.  Learn more about the avahi service [here](https://avahi.org/).

