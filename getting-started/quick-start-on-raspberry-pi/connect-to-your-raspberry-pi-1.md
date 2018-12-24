# Connecting to your Raspberry Pi using remote.it

Assuming everything up to here has gone well \(and we hope it has!\), you can now use remote.it to connect to your device!

## Connect to your device

Now, open up [app.remote.it](https://app.remote.it) in your browser of choice and login to remote.it if you haven't already.

You should now see your device in your account device list and you should be able to connect to it. 

Click the device name and then select one of the services you configured to create a connection to the device's service.

For example, if you had an SSH service, you would click the SSH service to connect and after about 10-15 seconds you should be given a hostname \(like `proxy21.rt3.io`\) and a port \(like `33001`\). Now you can connect to the service like so \(assuming a username of `pi`\):

```bash
ssh pi@proxy21.rt3.io -p 33001
```

## Going further

Congrats! You are now securely connecting to devices using remote.it! 

Now that you're up and running, you can:

Connect to more service types like VNC, Nx Witness, RDP and more!

{% page-ref page="../../guides/service-types.md" %}

Share or transfer your devices amongst other remote.it users:

{% page-ref page="../../guides/sharing-and-transferring-devices.md" %}

Build remote.it into your products using bulk or auto registration \(aka mass registration\):

{% page-ref page="../../guides/product-development/using-bulk-and-auto-registration.md" %}

{% page-ref page="../../guides/connecting-to-a-device.md" %}

{% page-ref page="../../guides/connectd.md" %}

{% page-ref page="../../guides/configuring-a-webcam-with-nx-witness.md" %}



