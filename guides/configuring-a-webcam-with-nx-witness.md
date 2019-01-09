# Configuring a webcam with Nx Witness

## Create an Nx Witness account

Your first step to setting up an Nx Witness enabled camera is to create an Nx Witness account. You can [signup for a free account here](http://www.networkoptix.com/).

## Setup on your device

Depending on the device you want to setup Nx Witness on, you will need to follow different guides. Here are a few guides from Nx Witness to get you started:

* [Setup Nx Witness on Raspberry Pi / Banana Pi](https://support.networkoptix.com/hc/en-us/articles/217453737-Raspberry-Banana-Pi-Installation-Guide)
* [Setup Nx Witness on Mac OSX](https://support.networkoptix.com/hc/en-us/articles/205096648-Mac-OSX-Installation-Guide)
* [Setup Nx Witness on Windows](https://support.networkoptix.com/hc/en-us/articles/205752937-Windows-OS-Installation-Guide)

## Setup on Raspberry Pi

Since using a Raspberry Pi is so common on remote.it, we wanted to provide some even clearer steps on getting setup.

### Find your download link

Once you've signed into your Nx Witness account, find the ARM download:

![](https://cl.ly/06ae3b372809/Screen%20Shot%202018-12-23%20at%2011.20.55%20PM.png)

Now, find the ARM download and copy the download link

![](https://cl.ly/991815409e98/Screen%20Shot%202018-12-23%20at%2011.22.29%20PM.png)

### Install Nx Witness

Now that you have your Nx Witness ARM ZIP file link, replace `<URL_TO_NX_WITNESS_ZIP>` in the below commands with that link and execute them on the command line of your device:

```bash
sudo cd / 
sudo wget <URL_TO_NX_WITNESS_ZIP>
sudo unzip
sudo chmod +x install.sh
sudo ./install.sh
```

### Run Nx Witness

Now that you've installed Nx Witness you can run the media server with the following:

```bash
sudo /etc/init.d/networkoptix-mediaserver start
```

### Start on boot

To have Nx Witness start when your device reboots, run the following command:

```bash
sudo update-rc.d networkoptix-mediaserver defaults
```

## Configuring your device

Now that you have Nx Witness running on your device, you need make sure your device is configured to connect to the Nx Witness service.

To do so, **create a new TCP service** using the remote.it connectd installer \(by running `sudo weavedconnectd` on the command line\) and **set the port to 7001**.

