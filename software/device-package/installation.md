# Installation

## New Installation

This guide will step you through the set up of remote.it on **Debian, Ubuntu and Linux** devices using the command line/terminal and an installation package on a device which remoteit has not been previously installed.

{% hint style="warning" %}
Prerequisites:&#x20;

1. You have a remote.it account (If not, please go ahead and create an account at [https://app.remote.it](https://app.remote.it))
2. You have installed the remote.it Desktop application on a machine you will be using to configure and connect to your device. (This doesn't need to be on the same network as the device you are setting up) See [https://remote.it/download/](https://remote.it/download/) for the different options available.
3. SSH access to the device you want to install remote.it and connect to
{% endhint %}

## Quick Install

This quick install allows you to just paste a single command into the terminal of the target device. You must have the Desktop App installed and a remote.it account created before proceeding.

### 1. Open the remote.it Desktop App

Your desktop app must be version 3.5.2 or greater.&#x20;

### 2. Click add device and select "Raspberry Pi and Linux"

![](../../.gitbook/assets/Screen\_Shot\_2022-02-08\_at\_12\_04\_30\_PM.png)

### 3. Copy the code and paste into the terminal window of your target device

This command will automatically detect the platform and architecture of your device. It then downloads and installs the appropriate package. It will then register the device to your account.

### 4. Set up services

Your desktop app should notify you that your new device has been registered. remote.it will automatically detect and set up SSH.

If you have additional services you would like to add, follow the directions provided [here](installation.md#4.-set-up-services-on-your-device).\


## Manual Installation

We recommend using the quick install method above since it will download the package and install it automatically. You can use this method if you prefer to select the package and install it manually.

### 1. Download the package

Open a terminal window on the device where remote.it will be installed, then download the package.&#x20;

Example below is for a specific pi package. Please use the appropriate package url. This will place the file in your home directory [click here ](supported-platforms.md#device\_package\_supported\_platforms)for specific packages and urls.&#x20;

**For Debian OS distributions, if you are not sure of the architecture, you can run the following command:**

```
sudo dpkg --print-architecture
```

{% hint style="info" %}
sudo command is only required on systems where you are not logged in as root.&#x20;
{% endhint %}

```
sudo wget [URL for Package 
(i.e. https://downloads.remote.it/remoteit/v4.14.1/remoteit-4.14.1.arm64.deb)]
```

### 2. Update your package manager and install

{% tabs %}
{% tab title="apt" %}
Continue in terminal on the target device

```
sudo apt update
```

Once that completes, then continue with the installation replacing the path and file name as appropriate

```
sudo apt install [file name (i.e. ./remoteit-4.14.1.armhf.rpi.deb)]
```

**When this completes you will see the claim code to use in the desktop application to complete the setup.**
{% endtab %}

{% tab title="opkg" %}
Continue in terminal on the target device

```
opkg update
```

Once that completes, then continue with the installation replacing the path and file name as appropriate

```
opkg install ./file
```

**When this completes you will see the claim code to use in the desktop application to complete the setup.**
{% endtab %}

{% tab title="yum" %}
Continue in terminal on the target device

```
sudo yum update
```

Once that completes, then continue with the installation replacing the path and file name as appropriate

```
sudo yum install ./file
```

**When this completes you will see the claim code to use in the desktop application to complete the setup.**
{% endtab %}

{% tab title="pacman" %}
Continue in terminal on the target device

```
sudo pacman -Syy
```

Once that completes, then continue with the installation replacing the path and file name as appropriate

```
sudo pacman -U ./file
```

**When this completes you will see the claim code to use in the desktop application to complete the setup.**
{% endtab %}
{% endtabs %}

{% hint style="warning" %}
You will need this claim code to complete the setup in the next steps. Save it until you complete registering the device.&#x20;

**This claim code is valid for 24 hours. If not used before then, re-run your installation command to get a new code.**
{% endhint %}

![](../../.gitbook/assets/2021-07-14-124424\_3840x2160\_scrot.png)

### 3. Claim and register the device

Open your remote.it desktop application and log in. Then add the device using the registration claim code by clicking the + (Device Registration) in the upper left.

![](../../.gitbook/assets/screen\_shot\_2021-08-04\_at\_2\_41\_25\_pm.png)

You have now successfully registered the device to your account and should see it in your device list. If you get a message that it was not found, this indicates that the device was already claimed.

### 4. Set up services on your device

You will now define the services/ports for connections. For example SSH, HTTP, VNC, etc.

{% hint style="info" %}
The device itself must be online to set up any services. The services you define in remote.it need to be set up and running on the device. For example if you set up VNC in remote.it, but do not have it running, it will not be reachable by remote.it
{% endhint %}

Click on the device to see its details and click the + in the Services panel to add a new service.\


![](../../.gitbook/assets/screen\_shot\_2021-08-04\_at\_3\_02\_26\_pm-2.png)

Select the appropriate service type. Then provide a name, port, and service host address (Defaults are provided for most services). Only override default ports if you have assigned a different port for this service on your device. &#x20;

Click save. You will now see the new service.&#x20;

![](../../.gitbook/assets/screen\_shot\_2021-08-04\_at\_3\_05\_21\_pm.png)

Repeat this process until you have all the services you want available via remote.it. You are now ready to connect and/or share this device. Visit [connections page](https://support.remote.it/hc/en-us/articles/360048935411-Connections) or the [sharing page](https://support.remote.it/hc/en-us/articles/360053354671-Device-Service-Sharing).

## Upgrades

{% hint style="warning" %}
If you have a device with Desktop or CLI installed, upgrade those applications directly. If you have a version of remoteit which is older than 3.0, please [contact support](https://support.remote.it/hc/en-us/requests/new) so that we can assist you directly.
{% endhint %}

To upgrade a device with remoteit device package Version 3.0 and higher installed follow these instructions.

### 1. Connect to ssh service on your device

Start an ssh connection (either directly or through remoteit) OR terminal and direct access to the target device

### 2. Download the package

Create an ssh connection to the device via remote.it and open terminal. (If you do not have a remoteit ssh service defined, you can [create one](installation.md#4-set-up-services-on-your-device) or connect directly by using either the LAN or direct hardware console access)

Download the installation package to the device where remote.it will be installed. Example below is for a specific pi package. Please use the appropriate package url. This will place the file in your home directory [See above](installation.md#supported-platforms).

```
sudo wget https://downloads.remote.it/remoteit/v4.13.7/remoteit-4.13.7.armhf.rpi.deb
```

### 3. Install the new package

This will step will update the remoteit target daemon and preserve the previously defined services and configurations. age manager as appropriate. i.e. Opkg, RPM or another package manager

{% tabs %}
{% tab title="apt" %}
Continue in terminal on the target device

```
sudo apt update
```

{% hint style="warning" %}
If using remoteit to access ssh to the device, you will lose your ssh connection to the device during this step. This is normal since we are replacing the daemon and remoteit will restart the service.&#x20;
{% endhint %}

During this step your desktop app will notify you that the device has gone offline. This is normal as the remoteit target service will stop during upgrade. \
Once this step completes you will again be notified that the device has come back online. If you were using the desktop for your connection, this connection will resume.

```
sudo nohup apt install ./file &
```
{% endtab %}

{% tab title="opkg" %}
Continue in terminal on the target device

```
opkg update
```

{% hint style="warning" %}
If using remoteit to access ssh to the device, you will lose your ssh connection to the device during this step. This is normal since we are replacing the daemon and remoteit will restart the service.&#x20;
{% endhint %}

You may also need to install nohup which is not installed by default on most systems. This allows the installation to continue once the upgrade is in process and ssh hangs up temporarily.

```
opkg install coreutils-nohup
```

During this  next step your desktop app will notify you that the device has gone offline. This is normal as the remoteit target service will stop during upgrade. \
Once this step completes you will again be notified that the device has come back online. If you were using the desktop for your connection, this connection will resume.

```
nohup opkg install ./file &
```


{% endtab %}

{% tab title="yum" %}
Continue in terminal on the target device

```
yum update
```

{% hint style="warning" %}
If using remoteit to access ssh to the device, you will lose your ssh connection to the device during this step. This is normal since we are replacing the daemon and remoteit will restart the service.&#x20;
{% endhint %}

You may also need to install nohup which is not installed by default on most systems. This allows the installation to continue once the upgrade is in process and ssh hangs up temporarily.

```
yum install coreutils
```

During this  next step your desktop app will notify you that the device has gone offline. This is normal as the remoteit target service will stop during upgrade. \
Once this step completes you will again be notified that the device has come back online. If you were using the desktop for your connection, this connection will resume.

```
nohup yum install ./file &
```
{% endtab %}
{% endtabs %}

## Uninstall

These instructions apply to the remoteit Device Package Version 4 and higher.

{% hint style="danger" %}
**If you remove remote.it software while using a remote.it connection you will lose access to the device through our service immediately.**
{% endhint %}

Follow this link:

[https://support.remote.it/hc/en-us/articles/360054866351-Removing-the-remoteit-package-or-Desktop-application](https://support.remote.it/hc/en-us/articles/360054866351-Removing-the-remoteit-package-or-Desktop-application)

At this point, you can then go to your device list (either in the Desktop Application or in the web portal at [https://app.remote.it/#devices](https://app.remote.it/#devices) and delete the device to remove it from your device registry.
