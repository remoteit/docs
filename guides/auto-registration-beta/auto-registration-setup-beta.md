---
description: >-
  These instructions are for setting up a master remote.it device or repeating a
  cloning process to produce multiple devices for Auto Registration.
---

# Auto Registration Setup \(Beta\)

{% hint style="info" %}
Auto registration is currently hosted at [https://beta.remote.it](https://beta.remote.it)
{% endhint %}

The interactive installer "connectd\_installer" is not needed for Auto Registration and services created on the same device will be disabled during this procedure.  Ideally, you should start with an image which has not had any remote.it Services previously installed.

#### What’s Needed <a id="What&#x2019;s-Needed"></a>

* A master device with SSH access \(e.g. baseline Raspberry Pi using the published setup instructions\)
* Access to the Auto Registration Beta [remote.it](http://remote.it) installer package which can be downloaded here [https://github.com/remoteit/installer/releases/tag/v2.5.28](https://github.com/remoteit/installer/releases/tag/v2.5.28)
* A [remote.it](http://remote.it) account
* Auto registration is currently only available at [beta.remote.it](http://beta.remote.it)

It only takes a few minutes to set up a master SD card for cloning or a single device based on Auto Registration. Follow these directions carefully and in order.

The context of this document is focused on giving OEMs a means to prepare and clone an OS image for mass production. Future releases include an improved UX to identify and manage cloned devices and the inclusion of Auto Registration in CLI for Target Mode and eventual Installer replacement.

### Set up Using remote.it <a id="Setup-Using-remote.it"></a>

Start by visiting [beta.remote.it](http://beta.remote.it) and sign-in using your [remote.it](http://remote.it) account. Define a Product and Auto Registration to prepare for the device setup later on.

