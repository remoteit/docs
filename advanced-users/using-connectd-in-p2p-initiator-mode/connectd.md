---
description: >-
  This describes the use of the connectd daemon as a P2P (peer-to-peer)
  initiator, also known as client mode, on macOS and Linux operating systems.
---

# Using connectd in P2P initiator mode on macOS and Linux

## **Download the connectd daemon**

The connectd daemon is used on your target device to enable remote.it Services.  The same connectd daemon is used on the initiator device, at the other side of a P2P connection, although in a different mode, in order to connect to those Services.  This guide describes the use of connectd on the initiator device.

The commands below show you how to use the macOS console to download and run the connectd daemon on a computer running macOS.  Although this example is for the macOS version of the daemon, we have [many other versions of daemon available](https://github.com/remoteit/misc_bins_and_scripts/tree/master/connectd).

```bash
# Download the most recent release (this is for OSX)
curl -LkO https://github.com/remoteit/misc_bins_and_scripts/raw/master/connectd/connectd.x86_64-osx
# Make it executable
chmod u+x connectd.x86_64-osx 
# Move to a folder on your PATH
mv connectd.x86_64-osx /usr/local/bin/
# Add a connectd symlink to point at the daemon
ln -s /usr/local/bin/connectd.x86_64-osx /usr/local/bin/connectd
```

### Quick install for Linux systems

Please follow the instructions at the link below to install the connectd daemon on any Linux system.  This also takes care of creating a connectd symlink.

{% page-ref page="../../platforms/all-other-linux-flavors.md" %}

### Run connectd Network Diagnostics 

To confirm that you have the correct connectd daemon for your device and its OS, and that your network is configured correctly to allow a remote.it connection, run _connectd -n_ at the command line in order to run remote.it Network Diagnostics.  You may have to configure any virus checker that you are using in order to allow connectd to be run.  The output from _connectd -n_ should be similar to the following:

```text
My-Air-2:~ macuser$ connectd -n
Connectd built Apr 19 2019 at 16:46:38 Now Starting Up
   Version 4.6 - (c)2019 remot3.it, Inc. All Rights Reserved
   Built with BCASTER MALLOC_POOL RESOLVE BIGBUF BACKTRACE pool=524288
   MAC OSX Version
alloc pool


Running Network Diagnostics
---------------------------------
Checking if DNS works ... .[OK]
Checking TCP connectivity to remote.it...<oip=192.168.1.40> [OK]
Checking UDP connectivity to remote.it...
Send to 69.64.90.20:5959 [] [mip=76.103.217.56] [oport=59612 mport=59612] [preserve port] 
Send to 69.64.90.20:5960 [] [mip=76.103.217.56] [oport=59612 mport=59612] [no remap] [preserve port] 
Send to 69.64.90.128:5961 [] [mip=76.103.217.56] [oport=59612 mport=59612] [no remap] [preserve port different IP] [OK]

This router preserves ports, this is optimal.
This router doesn't remap new connections to new ports.
Static Pool Free 
Endian : Little
SHA1 test:
  passed.
RC4 test:
  passed
XXTEA test:
  passed.
Looks compatible.
Mac-Air-2:~ macuser$ 
```

### Different ways to use the connectd daemon as a P2P initiator

Next, we describe three ways you might use the connectd daemon as a P2P initiator:

1. Using explicit command line parameters in foreground mode
2. Using explicit command line parameters in background mode
3. Using a provisioning file in background mode.

#### Background vs. foreground mode

If you are using the P2P connection for an application that does not require the use of the command line \(e.g. a web browser\), then you may run connectd in the foreground \(also called interactive mode\).  When you are done, you can simply type CTRL-C to terminate the connectd daemon.  Foreground mode is demonstrated in option 1 below.

Foreground mode is useful for debugging if you have any problems initiating a P2P connection as it will show you connection status.

The examples supplied for options 2 and 3 use "&" at the end of the connectd command line to force the connectd daemon to run in the background.  This allows you to continue to use the same command prompt for an SSH connection, for example.  

If you are developing your own apps including P2P mode, you'll need to keep track of the process ID \(PID\) so that you can kill the connectd daemon when you are done using the P2P connection.  Examples 2 and 3 show two different ways this can be done.

{% hint style="warning" %}
Note that the "-c" method, which passes the username and password, is deprecated.  These scripts have not yet been updated.  Find more info [here](running-connectd-using-an-authhash.md).
{% endhint %}

#### Option 1: connectd P2P using connectd with command line parameters

```bash
connectd -c \
  BASE_64_USER \
  BASE_64_PASSWORD \
  DEVICE_UID \
  BIND_PORT \
  ENCRYPTION_MODE \
  LOCAL_HOST_ADDRESS \
  MAXOUTSTANDING
```

#### Options

| Option | Description |
| :--- | :--- |
| `-c` | Run connectd in P2P initiator mode |

#### Parameters

<table>
  <thead>
    <tr>
      <th style="text-align:left">Parameter</th>
      <th style="text-align:left">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left"><code>BASE_64_USER</code>
      </td>
      <td style="text-align:left">Your Base64 encoded username (probably your e-mail)</td>
    </tr>
    <tr>
      <td style="text-align:left"><code>BASE_64_PASSWORD</code>
      </td>
      <td style="text-align:left">Your Base64 encoded remote.it password</td>
    </tr>
    <tr>
      <td style="text-align:left"><code>DEVICE_UID</code>
      </td>
      <td style="text-align:left">The ID (also called address) of the device you want to connect to</td>
    </tr>
    <tr>
      <td style="text-align:left"><code>BIND_PORT</code>
      </td>
      <td style="text-align:left">The port you want to bind the connection to on your local machine (eg
        33000)</td>
    </tr>
    <tr>
      <td style="text-align:left"><code>ENCRYPTION_MODE</code>
      </td>
      <td style="text-align:left">The level of encryption to use. Choices are:</td>
    </tr>
    <tr>
      <td style="text-align:left"></td>
      <td style="text-align:left">
        <ul>
          <li>0 = no encryption</li>
          <li>1 = RC4</li>
          <li>2 = XXTEA</li>
        </ul>
        <p>NOTE: Please use mode 2. Modes 0 and 1 are not secure.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"><code>LOCALHOST_ADDRESS</code>
      </td>
      <td style="text-align:left">The address to bind to on your local network. This is normally 127.0.0.1.</td>
    </tr>
    <tr>
      <td style="text-align:left"><code>MAXOUTSTANDING</code>
      </td>
      <td style="text-align:left">Maximum number of packets outstanding on a connection. Set to 12.</td>
    </tr>
  </tbody>
</table>

{% page-ref page="where-do-i-find-the-uid-for-my-service.md" %}

#### Example: 

```bash
connectd -s -c \
  eW91cm5hbWVAZXhhbXBsZS5jb20= \   # Base64 encoded username/email
  c3VwM3JzZWtyZXQh \               # Base64 encoded password
  80:00:00:00:00:00:00:F1 \        # Device UID on remote.it
  T33000 \                          # Port to bind to, prefixed with "T"
  2 \                              # Encryption mode = XXTEA
  127.0.0.1 \                      # Localhost address
```

#### **Options**

| Option | Description |
| :--- | :--- |
| -c | Run in P2P initiator mode |
| -s  | Display connection status information |

Parameters are the same as used in the previous example.

The above command all on one line is:

```text
connectd -s -c eW91cm5hbWVAZXhhbXBsZS5jb20= c3VwM3JzZWtyZXQh 80:00:00:00:00:00:00:F1 T33000 2 127.0.0.1
```

Once the connection is established, \(approximately ten seconds\) you will see:

```text
...
Starting Proxy on port 33000 on index 1.
Proxy started.
```

Now you can use your P2P connection using 127.0.0.1 on port 33000.   For example, you can type 127.0.0.1:33000 in a browser window for a web application, or start an ssh connection to 127.0.0.1 port 33000 in a new console window.

You can hit CTRL-C at any time to terminate the P2P connection.

#### Option 2: connectd P2P initiator example using a simple script

p2p.sh automates some of the tasks needed to make a repeatable P2P connection to a single service.  Download the p2p.sh script to a convenient location on your system.   

{% file src="../../.gitbook/assets/p2p \(1\).sh" %}

Edit the following values in p2p.sh as needed, then save the file.  

* uid - the UID of the Service you are connecting to
* address - usually 127.0.0.1
* port - any number between 33000 and 65535

{% page-ref page="where-do-i-find-the-uid-for-my-service.md" %}

Download p2p.sh to your computer, then run:

```text
chmod +x p2p.sh
./p2p.sh "username" "password"
```

where username and password are the credentials for your remote.it account.

This script runs connectd in the background so that you can continue to use the command prompt, and after about 10 seconds, shows you the command you can use to kill the connection when you are done.  The value shown in the "kill" command is the process ID \(PID\) of the connectd daemon which was just launched.

```text
Your connection is now active on 127.0.0.1 port 33100.

To terminate this connection, type in:
kill 21152
$
```

#### Option 3: connectd P2P initiator example using a provisioning file

connectd allows the use of a provisioning, or configuration, file to allow better organization of multiple P2P connections.  Here is a sample provisioning file for a P2P initiator.

```text
# setting autoconnect to 1 will autoconnect the p2p initiator to the target
# setting autoconnect to 2 will attempt to automatically reconnect in the event 
# of a network interruption
autoconnect 1

#user ID to use for the initiator connection (required)
user_id username@remote.it

#auth_pass users password to use to make the Initiator P2P connection (not recommended, use auth_hash)
auth_pass weaved1234

#local port to bind TCP proxy socket to, mandatory
proxy_local_port 33300

#proxy local IP to bind to, can be 127.0.0.1, 0.0.0.0 or any local adapter IP
proxy_bind_address 127.0.0.1

#remote_address is the (UID) address of the target to connect to.\
remote_address 80:00:00:00:01:00:0A:C2

#Maximum buffer depth for each TCP connection (10-25) good range raise for high latency enviorments
max_depth 12
# keep this comment line here
```

{% page-ref page="where-do-i-find-the-uid-for-my-service.md" %}

Copy and save this to a file that corresponds to your target Service.  For example, if the UID is for an SSH Service running on your Pi, you could call this file SSH-Pi.txt.

Edit the following entries to match your account and target device.  

* user\_id - your remote.it account user name
* auth\_pass - your remote.it account password
* remote\_address - your target Service's UID
* proxy\_local\_port - desired localhost port

Then run:

```text
connectd -f SSH-Pi.txt &
```

The script will output connection information, then after about 10 seconds, you should see:

```text
Starting Proxy on port 33000 on index 1.
Proxy started.
```

To get the process ID \(PID\) so that you can kill the connection when you are done, type:

```text
echo $!
```

immediately following the connectd command.  

Now you can connect to your target remote.it Service using 127.0.0.1 and the port value you chose.  The P2P connection will stay open until you terminate the process using "kill", or the internet connection drops.

Supposing that the value was 21456, then when you are done with the P2P connection, type

```text
kill 21456
```

### Automatically maintain the P2P connection

You can set the autoconnect parameter value to 2 in the initiator provisioning file to have the daemon automatically attempt to reconnect to the target in the event of a network interruption.

### Having trouble connecting?

Please see our guide on troubleshooting connections:

{% page-ref page="../../troubleshooting-connections.md" %}

