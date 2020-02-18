# Verifying Auto Registration and Cloning

### Verify Devices and Services are active

Restart the device with the following command:

```text
sudo reboot
```

 Login to [app.remote.it](http://app.remote.it) and verify that your new device appears in the [remote.it](http://remote.it) Devices screen.

{% hint style="info" %}
Note: This can take a few minutes to complete and requires a page refresh.
{% endhint %}

#### Cloning <a id="Cloning"></a>

 Now, you need to stop all running [remote.it](http://remote.it) Services and “factory reset” the current unit with the following commands:

```text
sudo connectd_control stop all
sudo connectd_control reset
```

This clears all the provisioning files from the subfolders beneath /etc/connectd, but it does not delete those folders. The Bulk Identification Code is also left in place, so the device is ready to be auto registered.

{% hint style="warning" %}
 **NOTE:** Do not reboot your system at this point or run any of the previous provisioning, preparation, or check scripts.
{% endhint %}

Shutdown the system gracefully with the following command:

```text
sudo shutdown now
```

Stop here and make cloned SD cards per your normal procedure. You can also repeat the above procedure \(starting with Production Preparation\) on multiple SD cards if for some reason you are not able to clone them.







