# Registration into a User's Account

This method of device setup allows for manufacturing or mass setup of devices which have the same platform and OS distribution. This can support complete image writes. Once the customer receives their device, there would be a mechanism to get the customer's account license key written to the device's registration file on the system.\
This method will result in the following when the device boots and connects to the internet for the first time after the registration file is present:

* The device will be registered to the customer's account
* The device will need to be configured with appropriate services for their use.

This method is supported for any platforms which can install the [Device Package](../software/device-package/supported-platforms.md#device\_package\_supported\_platforms).

## Setup

Using a device which will be used in your production line, install the device package and test the setup of the device including services and connections before creating master device or image with the bellow procedure. This is merely to test that the installation and functionality of remote.it are as desired.&#x20;

### 1. Install remote.it package on your device with empty "registration" file

Download the compatible package for your device from the [Device Package](../software/device-package/installation.md#supported-platforms).&#x20;

{% hint style="info" %}
Create a file in /etc/remoteit called "registration" (no extension) with nothing in it before installing the package. This is essential in case the device is turned on with internet connection to prevent the device from registering with remote.it prematurely. And please make sure no other files in /etc/remoteit when installing the package.
{% endhint %}

```bash
sudo mkdir -p /etc/remoteit
sudo touch /etc/remoteit/registration 
```

Install the package onto your device.

```bash
sudo apt install ./remoteit-4.14.1.armhf.rpi.deb
```

### 2. Copy the image onto another device

For example, if this were a raspberry pi, you would copy the SD card onto a new SD card and insert it into the new device

If this device is something you will deliver to a customer, you may want to have a local interface on the device which will take the input of the customer's license key, write it to the /etc/remoteit/registration file and execute /usr/share/remoteit/refresh.sh. (steps for the user to get their key can be found below) Upon reboot and first time online this device will automatically register to the account to which the license belongs. Then the user will be able to add services to the remoteit device using the Desktop Application.

### 3. User receives the device and registers his account

The user will need to have the remote.it desktop application installed on a device. [There are distributions for Windows, Mac, and Linux](../software/desktop/overview-and-installation.md). Then they can create an account from there if they do not already have one.

The user will need to retrieve their remote.it license from the Desktop Application, click "...More", then click on "Licensing". Then copy the License Key.\


![](<../.gitbook/assets/screen\_shot\_2021-09-08\_at\_5\_10\_23\_pm (2).png>)

The user will need to have the license key written to the /etc/remoteit/registration file either manually or via an interface that you provide on the device received.&#x20;

Once the license key has been written to the device's /etc/remoteit/registration file, then the device can be refreshed (execute /usr/share/remoteit/refresh.sh) and when the device is able to reach the internet (wifi, cellular or ethernet connection), it will register to the user's account

### 4. User configures the device via the desktop application

The user may need to click the refresh the application icon for the device to appear in the device list.&#x20;

Following the [directions here](../software/device-package/installation.md#4-set-up-services-on-your-device), the user can add and remove services via the desktop application. You may want to provide your user&#x20;





