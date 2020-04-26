---
description: Information about integrating remote.it Bulk Registration into your device.
---

# Bulk Registration OEM reference

### **Available characters**

[remote.it](http://remote.it/) is able to handle only ASCII characters. Japanese including Kanji is not available. For example, the name of the install folder, hardware id, registration key, information used for bulk registration in web portal can use only ASCII.

### **File System Requirements**

For proper operation on the shipping product, connectd files contained in /usr/bin MAY be placed in a read-only partition after any customization.  

All files contained in   /etc/connectd and below MUST be in a persistent read/write partition.

Optionally the OEM may provide a means to both:

* Transfer data in the folder /etc/connectd to a persistent area when changes are made during the bulk provisioning process.  Edit /usr/bin/connectd\_save\_config to perform this function if needed.
* Restore data from persistent storage to /etc/connectd at boot time.

### **Glossary of terms**

Platform: Any type of mass produced embedded system used with remote.it, such as a cell modem or a Raspberry Pi.

Application: a program such as ssh, nginx or tightvncserver that communicates with a client program using a single TCP socket. A remote.it Service enables the user to remotely connect to an Application.

Service: a remote.it connection to an Application. For example remote.it allows the user to connect via a Service to an Application such as an ssh Application or a vnc Application. For example the vnc Application may be RealVNC or tightvncserver. Each remote.it connection is viewed by remote.it as a separate Service. Every remote.it Service should be attached to an Application.

Product: a template defining a set of Services you wish to install on a Platform.

Device: a set of remote.it Services installed on a Platform using the Product template and registered to a remote.it account. 

Device registration: The action that creates a remote.it Device \(with its predefined set of Services\) in a remote.it account, making that account the “owner” of the Services in the remote.it system.

Device owner: The remote.it account that has access to a remote.it Device in their account, and has the authority to share that Device to other remote.it accounts.

Device Name: An account unique general name given to a remote.it Device to identify it within the remote.it system.  The Services are associated to the Device Name using the Hardware ID.  All Services on a Device share the same Hardware ID.

Hardware ID:  A machine readable unique identifier \(e.g. network interface MAC address\) for a Platform, which is used by the remote.it system to identify a physical device.  All Services registered on the same physical device share the same Hardware ID.

Registration key: A not necessarily unique identifier for a Platform, which will be used by the remote.it system to register that Platform to a remote.it account.  

Bulk Identification Code: A unique identifier for a Platform, which matches the code created when you defined the Product \(a specific set of connectd Services\).  During Provisioning, the connectd\_control script sends this code to the remote.it servers.  The servers respond with  information used to configure connectd services on the Platform.

Provisioning: part of Registration that is performed after the Platform is shipped. Provisioning starts with the device sending the Bulk Identification Code, Hardware ID, and Registration Key to the remote.it API server. If the Bulk Identification Code, Hardware ID, and Registration Key all match the Bulk Registration information previously uploaded, then the API server responds by providing download links to the device for the required Provisioning Files, with one Provisioning File for each defined Service. The device then downloads the Provision Files using the links provided by the API server. The final part of Provisioning is the start-up of the remote.it daemon using the downloaded Provisioning Files.

