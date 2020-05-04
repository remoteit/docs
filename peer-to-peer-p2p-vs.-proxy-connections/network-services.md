---
description: >-
  You can use the remote.it application running on one device or PC to access
  TCP servers on other devices on the same LAN, without needing to install
  remoteit on those other devices.
---

# Network Services

When you install remoteit software, whether the remote.it App or the headless install, you have the following options.

1. Set up and initiate connections to other Devices in your account.
2. Configure Services on the current Device to accept incoming connections.
3. Configure Network Services on the current Device to access other TCP servers on the LAN.

This article talks about option 3.  Typically you will set up a Network Service for one of the following reasons.

1. The target devices is not compatible with remote.it, or there's no way to install remoteit software onto it \(e.g. a NAS or printer\).
2. You want the connection to the target device to be under the control of your PC, laptop, or mobile device, rather than running independently.  

In order for Network Services to be configured properly, the target device will need to have one of the following:

1. A static IP address
2. An equivalent to a static IP address, e.g. "DHCP Reservation" through your router, so it always appears on the same LAN IP address.
3. An mdns or "Bonjour" address, such as raspberrypi.local, which is unique for all devices on your LAN.  Note that if you use the avahi-daemon on a Raspberry Pi, and you have more than one running on the same LAN, their mdns names will be indexed, e.g. raspberrypi-1.local, raspberrypi-2.local, which may not work properly as the assignment is not predictable.

To configure Network Services if you have installed the [remoteit App](../adding-remote.it-to-your-device/the-remote.it-desktop-app-for-windows-and-macos..md) or the [remoteit Raspbian package,](../adding-remote.it-to-your-device/the-remoteit-package-for-raspbian.md) follow the instructions given [here](network-services.md).

If you would like to configure Network Services and you have installed the [connectd ](../platforms/all-other-linux-flavors.md)package, follow [these instructions](../adding-remote.it-to-your-device/using-the-interactive-installer/add-a-service-to-a-lan-application/) instead.

