# Usage

{% hint style="info" %}
The remote.it CLI has slightly different behavior if you are running as a root user versus a non-root user. In general, you will want to always run as a root user. Examples provided here are **Linux \(including Mac\)** based, **Windows** users will need to replace`sudo remoteit`with `remoteit.exe`

* **On Windows**, you will need to open a "Command Prompt" as an Administrator
* **On Mac and Linux**, you must run any commands related to creating/managing a Device or Services as a root user \(e.g.`sudo`\)
{% endhint %}

## Help

 List the available commands.

```bash
sudo remoteit help
```

## Account

### Sign In

Without the user and pass options it will prompt for the username and password.

```bash
sudo remoteit signin --user <remote.it username> --pass <password>
```

### Sign Out

```bash
sudo remoteit signout
```

## Device and Service

### Register

Registers this device to your account. Once registered you can no longer register this device. If you need to re-register, unregister first then register. If you just need to move the device to another account, use transfer.

```bash
sudo remoteit register --name <name of your device>
```

### List supported application types

This is referenced in adding a new service or modifying a service

```bash
sudo remoteit supportedApplications
```

### List services on this device

You can add an option of --j or --json to output the results in JSON

```bash
sudo remoteit status
```

### Add a new service on this device

Adds a new service to this device. This will define a remote.it Service which is running on this machine. NOTE: This does not detect if the actual service is running on this machine. The type option will accept either the ID or Name of an application type and is not case sensitive. Available service types can be found [here](usage.md#list-supported-application-types). 

```bash
sudo remoteit add --name <service name> --port <service port> --type <application type> 
```

You can also add a service which connects to an application on another device on the same LAN. The host name can be either an IPv4 IP address or mDNS address \(i.e. raspberrypi.local\) of the device which is running the application.

```bash
sudo remoteit add --name <service name> --port <service port> --type <application type> --hostname <hostname>
```

### Remove a service

Removes a service from this device. This will cause a disconnect for all other users who had an active connection to this service. If you are concerned about the disconnect, you can use the graphQL API to fetch active connection to this service and then notify users accordingly.

```bash
sudo remoteit remove --id <service id>
```

### Modify a service

Modifies a service on this device. This will cause a disconnect for all other users who had an active connection to this service. If you are concerned about the disconnect, you can use the graphQL API to fetch active connection to this service and then notify users accordingly. 

The enabled option disables the service without deleting it. The hostname option will modify a service which connects to an application on another device on the same LAN. The host name can be either an IPv4 IP address or mDNS address \(i.e. raspberrypi.local\) of the device which is running the application. The type option will accept either the ID or Name of an application type and is not case sensitive. Available service types can be found [here](usage.md#list-supported-application-types).

```bash
sudo remoteit modify --id <service id> --enable <boolean> --port <port> --hostname <hostname> --type <application type> 
```

### Unregister

Unregister this device from your account and removes the services. This will also remove access to this device for any users to which you have shared this device. This will cause a disconnect for all other users who had an active connection to this service as well. If you are concerned about the disconnect, you can use the graphQL API to fetch active connection to this service and then notify users accordingly. Once unregistered, this device can be registered again. 

```bash
sudo remoteit unregister --yes
```

### Transfer

Transfer this device and defined services to another account. This will remove your access to this device along with any users to which you had previously shared this device. This will cause a disconnect for all other users who had an active connection to this service. If you are concerned about the disconnect, you can use the graphQL API to fetch active connection to this service and then notify users accordingly. If the account doesn't exist, the transfer will fail. If this is the case, you can sign-in to the [web portal](https://link.remote.it/portal/contacts) and create the contact and then transfer the device from the devices list.

{% hint style="warning" %}
Verify the email address used for the transfer is correct. This device will transfer to the email address provided.
{% endhint %}

```bash
sudo remoteit transfer --to <email address>
```


