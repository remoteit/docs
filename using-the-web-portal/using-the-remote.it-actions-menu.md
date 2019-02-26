# Using the remote.it Actions Menu

The following is a summary of available **Actions** in remote.it. In the Manage Devices view Devices must first be selected to apply any Actions. Use the checkbox to select Device\(s\) first, then apply an Action to the selected Devices. **Actions** may be applied to one or more Devices. The following Actions are available in remote.it and described below:

1. Execute Script
2. Change Category
3. Clear Status
4. Add Sharing
5. Remove Sharing
6. Delete Device

 [![](http://forum.weaved.com/uploads/default/optimized/1X/82ee503b2b2bd01495468b0248aecc3eb5853b3d_1_690x306.png)](http://forum.weaved.com/uploads/default/original/1X/82ee503b2b2bd01495468b0248aecc3eb5853b3d.png)

### **Execute a Script**

Scripts may be used to perform specific actions on your devices if they support scripts. The Status columns can be updated to reflect the Script actions that were performed. 

Several sample scripts are available here:

{% page-ref page="../guides/device-scripting-running-scripts-on-your-devices/" %}

### **Change Category**

Category columns allow you to add additional descriptive information to the selected Devices. Once you add the details, the Category columns can be used to Sort and Group Devices. Example: Add "San Francisco" to selected Devices in Category A column. Now you can sort, group or filter devices by "San Francisco". 

### **Clear Status**

After running a Script, you may choose to Clear a Status Column as it is no longer required. Clear Status does not impact the Script that was previously executed. It simply clears the Column of the text.

### **Add Sharing**

Sharing allows any Device to be shared with another remote.it user. In other words you can grant permission to another remote.it User to access a device\(s\) in your account. This is useful for allowing teams of people \(each with their own login credentials\) to have access to a single device. The device owner has complete control of what other remote.it accounts may connect. In order to share access to a device in your account, the other user must have a valid remote.it user email address. Once the device is shared, the Share column icon will change indicating that Device is shared to another user. See the sample screenshot below.

**PLEASE NOTE:** There is a delay from the time you Share a device\(s\) to another user until the device appears in their Manage Devices view. Please be patient and _**check your email for confirmation**_ that the request was received and is being executed by the remote.it cloud. It might take _**as long as 5-10 minutes after receipt of email notification**_ until the Share status is updated and shown in the remote.it Manage Devices grid.

 [![](http://forum.weaved.com/uploads/default/optimized/1X/576b2d82eb9944005f7670f19fab75e722499cfd_1_690x371.png)](http://forum.weaved.com/uploads/default/original/1X/576b2d82eb9944005f7670f19fab75e722499cfd.png) 

### **Remove Sharing**

When a shared Device is no longer meant to be Shared, use this Action to remove the sharing privileges previously granted. **PLEASE NOTE:** There is a delay from the time you remove Sharing from a device\(s\) until the device disappears from the other User's Manage Devices view. Please be patient and _**check your email for confirmation**_ that the Remove Sharing request was received and is being executed by the remote.it cloud. It might take _**as long as 5-10 minutes after receipt of email notification**_ until the Share status is updated and shown in the remote.it Manage Devices grid.

### **Delete Device**

Remove Device\(s\) from your device list. The Device must be offline to remove it from the Device list. Please note this Action does NOT remove \(uninstall\) any code from your device. In order to uninstall or remove all remote.it software from your device use the Debian dpkg utility:

```bash
sudo dpkg --purge connectd
```



