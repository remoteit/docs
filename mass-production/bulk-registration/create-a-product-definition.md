---
description: >-
  The Product Definition describes a set of remote.it Services to install on
  your set of Devices.
---

# Create a Product Definition

Create an account at remote.it, then log in.  From the left hand menu, select “Products”:

![](../../.gitbook/assets/image%20%28111%29.png)

Select “Create Product”:

![](../../.gitbook/assets/image%20%2880%29.png)

Enter info into the “Create Product” dialog, then select “Submit”.

![](../../.gitbook/assets/image%20%28162%29.png)

* Product Name: Think of this as a group of Services \(e.g. ssh, http, vnc\).  Give this group a name to help you remember it.
* Product Platform: Select the platform that your Services will be running on from the list.  If you can't find an exact match, choose the closest option.  It does not affect the functionality of remote.it.
* Product Scope: 
  * Private - this Product is only visible in your account.
  * Public - visible and usable by all remote.it accounts
  * Unlisted - can be used in multiple accounts, but does not appear in the "Public" list.

![](../../.gitbook/assets/image%20%28449%29.png)

On the entry which appears with the name “Raspberry Pi Product”, click on the “gear” icon:

![](../../.gitbook/assets/image%20%2878%29.png)

![](../../.gitbook/assets/image%20%28293%29.png)

On the product settings dialog, use the “Add” button to define the Services you wish to use on your product.  

![](../../.gitbook/assets/image%20%28355%29.png)

Choose the Service type from the list:

![](../../.gitbook/assets/image%20%28426%29.png)

Give the Service a name and define the TCP Port to use.  For most cases, you will want to choose “Check to enable Service to start by default”, but you can turn this off as well.

![](../../.gitbook/assets/image%20%28447%29.png)

When you are done, select the “Check to lock product and create provisioning files” checkbox as shown and click on “Submit”:

![](../../.gitbook/assets/image%20%28338%29.png)

Note that the icons under the “Actions” column have changed:

![](../../.gitbook/assets/image%20%28487%29.png)

Click on the circled “i” icon.  On the “Product Information and Usage” dialog which appears, locate the Bulk Identification Code.  
****

![](../../.gitbook/assets/image%20%28344%29.png)

Note: your Bulk Identification Code will be different from this one.  

With the Bulk Identification Code from the Product Definition, you can create one or more Bulk Registrations.  Typically a Bulk Registration might match a production run of Platforms.  The Bulk Identification Code needs to be written to each Platform that is part of a given Bulk Registration.  Follow the "Next" link below to learn how.  
****

