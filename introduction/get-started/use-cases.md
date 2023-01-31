# Use Cases

If you have additional questions about using remote.it in your field of expertise send us a message at support@remote.it and we'll schedule a call with our engineers.&#x20;

## Industry

remoteit is being leveraged in factories and heavy industry across the globe. Check out our published case studies to see how heavy industry uses remote.it today.&#x20;

{% embed url="https://link.remote.it/resources/case_study" %}

Most deployments into a factory require customization for installation but bundling remote.it in your product (robots, automation control devices, etc..) allows you to add #ConnectivityAsCode at your production line. Once integrated on the customer's factory floor your engineers and service teams can gain access to perform updates or support as needed. Customer access can also be provided with device sharing.&#x20;

Reducing the need to connect and reconnect to customer site VPNs or require setting up network trusts to update or service your product at a customer's location.

## Cloud

Using remote.it also gives you the ability to configure your security group to completely block traffic from the outside, only allowing access to your instance through remote.it. Keep in mind that remote.it uses Zero Trust/SASE architectures, and is therefore very secure. The only way someone else would have access to your Instance is if you shared it with them through remote.it, or if they had access to your remote.it account. &#x20;

Additionally, all of your instances or resources can be found on the remote.it Web Portal or Desktop App, meaning remote.it can function as a hub for all of your cloud instances and connections, even if they are in different regions. This makes keeping track of all your resources very convenient and easy, as they are all in one place.

How do you access other services where remote.it is not installed? The services you setup are not just for the local target device, you can change your endpoints to other resources in the network by updating the service host address.&#x20;

That means&#x20;

* OpenSearch running as a service is accessible on your desktop.
* Connections to your cache service can be made from localhost.
* Databases running at scale can safely be queried from your code editor as though it was local.
* Machine Learning in the cloud can be leveraged securely from a device in the field.&#x20;
* CI/CD can be leveraged to deploy without opening additional access.

## Cellular or Starlink Devices

Accessing target devices over cellular networks using CGNAT is typically difficult, expensive or just plain impossible.&#x20;

Unlike using a broadband ISP service you not only pay for the privilege of connecting to the network but the bandwidth used. But the fact that you can connect without installing additional infrastructure with faster and faster speeds means this area will explode with growth.

### remote.it goals

To access a remote device at a moments notice while using minimal bandwidth to reduce costs.

#### Reduce Truck Rolls

Service, upgrades and diagnostics can be performed from the office rather than out in the field.&#x20;

#### Reduce bandwidth

You want maximum availability when there is an issue but don't need extra connections running 24/7.

Using the desktop or CLI, connections are available at all times. With persistent address on-demand peer-2-peer connections, once you set it up you can go straight to your 3rd party app without having to call reconnect.&#x20;

#### Bandwidth Usage

If the a device is always online you will use this much data to keep it communicating with remote.it. This is less than 1 email a month to know where a device is and its online status.

**.02 Mbyte per hr, .49 Mbyte per day, 14 Mbyte per month**

Each extra service you add to a device will consume an extra:

**.01 Mbyte per hr, .24 Mbyte per day, 7 Mbyte per month.**

An idle connected service (P2P or proxy) will use the following amount of data:

**.065 Mbyte per hr.**

This is not including the data transferred over the connection when in use.

{% hint style="info" %}
Cellular connected devices may not want to leave idle proxies or P2P connections running.
{% endhint %}
