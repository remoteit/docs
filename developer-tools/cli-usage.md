# CLI Usage

{% hint style="info" %}
The remote.it CLI has slightly different behavior if you are running as a root user versus a non-root user. In general, you will want to run as a root user, though there are a couple cases where you don't.  These will be made clear.

* **On Windows**, you will need to open a "Command Prompt" as an Administrator
* **On Mac and Linux**, you must run any commands related to creating/managing a Device or Services as a root user (e.g.`sudo`)
{% endhint %}

## Help

List the available commands.

{% tabs %}
{% tab title="Linux/Mac" %}
```bash
sudo remoteit help
```
{% endtab %}

{% tab title="Windows" %}
```
remoteit help
```
{% endtab %}
{% endtabs %}

## Version

Get the version of CLI installed

{% tabs %}
{% tab title="Linux/Mac" %}
```bash
sudo remoteit version
```
{% endtab %}

{% tab title="Windows" %}
```
remoteit version
```
{% endtab %}
{% endtabs %}

**Example output**

```
3.0.14
```

## Account

{% hint style="danger" %}
**With 2FA enabled,** you'll need to provide an authentication code when accessing remote.it through your browser, desktop and mobile apps. If you access remote.it using other methods, such as the API or the CLI, you'll need to sign in with credentials using an access key and secret.
{% endhint %}

### Sign In

Without the user and pass options it will prompt for the username and password.

{% tabs %}
{% tab title="Linux/Mac" %}
```bash
sudo remoteit signin --user <remote.it username> --pass <password>
```
{% endtab %}

{% tab title="Windows" %}
```
remoteit signin --user <remote.it username> --pass <password>
```
{% endtab %}
{% endtabs %}

### Sign in with Credentials

**For accounts that have 2FA enabled OR do not have a username and password (i.e. Google sign in), you can still use the CLI**. In this situation, the CLI will use a credentials file which contains an access key and access key secret to execute all CLI commands.

