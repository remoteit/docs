---
description: >-
  Here are some error messages you might encounter when making an SSH connection
  using remote.it.
---

# Troubleshooting

To access our full support site, please visit [https://support.remote.it](https://support.remote.it).

### `ssh_exchange_identification: Connection closed by remote host`

#### Problem

If you are attempting to SSH into a device and you get the error message:

```bash
ssh_exchange_identification: Connection closed by remote host
```

#### Possible Solutions

#### Your IP address is different than your original IP address when making a connection

* Are you on a connection over a cellar network?
* Are you behind a proxy server?
* Are you using using a VPN?

If you are using a cellular hotspot, pairing with your phone's cellular connection, using a cellular modem or otherwise connecting over a cellular network, this may happen because the remote.it has detected two different IP addresses when making the connection because some cellular providers route your traffic to IP addresses that they control.

This behavior can also occur if you are using a proxy service or a VPN and you may experience similar issues.

remote.it, by default, only allows connections from the IP address requesting the connection and blocks requests to the service from all other IP addresses. Since your cellular connection changes your IP address, you can no longer connect because we have blocked this other IP address.

The solution is easy however and depends on how you are connecting:

* **Web portal**: If you are connecting from the [app.remote.it](https://app.remote.it) web portal, then you can just click the checkbox to "Make Public" - which disables IP restrictions for this particular connection.

![](.gitbook/assets/image%20%28212%29.png)

* **Mobile**: If you are on mobile, make sure to disable IP address restrictions for the connection.
* **API**: If you are connecting via the API, please make sure to pass the `hostip` parameter in the body of your request set to the IP address given to you by the cellular network. This is _not_ the IP address of your device.  It is the address of your client.

{% hint style="info" %}
**Security Note**  
Note that disabling IP restrictions means that anyone can attempt to make a connection to your device if they know the hostname and port, so this is a potential security concern. Make sure you also follow good security practices like using strong passwords on your device and locking down all incoming connections for all ports.
{% endhint %}

### `ssh: connect to host <HOST> port <PORT>: Connection refused`

#### Problem

When attempting to connect to your device, your receive:

```bash
ssh: connect to host <HOST> port <PORT>: Connection refused
```

Where `<HOST>` is your hostname and `<PORT>` is your port.

#### Possible Solutions

#### Incorrect hostname or port

On possible cause for this is you are not using the correct hostname and port from the connection. This could happen because you copy/pasted one of the values but forgot to copy/paste the other, causing one value to be old and reference an invalid proxy hostname or port.

#### Connection has expired

The connection hostnames and ports obtained through the web portal expire about 8 hours after you request them. So this error will also be seen if you try and connect to an expired connection. You can avoid this problem by using Peer-to-Peer connection mode using a client side daemon. Learn how to use Peer-to-Peer here:

#### connectd daemon has died

If your SSH `connectd` daemon on the device dies after getting the connection URL and port, this could cause the above issue. You can run `ps aux | grep connectd` to see if you have a running connectd process. If you do not, run `sudo connectd_installer` to start the process again.

### `ssh: connect to host <HOST> port <PORT>: Connection timed out`

#### Problem

You are attempting to connect to an SSH service but the connection times out with:

```bash
ssh: connect to host <HOST> port <PORT>: Connection timed out
```

#### Possible Solutions

This error occurs when the hostname \(e.g. `proxy19.remot3.it`\), cannot be contacted. 

The usual causes of `Connection timed out` are:

1. There is a mistake in hostname or port
2. The device is offline but you got a connection assigned to it anyway

In the first case, double check your hostname and port when making your connection.

In the second, make sure your device is online and connected to the internet. If you can, it may also help to restart the device to see if that resolves the issue.

## Other issues?

Are you having trouble that this guide doesn't help you with? Please [contact our support](https://remot3it.zendesk.com) and we would be happy to assist you!



