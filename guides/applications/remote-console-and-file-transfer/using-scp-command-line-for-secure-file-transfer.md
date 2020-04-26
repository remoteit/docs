---
description: 'For Windows 10 Command Prompt, Linux and macOS'
---

# Using SCP command line for secure file transfer

SCP \(Secure Copy Protocol\) is a widely used means of sending files from one system to another over a network.  SCP uses the SSH server on the target, so there is no need to set up a remote.it Service for SCP if you already have a remote.it Service for SSH installed.

We'll assume that you've already used the [interactive installer](../../using-the-interactive-installer/) or [bulk registration](../../bulk-registration/) to configure a remote.it Service for SSH on your target device.

### The SCP command line

Supposing that you wish to transfer a file "bigfile.bin" in the current folder on your client system to the /home/pi/Downloads folder on the target system, run the following command line.  You will need to place the username in the command line as shown.

```text
$ scp -P <port> <path to local file> <target user name>@<hostname>:<full path to target folder>mes out as:
```

### Using a Peer-to-Peer \(P2P\) Connection

If you are using one of the methods to set up a [peer to peer connection](../../../peer-to-peer-p2p-vs.-proxy-connections/peer-to-peer-connections.md), the hostname will be localhost \(127.0.0.1\) and the port will be as shown by the P2P connection method you are using.

For example, using the Desktop app for Windows:

![](../../../.gitbook/assets/image%20%28362%29.png)

You can now use this information on the scp command line as shown.

```text
C:\Users\You>scp -P 33000 bigfile.bin pi@localhost:/home/pi/Downloads
The authenticity of host '[localhost]:33000 ([127.0.0.1]:33000)' can't be established.
ECDSA key fingerprint is SHA256:89b83FWn9SdVi9Mp2jwN8lDWu0STbWxfyLrCUgQsj9E.
Are you sure you want to continue connecting (yes/no)?
Warning: Permanently added '[localhost]:33000' (ECDSA) to the list of known hosts.
pi@localhost's password:
bigfile.bin                                   100%  204KB   2.5MB/s   00:00

C:\Users\You>
```

### Using a proxy connection

A proxy connection will be returned when you [make a connection through the remote.it website](../../using-the-web-portal/), or use the [/device/connect API endpoint](../../../api-reference/devices/connect.md).  You will get a hostname and port that will look something like this:

![](../../../.gitbook/assets/image%20%2887%29.png)

```text
$ scp -P 34836 bigfile.bin pi@proxy13.remot3.it:/home/pi/Downloads
The authenticity of host '[proxy13.remot3.it]:34836 ([69.64.70.155]:34836)' can't be established.
ECDSA key fingerprint is SHA256:89b83FWn9SdVi9Mp2jwN8lDWu0STbWxfyLrCUgQsj9E.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '[proxy13.remot3.it]:34836,[69.64.70.155]:34836' (ECDSA) to the list of known hosts.
bigfile.bin                                                                     100%  498KB 498.5KB/s   00:00    
$ 

```

