# Connect to your Raspberry Pi

## Connecting via ethernet

There are a lot of options for how you can connect to your Raspberry Pi and configure it. In this guide, we will show you what we find the be the simplest approach which is to plug the Pi into your computer using an ethernet cable and then connecting to it over your local network.

## Turn on your Pi

Before you connect to your Pi, it will of course need to be powered on \(but you probably already knew that right?\). To do so:

1. Eject the SD card from your computer \(if it was already connected, that is\)
2. Insert your SD card into your Pi
3. Connect your Raspberry Pi ethernet to your laptop
4. Plug the USB power plug into your Raspberry Pi, which will cause your Pi to boot up

## SSH into your Pi

Now, you can SSH into your Pi \(assuming everything went well!\). To do that on your computer, open up the Terminal \(or whatever command line tool you prefer to use\) and run:

```bash
ssh pi@raspberrypi.local
```

If all goes well, you will be prompted to accept the public key of the Pi and then you will be prompted to login. The default password on a Pi is `raspberry`.

{% hint style="warning" %}
We highly recommend changing the root password of your Pi since the `raspberry` password is very well know and opens up your Pi to attack. 

To change your password, run `passwd` on the command line or do it through `raspi-config`.

You will be prompted to type your old password then set your new password.
{% endhint %}

If everything went smoothly, you can now connect your Pi to the internet! Give yourself a pat on the back and a cookie!

