# remote.itPi Setup Guidelines

## Getting Started

Unlike a traditional Raspberry Pi configuration, remote.itPi has been specifically designed to allow for _**headless**_ configuration, meaning that it can be set up without needing to connect a monitor, keyboard, or mouse to it. Instead, all you need is a computer on the same network, with any modern browser.  

{% hint style="info" %}
**Note:** You may optionally connect a monitor, keyboard and mouse to your Pi to setup
{% endhint %}

Following are instructions to get your remote.itPi setup.

1. Get your remote.itPi on your network.

        a. [Connect with  ethernet](remote.itpi-setup-guidelines.md#recommended-using-ethernet) \(including POE if you have it\).

        b. [Connect with wi-fi](remote.itpi-setup-guidelines.md#using-wi-fi) \(you need to edit one file on the SD card\).

        c. Use a [monitor, keyboard and mouse](remote.itpi-setup-guidelines.md#using-a-monitor-keyboard-and-mouse-connected-to-the-raspberry-pi) connected to the RaspberryPi.

2. [Registering your remote.itPi](remote.itpi-setup-guidelines.md#registering-and-setting-up-remote-access) with remote.it and setting up remote access for your other network resources.
3. How to [connect to your resources](remote.itpi-setup-guidelines.md#connecting-to-your-resources-from-anywhere) from anywhere.
4. How to use [Out of Band Management.](remote.itpi-setup-guidelines.md#using-out-of-band-management)

## 1. Getting your remote.itPi on your Network

### **Recommended:** Using Ethernet 

This is by far the easiest way and required if you want to use out of band management. 

i. Plug the RJ-45 Ethernet cable into the Pi.  If your router/switch supports POE, the Raspberry Pi 4 will power up directly from your router/switch, and you can skip to step 3. If not, user the included power supply to power up your Pi. 

ii. Plug in the provided USB-C power supply to power the Raspberry Pi 4, and wait for the Pi to boot.

### Using Wi-Fi

{% hint style="info" %}
**Note:** if you are connecting your Raspberry Pi to the internet using an Ethernet cable, you can skip this section.
{% endhint %}

i. Insert the remote.itPi SD Card into a Windows PC or Mac.  Use the computer’s file browser to open the file “wpa\_supplicant.conf” on the SD Card.  Edit this file to include your own Wi-Fi SSID and Wi-Fi password as follows.

ii. Navigate to the micro SD's /boot directory and open wpa\_supplicant.conf in a text editor. If you don't see the /boot directory, you may need to remove the micro SD card from the slot, then re-insert it.

iii. On the line that says ssid="YOUR SSID", replace YOUR SSID with the name of your Wi-Fi network. \(Example: ssid="MyWiFi123"\)

iv. On the line that says psk="YOUR PASSPHRASE", replace YOUR PASSPHRASE with the password for your Wi-Fi network. \(Example: psk="P@ssword"\)

v. On the line that says country=US, replace US with your country code. A list of Wi-Fi country codes can be found[ here.](https://github.com/recalbox/recalbox-os/wiki/Wifi-country-code-%28EN%29)

vi. Save the edits made to wpa\_supplicant.conf on the SD Card.

Unedited wpa\_supplicant.conf file on the bundled SD Card:

![](https://lh4.googleusercontent.com/VQbI0l76JyFFRhjT-nAo2QXmg99G_PFUVFvwSOL8g17TOL3FUfU-0oNr_zoHRrpRRfDr1prIDTgYdHqfL1CRqTJNfYuEmx1xSyWG0ea5sMvUPtPOTRM1FrTMjfXb9lPYPHbhzVlv)

vii. Locate the /boot directory on your computer's file directory.

viii. Right-click the /boot directory to access the menu.

ix. Click Eject to eject the micro SD card reader from your computer.

x. You can now insert the SD Card into the Raspberry Pi and boot the Pi.  It will automatically join your Wi-Fi network using the SSID and password entered in steps iii and iv.

### Using a Monitor, Keyboard and Mouse connected to the Raspberry Pi

i. Insert the bundled SD Card into the Raspberry Pi.  Connect an HDMI monitor, USB keyboard, and USB mouse to the proper connectors on the Pi.

ii. Power up the Pi and allow it to boot.

iii. After a minute or so you should see the Pi desktop GUI displayed on your HDMI monitor

You will see a series of pop-up dialogue messages prompting you to set up your Pi.  See below.

![](https://lh5.googleusercontent.com/O1qezyN-YmaczMfppokxBiBXcr8nLrmJLnINe21_cs8HcBJ4mznvW8uAb1-EKdG8ITGBCRbX8ObFlxSRQx5urWve0HA64jFEnRjNQ_Ym9alyWxUkQoTcJjRTrfLXJ1wW2qcTSHDd)

Click the button to “Register my remote.itPi”. This will open the Chromium browser on the Pi and load the remote.itPi login screen. Minimize the browser and DO NOT attempt to register your remote.itPi until your Pi is connected to the Internet and you have completed all the standard Raspbian dialogue boxes that appear.

Click through all the dialogues that appear to set the SSH password, locale, timezone, keyboard layout, Wi-Fi connection, system software update, and finally reboot your Pi.

Move to the next section “Registering and setting up remote access”.

## 2. Registering and Setting-Up Remote Access

i. From a computer on the same network as the Raspberry Pi 4, open a browser and type [find.remote.it](https://find.remote.it) into the browser’s address bar.

ii. Once your Raspberry Pi has finished booting, it should show up here and be ready for registration. If it hasn’t yet shown up, just select ‘search again’ in a couple of minutes. Once your Raspbery Pi is discovered, just hit “Register”.

![](https://lh5.googleusercontent.com/z_8ykN7idge9_6h9_t3YUGTVYCLuagtQwk2SSKT40miEW12Zo0aU-usp4WnCeJ91It67IBqmuwDbOb1bTsv4I4WZWfot9DcpaNw9g_mHjMQRVtVw2-64KsUTWRN02mkCiEOYFrn0)

iii. You will be prompted to sign-in, enter your remote.it credentials here.  If you don’t yet have a remote.it account, please go to [https://remote.it](https://remote.it) to create an account.

iv. Once you have signed in, you will come to the one-click setup page.  This will register your Raspberry Pi to your account, and make it possible for you to remote access it from anywhere using the remote.it service. The three default methods that will be registered will be:  
     a. SSH: a secure shell, so you can command line connect to your RPi 4  
     b. VNC: a remote desktop, so you can use a GUI to access your RPi 4  
     c. The remote.it admin screen.  You can use any browser to remotely configure remote.it on your RPi 4.

{% hint style="info" %}
**Note:** The initial credentials for the Raspberry Pi are the standard defaults of   
**Username:** pi   
**Password:** raspberry
{% endhint %}

v. Once the Raspberry Pi has been registered, you are now ready to set it up to be a remote access gateway to other resources on your network.  Just click on “Scan Network” to start that step.

![](https://lh5.googleusercontent.com/KsbNAyzKzocd9kdpQqSCROBSpmAnbLuZSz97chA3GpjlADswejDGlGJJmMj-a1Frw7sxP6mf3k9mcnuaVXeXZJljmv5t4O9W3Jyxiuz3Z1WG3WvpLV4sX8Teb2nRFyYERWQEJHl5)

vi. Once the network scan is complete, a list of the devices on your network will be presented.  Available services \(application ports\) can be seen if you click the down arrow.

![](https://lh6.googleusercontent.com/kMwFZKz6AKlo9qUwLL0ESQ_fY6lDqyjqCi8-jDtTRstobVwT0sdDqNGpHsK45KC5naVEjK58bxA3x1k0kxFjMiTkJ8lVMN5KlaYtEseCOklLPeFDeP6Qzd1XT-rCDaN_Pj3ijRTq)

vii. In this example, we are setting up remote access connections through the remote.itPi to a Windows remote desktop service, a Apple Mac screen share service, and a network printers administrator screen.

![](https://lh3.googleusercontent.com/RzMccy3t8JUJMnkZ8vpDfEUzs9IyY-nwhYhrcFDXs11xjkXBiaTiSqre01q2SvIUM7gQ2L1NEIBoJDuDAu12ea6fkfiVwHraVewpek1-0UYtl2ufiRJir8ovGBu70bzur5WlCO4C)

viii. Simply click “add” to the services you want to be able to remotely access, then you will be taken to a screen where you can customize the name and confirm the registration by selecting the check box. For the protocol, we’ll attempt to select the correct on \(based on the port selected\) but if you are doing a custom configuration you can manually select this as well.  If unsure, just select TCP, since all Internet services will work with that selection.

![](https://lh5.googleusercontent.com/Lf0c7hPi1krU9ZYLdiTbUf_lZEa_SdwynV8wxSd4dPRE5SLA07vkieXAGqCRYCrh_wdPdDJkdSxLaQmOXEgzSzvALmST6IjYQiiLfYyEh8DPRMS9xs4pphxFKPlRnjqZZunZZOhL)

ix. Once you’ve finished registering the remote access you want, you are ready to test that you can get to your devices.

## 3. Connecting to your Resources from Anywhere

Here is an overview of connection to devices on your network:

{% page-ref page="../lan-sharing.md" %}

## 4. Using Out of Band Management

The remote.itPi includes an out of band management feature, that allows remote access through a secondary Internet connection. This is typically useful if the remote network that you are managing is isolated from the Internet \(no internet connection\) or if perhaps the Internet connection has gone down, and you need a way to get to the network to reset the router.  
  
The following figure, details how the data flows when out of band management is active on the remote.itPi.

![](https://lh6.googleusercontent.com/mE93ymT8clL1MWAmLWxWepbY__44-o6hCOCKIhHkf6kZgsaLxiRYOxpsJey9Uy4s_o3TBHSz3stPP2oBMj4xgRQkMK499lY2EqWBYCTvDkX-CDR9gr1lt1qVtQ6-zHaj8L-EkVYl)

{% hint style="info" %}
**Note:** To use out of band management, the remote.itPi must be connected to the private network \(the network that you would like to manage through the out of band connection\) using the Ethernet jack on the Raspberry Pi.
{% endhint %}

Out of Band Management is automatically activated if the remote.itPi detects that it has a active network connection on the Ethernet port and it also detects an active wi-fi connection, where the out of band wi-fi network that the remote.itPi is preconfigured to look for is:  
  
 **SSID:** remote.itPi  
 **Password**: remote.itPi  
  
If both those conditions are met, out of band mode is automatically detected and the on-screen indicator turns on.

![The OUT OF BAND Indicator on the top right is active.](https://lh6.googleusercontent.com/ad3h01-JDqKMd_rf8xyXSW7vE63MWrHjZ8Ohg8r-b2fu9_yWtxeqN08iEBO9zzUsDAoxi3gvMr2OZudjxA0IfDvuzIuFpePmOEdla9SEfhWpsOvWQYG_jh9faiF7e2is9L0jdzwl)

## 5. Connecting Remotely from Anywhere

Remotely connecting to registered devices and services can be done from:

* [https://remote.it](https://remote.it) web portal
* remote.it applications; available for Windows, Mac, IoS, and Android
* Via our command line tools or APIs; downloads and information available at [https://downloads.remote.it](https://downloads.remote.it)

### Connecting via the Web Portal

When you login to the remote.it web portal, you will see a device list, where your newly registered remote.itPi will appear.

![](https://lh5.googleusercontent.com/kbja2-Og4tdUieLY5o5G8ATCaxYK7XEsxFw1OsHKauAOvREd-VVL6CTf28KLyBvtTR0-HvI1VSe95hFRPV7aDP8xzIgtYHIWD9624fP8OsklI1ntGPOIPVEHYORjOtQMpzkxs-L7)

If you mouse click onto the connect button, you will see a dropdown of the possible remote connections for that device.  If the supported application is a web-browser, then selecting that connection will automatically open a new browser tab with a direct connection to that service.

If you are making a connection to an application where you use client software that expects a URL or a URL:port combination, you will be presented with the following dialog, where the values can be used directly.

![](https://lh6.googleusercontent.com/Id-cG2pTx1MZywtCH4lGANTr0wFu8JwiD1zaW_VUkEDxJRSbsMpanhgjv214wefD8Ju3J0DXQT-E_MQEoY3hmkhnqiyh23kKFJeSwgwO4opcdFcyUPRSh78AKxj5cNJYG4WXZfoN)

In this example, since the target application is Windows Remote Desktop, entering the values as such will launch the connection to the remote computer.

![](https://lh6.googleusercontent.com/-pFosbV26uI2vdKofSWhT8j4yW_lZnpLOaSFP7CT-c5i8KOAoYHglyHhcBbm9h-eN9CRpxdN7aSL7F-jh-DiNwDAl1jF-ZeAR03-PasKSg5rsVl_MSWcOh2Et9IeAkumiDykRH7l)

### Connecting using the remote.it Desktop Application

Connecting using the Desktop App is simple, and a guide to do so can be found here:

{% page-ref page="../guides/using-the-desktop-app/connections.md" %}

![Here is an image of a sample connection made by the Desktop App](https://lh4.googleusercontent.com/xYCwEAW5u4s4rDrOOs38fdbAYXdhenrXvvuI5L6C4MATYH6Mk6I32T_xel7PTkSJgFx27ci7tatX3q1_atwJQBd8koWbfu3RWOOM3ShC281NOUGrNJNNi2LjGxqoMM_0O3nwCZVE)

