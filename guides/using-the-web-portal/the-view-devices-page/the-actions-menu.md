# The Actions Menu

The following is a summary of available **Actions** in remote.it. In the Devices view, Devices must first be selected to apply any Actions. Use the checkbox in the leftmost column to select Device\(s\) first, then apply an Action to the selected Devices. **Actions** may be applied to one or more Devices. 

The following Actions are available in remote.it and described below:

1. Share
2. Unshare
3. Execute Script
4. Set Category
5. Clear Status
6. Transfer Device
7. Delete

![](../../../.gitbook/assets/image%20%28374%29.png)

### **Share**

Sharing allows any Device to be shared with one or more remote.it users. Enabling remote.it Sharing grants permission to access a device\(s\) in your account. This is useful for allowing teams of people \(each with their own login credentials\) to have access to a single device. The device owner has complete control of what other remote.it accounts may connect. In order to share access to a device in your account, the other user must have a valid remote.it user account. Once the device is shared, the Share column icon will change indicating that Device is shared to another user. See the sample screenshot below.

{% hint style="info" %}
**PLEASE NOTE:** There is a delay from the time you Share a device\(s\) to another user until the device appears in their Manage Devices view. Please be patient and _**check your email for confirmation**_ that the request was received and is being executed. It might take _**as long as 5-10 minutes after receipt of email notification**_ until the Share status is updated and shown in the remote.it Manage Devices grid.
{% endhint %}

Get more details about Sharing at the link below.

{% page-ref page="../../sharing-devices/" %}

### **Unshare**

When a shared Device is no longer meant to be Shared, use this Action to remove the sharing privileges previously granted.

{% hint style="info" %}
**PLEASE NOTE:** There is a delay from the time you remove Sharing from a device\(s\) until the device disappears from the other User's Manage Devices view. Please _**check your email for confirmation**_ that the Remove Sharing request was received and is being executed. It might take _**as long as 5-10 minutes after receipt of email notification**_ until the Share status is updated and shown in the remote.it Manage Devices grid.
{% endhint %}

{% page-ref page="../../sharing-devices/stop-sharing-a-device-which-was-shared-to-you.md" %}

{% page-ref page="../../sharing-devices/stop-sharing-one-or-more-devices-with-other-user-s.md" %}

### **Execute a Script**

Scripts may be used to perform specific actions on your devices if they support scripts. The Status columns can be updated to reflect the Script actions that were performed. 

Several sample scripts are available here:

{% page-ref page="../../device-scripting-running-scripts-on-your-devices/" %}

### **Set Category**

Category columns allow you to add additional arbitrary information to the selected Devices. Once you add the details, the Category columns can be used to Sort and Group Devices. Example: Add "San Francisco" to selected Devices in Category A column. Now you can sort, group or filter devices by "San Francisco". 

### **Clear Status**

After running a Script which writes status info into the Status Columns, you may choose to Clear a Status Column if it is no longer required. Clear Status does not impact the Script that was previously executed. It simply clears the Status Column.

### Transfer Device

Transfer the selected device\(s\) to another remote.it account. After the transfer is completed, you will no longer see the Device in your account, and it will appear in the selected Contact's account.

{% hint style="info" %}
**PLEASE NOTE:** Device transfer can be performed only on the owner's device. Devices shared from other accounts can not be transferred.  Also, please be aware that the share information will be cleared with the transfer.

Finally, transfers cannot be undone, so make sure you have selected the correct device\(s\) and the correct account to receive the device\(s\).
{% endhint %}

### **Delete**

Remove Device\(s\) from your device list. The Device must be offline to remove it from the Device list. Please note this Action does NOT remove \(uninstall\) any software from your device. In order to uninstall or remove all remote.it software from your device, use the Debian dpkg utility:

```bash
sudo dpkg --purge connectd
```

If you wish to re-install Services on a device which was deleted from your account using the web portal Actions menu, see this [Help Article](https://remot3it.zendesk.com/hc/en-us/articles/360021623891--etc-connectd-services-Connectdssh22-conf-is-not-registered-to-this-account).



