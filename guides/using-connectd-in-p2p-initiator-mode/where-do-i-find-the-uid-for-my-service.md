# Where do I find the UID for my Service?

You can find the UID \(also known as the "address" or "deviceaddress"\) for each Service in one of two ways.

#### 1 - From the Services Dialog in the remote.it web portal.

Click on the Device Name in the "Devices" page.

![](../../.gitbook/assets/image%20%28393%29.png)

You can now see the list of Services configured on this device, along with their "addresses".

![](../../.gitbook/assets/image%20%28342%29.png)

#### 2 - from the "Device List" API call.

{% page-ref page="../../api-reference/devices/list.md" %}

The /device/list/all API endpoint returns a JSON data block which includes metadata for each configured device and service in your account.  You will need to parse this data block to find the service you are interested in.  Typically this involves looking for the "devicealias" \(which is the Service name\) in the returned JSON block, then extracting the "deviceaddress" \(which is the UID\) from that record. 

