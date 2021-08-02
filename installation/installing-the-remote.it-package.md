# Linux

## New Installation

This guide will step you through the set up of remote.it on **Debian, Ubuntu and Linux** devices using the command line/terminal and an installation package

{% hint style="info" %}
Prerequisites: 

1. You have a remote.it account \(If not, please go ahead and create an account at [https://app.remote.it](https://app.remote.it)
2. You have installed the remote.it Desktop application on a machine you will be using to configure and connect to your device. \(This doesn't need to be on the same network as the device you are setting up\) See [https://remote.it/download/](https://remote.it/download/) for the different options available.
{% endhint %}



## 1. Download the package

Download the installation package to the device where remote.it will be installed \(download locations coming soon\)

## 2. Update apt and install

Open terminal on the target device

```text
sudo apt update
```

Once that completes, then continue with the installation replacing the path and file name as appropriate

```text
sudo apt install ./file
```

When this completes you will see the claim code to use in the desktop application to complete the setup.

{% hint style="warning" %}
You will need this claim code to complete the setup in the next steps
{% endhint %}

![](../.gitbook/assets/2021-07-14-124424_3840x2160_scrot.png)

## 4. Claim and register the device

Open your remote.it desktop application and log in. Then add the device using the registration claim code by clicking the + \(Device Registration\) in the upper left.

![](../.gitbook/assets/screen_shot_2021-07-21_at_4_18_43_pm.png)

You have now successfully registered the device to your account and should see it in your device list. If you get a message that it was not found, this indicates that the device was already claimed.

![](../.gitbook/assets/successfully_registered.png)

## 5. Set up services on your device

You will now define the services/ports for connections. For example SSH, HTTP, VNC, etc.

{% hint style="info" %}
The services you define in remote.it need to be set up and running on the device. For example if you set up VNC in remote.it, but do not have it running, it will not be reachable by remote.it
{% endhint %}

Click on the device to see its details and click the + in the Services panel to add a new service.  


![](../.gitbook/assets/remote_it-2.png)

Select the appropriate service type. Then provide a name, port, and service host address \(Defaults are provided for most services\). Only override default ports if you have assigned a different port for this service on your device.  

Click save. You will now see the new service. 

![](../.gitbook/assets/remote_it_and_downloads.png)

Repeat this process until you have all the services you want available via remote.it. You are now ready to connect and/or share this device.

## Upgrade

XXXX

