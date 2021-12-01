# LAN Sharing

Sharing a service across your local network is a great easy way to reduce time spent setting up additional machines with their own accounts. The share is done on a specific service and you can control who can access it.&#x20;

Secure it for your private network and hide from your guest network.&#x20;

With remote.it installed anywhere on the network you now have the control to share it with specific or a range of IPs.&#x20;

* **Bind Address**
  * The IP address of the LAN device that hosts the service. 0.0.0.0 will default to the private IP of the device it is setup on.
* **Local Network Security**
  * **IP Latching**
    * The first IP to attempt to connect will be the only IP that can access the share
  * **Class-A,B,C Restrictions**
    * A: IP restricted to network mask `/8`&#x20;
    * B: IP restricted to network mask `/16`
    * C: IP restricted to network mask `/24`
  * **Single IP Restriction**
    * Restrict the share to a specific IP address on the network
  * **None**
    * No network restrictions. The service is shared with any IP that attempts to connect.

![](<../../.gitbook/assets/lan sharing.png>)