Instructions for creating an access key and secret can be found [here](authentication.md#key-management).

{% tabs %}
{% tab title="Linux/Mac" %}
{% hint style="warning" %}
If you switch to using credentials with the CLI `sudo` privileges are no longer required when running many of these commands on the device. All subsequent calls will need to be made by the same user.
{% endhint %}

Create a credentials file in the .remoteit directory of the user home directory, if it doesn't already exist.

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
{% endtab %}

{% tab title="Windows" %}
{% hint style="warning" %}
If you switch to using credentials with the CLI all commands can be run from a **non-adminstrative** command prompt. All subsequent calls will need to be made by the same user.
{% endhint %}

Create a credentials file in the .remoteit directory of the user account which will be using the CLI, if it doesn't already exist.

```
mkdir -p %USERPROFILE%\.remoteit
type nul > %USERPROFILE%\.remoteit\credentials
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
{% endtab %}
{% endtabs %}

### Sign Out

{% tabs %}
{% tab title="Linux/Mac" %}
```bash
sudo remoteit signout
```
{% endtab %}

{% tab title="Windows" %}
```
remoteit signout
```
{% endtab %}
{% endtabs %}

## Device and Service

### Register

Registers this device to your account to allow access. This is not needed if you only need to initate a connection to another device. Once registered you can no longer register this device.&#x20;

If you need to re-register, unregister first, then register. If you just need to move the device to another account, use transfer.&#x20;

After registration, you can then add services to this device to allow other devices to connect to this device.

{% tabs %}
{% tab title="Linux/Mac" %}
```bash
sudo remoteit register --name <name of your device>
```
{% endtab %}

{% tab title="Windows" %}
```
remoteit register --name <name of your device>
```
{% endtab %}
{% endtabs %}

### List supported application types

This is referenced in adding a new service or modifying a service

{% tabs %}
{% tab title="Linux/Mac" %}
```bash
sudo remoteit supportedApplications
```
{% endtab %}

{% tab title="Windows" %}
```
remoteit supportedApplications
```
{% endtab %}
{% endtabs %}

New application types are added all of the time, but common ones are listed below.\


```
 ID      | Name                | Default Port   | Protocol   | Description               
-------------------------------------------------------------------------------------------
 42      | Admin Panel         | 29999          | TCP        | remote.it admin panel     
 43      | Terraria            | 7777           | TCP        | Terraria server           
 8       | HTTPS               | 443            | TCP        | Secure web protocol       
 8       | HTTPS               | 443            | TCP        | Secure web protocol       
 8       | HTTPS               | 443            | TCP        | Secure web protocol       
 28      | SSH                 | 22             | TCP        | Secure shell terminal     
 4       | VNC                 | 5900           | TCP        | VNC remote desktop        
 34      | SMB/CIFS            | 445            | TCP        | Internet file sharing     
 32770   | WireGuard           | 51820          | UDP        | WireGuard VPN server      
 32771   | Minecraft Bedrock   | 19132          | UDP        | Minecraft Bedrock server  
 1       | TCP                 | 0              | TCP        | Generic TCP               
 41      | Minecraft           | 25565          | TCP        | Minecraft server          
 7       | HTTP                | 80             | TCP        | Web protocol              
 5       | RDP                 | 3389           | TCP        | Microsoft remote desktop  
 39      | OpenVPN             | 1194           | TCP        | OpenVPN server            
 7       | HTTP                | 80             | TCP        | Web protocol              
 32769   | UDP                 | 0              | UDP        | Generic UDP               
 37      | NxWitness           | 7001           | TCP        | Nx Witness VMS            
 38      | Nextcloud           | 443            | TCP        | Nextcloud hub  
```

### List services and status on this device <a href="#cli_status" id="cli_status"></a>

You can add an option of --j or --json to output the results in JSON

{% tabs %}
{% tab title="Linux/Mac" %}
```bash
sudo remoteit status
```
{% endtab %}

{% tab title="Windows" %}
```
remoteit status
```
{% endtab %}
{% endtabs %}

**Example output**

Device and services are this device information. Connections are connections from this device to other services.

```
Device:
 UID                        | Name                             | Type              | Status       | Address                 
------------------------------------------------------------------------------------------------------------------------------
 80:00:XX:XX:XX:XX:XX:C6    | My-MBP-15                        | device            | connected    | 127.0.0.1:65535         


Services:
 UID                        | Name                             | Type              | Status       | Address                  | Enabled  
-----------------------------------------------------------------------------------------------------------------------------------------
 80:00:XX:XX:XX:XX:XX:C6    | vnc                              | VNC (4)           | connected    | 127.0.0.1:5900           | true     
 80:00:XX:XX:XX:XX:XX:C6    | remoteit admin                   | Admin Panel (42)  | connected    | 127.0.0.1:29999          | true     
 80:00:XX:XX:XX:XX:XX:C6    | ssh                              | SSH (28)          | connected    | 192.168.1.60:3389        | true     


Connections:
 UID                        | Name                             | Type              | Status       | Address                                                    | Enabled   | P2P   | Failover  
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 80:55:XX:XX:XX:XX:XX:C6    | rds-mssql-replica                | TCP (1)           | ready        | someservice.at.remote.it:33002   | true      | false | false     
 80:00:XX:XX:XX:XX:XX:C6    | Minecraft SSH                    | SSH (28)          | ready        | minecraft-ssh.at.remote.it:33001                 | true      | false | false     

```

### Add a new service on this device

Adds a new service to this device. This will define a remote.it Service which is running on this machine. NOTE: This does not detect if the actual service is running on this machine. The type option will accept either the ID or Name of an application type and is not case sensitive. Available service types can be found [here](broken-reference).&#x20;

{% tabs %}
{% tab title="Linux/Mac" %}
```shell
sudo remoteit add --name <service name> --port <service port> --type <application type> 
```



Example adding an SSH service

```bash
sudo remoteit add --name "my ssh service" --port 22 --type 28
```
{% endtab %}

{% tab title="Windows" %}
```bash
remoteit add --name <service name> --port <service port> --type <application type>
```



Example adding an SSH service

```bash
remoteit add --name "my ssh service" --port 22 --type 28
```
{% endtab %}
{% endtabs %}



You can also add a service which connects to an application on another device on the same LAN. This is also referred to as a [jumpbox](../features/connection-options/jump-service.md). The host name can be either an IPv4 IP address or mDNS address (i.e. raspberrypi.local) of the device which is running the application.

{% tabs %}
{% tab title="Linux/Mac" %}
```bash
sudo remoteit add --name <service name> --port <service port> --type <application type> --hostname <hostname>
```



Example of adding service to "jump" to RDP on a windows desktop on the LAN

```bash
sudo remoteit add --name "my windows RDP" --port 3389 --type 28 --hostname "192.168.1.60"
```
{% endtab %}

{% tab title="Windows" %}
```
remoteit add --name <service name> --port <service port> --type <application type> --hostname <hostname>
```



Example of adding service to "jump" to RDP on windows desktop on the LAN

```bash
remoteit add --name "my windows RDP" --port 3389 --type 28 --hostname "192.168.1.60"
```
{% endtab %}
{% endtabs %}

### Remove a service from this device

Removes a service from this device. This will cause a disconnect for all other users who had an active connection to this service. If you are concerned about the disconnect, you can use the graphQL API to fetch active connection to this service and then notify users accordingly. Use the [status command](cli-usage.md#list-services-on-this-device) to get the service ID.

{% tabs %}
{% tab title="Linux/Mac" %}
```bash
sudo remoteit remove --id <service id>
```
{% endtab %}

{% tab title="Windows" %}
```
remoteit remove --id <service id>
```
{% endtab %}
{% endtabs %}

### Modify a service on this device

Modifies a service on this device. This will cause a disconnect for all other users who had an active connection to this service. If you are concerned about the disconnect, you can use the graphQL API to fetch active connection to this service and then notify users accordingly.&#x20;

The enabled option disables the service without deleting it. The hostname option will modify a service which connects to an application on another device on the same LAN. The host name can be either an IPv4 IP address or mDNS address (i.e. raspberrypi.local) of the device which is running the application. The type option will accept either the ID or Name of an application type and is not case sensitive. Available service types can be found [here](broken-reference).

{% tabs %}
{% tab title="Linux/Mac" %}
```bash
sudo remoteit modify --id <service id> --enable <boolean> --port <port> --hostname <hostname> --type <application type> 
```
{% endtab %}

{% tab title="Windows" %}
```
remoteit modify --id <service id> --enable <boolean> --port <port> --hostname <hostname> --type <application type> 
```
{% endtab %}
{% endtabs %}

### Generate connection to service

Once you have created a service on a **target device** you can generate a a persistent address on demand connection from the CLI on your **initiator** device. This requires the service id and **local port**. Verify there are not other connections on the local port before generating. Learn more about [peer to peer vs proxy](../features/connection-options/peer-2-peer-and-proxy.md). The connection will be attempted as peer to peer (p2p) first with a proxy failover if allowed. In some cases such as https and http it will be a reverse proxy connection.

Below is a general connection add command for a peer to peer connection.

{% tabs %}
{% tab title="Linux/Mac" %}
```bash
sudo remoteit connection add --id <service id> --port <port> --p2p true
```

The connection will be generated in the background. Run the [status command](cli-usage.md#list-services-on-this-device) to retrieve the generated url in the Address column

```
sudo remoteit status
 ✓ Fetching status

Connections:
 UID                     | Name         | Type    | Status | Address                                                | Enabled | P2P  | Failover  
----------------------------------------------------------------------------------------------------------------------------------------------
 80:07:06:01:20:30:40:50 | service name | SSH (28)| online | <device_name>-<service_name>.at.remote.it:<local_port> | true    | true | false 
```
{% endtab %}

{% tab title="Windows" %}
```
remoteit connection add --id <service id> --port <port> --p2p true
```

The connection will be generated in the background. Run the [status command](cli-usage.md#list-services-on-this-device) to retrieve the generated url in the Address column.

```
remoteit status
 ✓ Fetching status

Connections:
 UID                     | Name         | Type    | Status | Address                                                | Enabled | P2P  | Failover  
----------------------------------------------------------------------------------------------------------------------------------------------
 80:07:06:01:20:30:40:50 | service name | SSH (28)| online | <device_name>-<service_name>.at.remote.it:<local_port> | true    | true | false 
```
{% endtab %}
{% endtabs %}



### Unregister

Unregister this device from your account and removes the services. This will also remove access to this device for any users to which you have shared this device. This will cause a disconnect for all other users who had an active connection to this service as well. If you are concerned about the disconnect, you can use the graphQL API to fetch active connection to this service and then notify users accordingly. Once unregistered, this device can be registered again.&#x20;

{% tabs %}
{% tab title="Linux/Mac" %}
```bash
sudo remoteit unregister --yes
```
{% endtab %}

{% tab title="Windows" %}
```
remoteit unregister --yes
```
{% endtab %}
{% endtabs %}

### Transfer

Transfer this device and defined services to another account. This will remove your access to this device along with any users to which you had previously shared this device. This will cause a disconnect for all other users who had an active connection to this service. If you are concerned about the disconnect, you can use the graphQL API to fetch active connection to this service and then notify users accordingly. **If the account doesn't exist, the transfer will fail.** If this is the case, you can sign-in to the [web portal](https://link.remote.it/portal/contacts) and create the contact and then transfer the device from the devices list.

{% hint style="warning" %}
Verify the email address used for the transfer is correct. This device will transfer to the email address provided and cannot be undone. The new owner would need to transfer the device back to you.
{% endhint %}

{% tabs %}
{% tab title="Linux/Mac" %}
```bash
sudo remoteit transfer --to <email address>
```
{% endtab %}

{% tab title="Windows" %}
```
remoteit transfer --to <email address>
```
{% endtab %}
{% endtabs %}
