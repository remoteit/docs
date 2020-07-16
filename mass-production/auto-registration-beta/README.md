---
description: >-
  Auto Registration lets you add a predefined set of remote.it Services to mass
  produced devices.
---

# Auto Registration - Getting started

{% hint style="info" %}
Auto registration is currently supported using the connectd package version 2.5.36 or later.
{% endhint %}

When a device which has been configured to use remote.it Auto Registration boots up and connects to the internet, it downloads the matching configuration files to your device, registers and starts the Services without need for user intervention.

### When to Use Auto Registration <a id="When-to-Use-Auto-Registration"></a>

 Use Auto Registration when you want to easily enable a predefined group of [remote.it](http://remote.it) Services on a number of devices which all use the same OS image.

### Auto Registration vs. Bulk Registration <a id="Auto-Registration-vs-Bulk-Registration"></a>

Auto Registration is similar to Bulk Registration \([https://docs.remote.it/guides/bulk-registration](https://docs.remote.it/guides/bulk-registration)\), but is less restrictive.

* Bulk Registration:
  *  requires you to know the Hardware ID and Registration Key for each device, and to upload this information to your [remote.it](http://remote.it) account in the form of a CSV \(comma separated variable\) file. This allows you to control which devices are allowed to register themselves to your account.
  * Duplicate Hardware IDs are rejected at the time of CSV file upload.
  * The Device Name is specified for each device in the CSV file.
* Auto Registration:
  *  will allow any Hardware ID to register as long as the Bulk Identification Code matches.
  * No CSV upload is required.
  * Duplicated Hardware IDs, while best avoided, are handled \(if necessary\) by appending an index \(e.g. “-1”\) onto the Hardware ID prior to completing registration.
  * The Device Name is based on the Hardware ID.

