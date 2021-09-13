# Registration with Pre-configured Services

This method of device setup allows for manufacturing or mass setup of devices which have the same platform and OS distribution. This can support either complete image writes or a simple install of remote.it and the addition of registration file placed in a specific directory.  
Either method will result in the following when the device boots and connects to the internet for the first time:

* The device will be registered to the same account
* The device will be configured with the same services which were defined

This method is supported for any platforms which can install the [Device Package](../device-package/installation.md#supported-platforms) and only supports the device to be used as connection endpoints and not as an initiator of connections.

## Setup

Using a device which will be used in your production line, install the device package and test the setup of the device including services and connections before creating master device or image with the bellow procedure. This is merely to test that the installation and functionality of remote.it are as desired. 

### 1. Define Your Device Service Configuration \(Product\)

Go to [https://app.remote.it/\#products](https://app.remote.it/#products) and click "Create Product"

Enter a name that you will recognize for this device definition, select an appropriate platform for the device, and select "Private" for Product Scope.

Once created, it will appear in the list of products. Click the gear icon to add the service configuration.

Add the services you want to have on these devices \(make sure to select the "Check to enable Service to start by default" to allow the service to be started otherwise you will need to do it manually via terminal access to the device\)

Once you have added all of the services, click the checkbox for "Check to lock product and create provisioning files" to get your registration code.

{% hint style="info" %}
If you need to add a service after locking the product, those services will be disabled by default. Therefore it is recommended that you create a new product for new devices. Previous devices will need to have the services added manually via the Desktop Application and cannot be altered via the product definition.
{% endhint %}

### 2. Retrieve the Bulk Identification Code

Click on the "i" icon next to the gear icon to display the Bulk Identification Code. 

Copy this code which will be used in the step 4.

### 3. Install remote.it package on your device with empty "registration" file

Download the compatible package for your device from the [Device Package](../device-package/installation.md#supported-platforms).

{% hint style="info" %}
Create a file in /etc/remoteit called "registration" \(no extension\) with nothing in it before installing the package. This is essential in case the device is turned on with internet connection to prevent the device from registering with remote.it prematurely. And please make sure no other files in /etc/remoteit when installing the package.
{% endhint %}

```bash
sudo mkdir -p /etc/remoteit
sudo touch /etc/remoteit/registration 
```

Install the package onto your device.

```bash
sudo apt install ./remoteit-4.13.5.armhf.rpi.deb
```

### 4. Set the Bulk Identification Code

Write the Bulk Identification Code you retrieved in step 2 to a "registration" file.

```bash
sudo echo YOUR-BULK-IDENTIFICATION-CODE > /etc/remoteit/registration
```

### 5. Start production

You are now ready to use this device as an image for the rest of your devices. For example on a Raspberry Pi you can copy the SD card and insert it into another Raspberry Pi.

When these devices are booted with connection to the internet, they will automatically be registered into the account which created the product definition with the defined services enabled.

 







#### 





