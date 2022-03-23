# CLI Usage

{% hint style="info" %}
The remote.it CLI has slightly different behavior if you are running as a root user versus a non-root user. In general, you will want to always run as a root user. Examples provided here are **Linux (including Mac)** based, **Windows** users will need to replace`sudo remoteit`with `remoteit.exe`

* **On Windows**, you will need to open a "Command Prompt" as an Administrator
* **On Mac and Linux**, you must run any commands related to creating/managing a Device or Services as a root user (e.g.`sudo`)
{% endhint %}

## Help

&#x20;List the available commands.

```bash
sudo remoteit help
```

## Account

{% hint style="danger" %}
**With 2FA enabled,** you'll need to provide an authentication code when accessing remote.it through your browser, desktop and mobile apps. If you access remote.it using other methods, such as the API or the CLI, you'll need to sign in with credentials using and access key and secret.
{% endhint %}

### Sign In

Without the user and pass options it will prompt for the username and password.

```bash
sudo remoteit signin --user <remote.it username> --pass <password>
```

### Sign in with Credentials

{% hint style="warning" %}
If you switch to using credentials with the CLI `sudo` privileges are no longer required when running many of these commands on the device. All subsequent calls will need to be made by the same user.
{% endhint %}

For accounts that do not have username and password can still use the CLI. Instructions for creating credentials [here](authentication.md#key-management).

create an empty credentials file in your home folder if it doesn't already exist.

```
mkdir -p ~/.remoteit
touch ~/.remoteit/credentials
```

```
remoteit configure
```

You will be prompted to enter your key, secret and user defined profile name

```
key    : R3_ACCESS_KEY_ID
secret : R3_SECRET_ACCESS_KEY
profile: default
```

You must then enable the active profile

```
remoteit configure --profile default --enabled
```

You have successfully signed in with credentials over username and password

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

Adds a new service to this device. This will define a remote.it Service which is running on this machine. NOTE: This does not detect if the actual service is running on this machine. The type option will accept either the ID or Name of an application type and is not case sensitive. Available service types can be found [here](broken-reference).&#x20;

```bash
sudo remoteit add --name <service name> --port <service port> --type <application type> 
```

You can also add a service which connects to an application on another device on the same LAN. The host name can be either an IPv4 IP address or mDNS address (i.e. raspberrypi.local) of the device which is running the application.

```bash
sudo remoteit add --name <service name> --port <service port> --type <application type> --hostname <hostname>
```

### Remove a service

Removes a service from this device. This will cause a disconnect for all other users who had an active connection to this service. If you are concerned about the disconnect, you can use the graphQL API to fetch active connection to this service and then notify users accordingly.

```bash
sudo remoteit remove --id <service id>
```

### Modify a service

Modifies a service on this device. This will cause a disconnect for all other users who had an active connection to this service. If you are concerned about the disconnect, you can use the graphQL API to fetch active connection to this service and then notify users accordingly.&#x20;

The enabled option disables the service without deleting it. The hostname option will modify a service which connects to an application on another device on the same LAN. The host name can be either an IPv4 IP address or mDNS address (i.e. raspberrypi.local) of the device which is running the application. The type option will accept either the ID or Name of an application type and is not case sensitive. Available service types can be found [here](broken-reference).

```bash
sudo remoteit modify --id <service id> --enable <boolean> --port <port> --hostname <hostname> --type <application type> 
```

### Generate P2P connection to service

Once you have created a service on a **target device** you can generate a a persistent address on demand connection from the CLI on your **initiator** device. This requires the service id and **local port**. Verify there are not other connections on the local port before generating.

```bash
sudo remoteit connection add --id <service id> --port <port> --p2p true
```

The connection will be generated in the background. Run the status command to retrieve the generated url in the Address column.

```
sudo remoteit status
 ✓ Fetching status

Connections:
 UID                     | Name         | Type    | Status | Address                                                | Enabled | P2P  | Failover  
----------------------------------------------------------------------------------------------------------------------------------------------
 80:07:06:01:20:30:40:50 | service name | SSH (28)| online | <device_name>-<service_name>.at.remote.it:<local_port> | true    | true | false 
```

### Unregister

Unregister this device from your account and removes the services. This will also remove access to this device for any users to which you have shared this device. This will cause a disconnect for all other users who had an active connection to this service as well. If you are concerned about the disconnect, you can use the graphQL API to fetch active connection to this service and then notify users accordingly. Once unregistered, this device can be registered again.&#x20;

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

