---
description: >-
  This describes the use of the connectd daemon as a P2P initiator in Windows. 
  P2P initiator mode is also known as client mode.  This example uses
  PowerShell.
---

# Using connectd in P2P initiator mode on Windows

## **Download the connectd daemon**

The connectd daemon is used on your **target** device to create remote.it Services.  The same daemon is used on the **initiator** side of a P2P connection, although in a different mode.  The rest of this guide describes configuration of connectd on the initiator side.

The example below shows you how to download and run connectd.exe on your Windows machine.  Open a command prompt, create a directory to keep P2P related files in, and cd to that directory; we will use a directory called P2P.  Next, enter the commands as shown below.  We are going to be using PowerShell for all commands in this example.

### Start PowerShell

```bash
C:\Users\test\Downloads\remot3.it\P2P>powershell
Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.
```

### Download connectd.exe

Copy and paste the line below, starting with wget, to your PowerShell console.  Press the Enter key to download the connectd.exe file.

```text
PS > wget https://github.com/remoteit/misc_bins_and_scripts/raw/master/connectd/connectd.exe -O connectd.exe
PS >
```

### Run the connectd network test 

To confirm that you have the correct connectd daemon, and that your network is configured correctly, run _.\connectd.exe -n_ at the command line. You may have to configure any virus checker that you are using in order to allow connectd.exe to be run.  The output should be similar to the following:

```text
PS C:\Users\test\Downloads\remot3.it\P2P> .\connectd.exe -n
Connectd built Apr 20 2019 at 16:38:16 Now Starting Up
   Version 4.6 - (c)2019 remot3.it, Inc. All Rights Reserved
   Built with NATPMP BCASTER MALLOC_POOL RESOLVE BIGBUF pool=524288
   WIN32 Version
alloc pool


Running Network Diagnostics
---------------------------------
Checking if DNS works ... .[OK]
Checking TCP connectivity to remote.it...<oip=192.168.1.160> [OK]
Checking UDP connectivity to remote.it...
Send to 69.64.90.20:5959 [] [mip=73.103.207.56] [oport=59612 mport=59612] [preserve port]
Send to 69.64.90.20:5960 [] [mip=73.103.207.56] [oport=59612 mport=59612] [no remap] [preserve port]
Send to 69.64.90.128:5961 [] [mip=73.103.207.56] [oport=59612 mport=59612] [no remap] [preserve port different IP] [OK]
Checking if NAT-PMP Router is found...[Pub IP 73.103.207.56][epoch 4892265][FOUND]

This router preserves ports, this is optimal.
This router doesn't remap new connections to new ports.
UPNP is enabled on this router, this is optimal.
Static Pool Free
Endian : Little
SHA1 test:
  passed.
RC4 test:
  passed
XXTEA test:
  passed.
Looks compatible.
PS C:\Users\test\Downloads\remot3.it\P2P>
```

### Different ways to use connectd as a P2P initiator

Next, we show 3 ways you might use the connectd daemon as a P2P initiator.

1. Using explicit command line parameters in foreground mode
2. Using explicit command line parameters in background mode
3. Using a provisioning file in background mode.

#### Background vs. foreground mode

If you are using the P2P connection for an application that does not require the use of the command line \(e.g. a web browser\), then you may run connectd in the foreground \(also called interactive mode\).  When you are done, you can simply type CTRL-C to terminate the connectd daemon.  Foreground mode is demonstrated in option 1 below.

Foreground mode is useful for debugging if you have any problems initiating a P2P connection as it will show you connection status.

The examples supplied for options 2 and 3 use the PowerShell "Start-Process" command to force the connectd daemon to run in the background.  This allows you to continue to use the same command prompt for an SSH connection, for example.  

If you are developing your own apps including P2P mode, you'll need to keep track of the process ID \(pid\) so that you can kill the connectd daemon when you are done using the P2P connection.  Examples 2 and 3 show one way this can be done.

#### Option 1: connectd P2P example using command line parameters

```bash
connectd.exe -c \
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
| -c | run daemon in P2P initiator mode |

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
      <td style="text-align:left">Your Base64 encoded username (probably your email)</td>
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
      <td style="text-align:left">The port you want to bind the connection to on your local machine (e.g.
        33000)</td>
    </tr>
    <tr>
      <td style="text-align:left"><code>ENCRYPTION_MODE</code>
      </td>
      <td style="text-align:left">
        <p>The level of encryption to use. Choices are:</p>
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
      <td style="text-align:left">Local address to use for this connection, usually 127.0.0.1.</td>
    </tr>
    <tr>
      <td style="text-align:left"><code>MAXOUTSTANDING</code>
      </td>
      <td style="text-align:left">Maximum number of packets allowed outstanding on a connection. Set to
        12.</td>
    </tr>
  </tbody>
</table>{% page-ref page="where-do-i-find-the-uid-for-my-service.md" %}

#### Example: 

```bash
.\connectd.exe -s -c \
  eW91cm5hbWVAZXhhbXBsZS5jb20= \   # Base64 encoded username/email: yourname@example.com
  c3VwM3JzZWtyZXQh \               # Base64 encoded password: sup3rsekret!
  80:00:00:00:00:00:00:F1 \        # Device UID on remote.it
  T33000 \                         # Port to bind to, prefixed with "T"
  2 \                              # Encryption mode (2 = XXTEA)
  127.0.0.1 \                      # Localhost address
  12                               # Maximum number of outstanding packets
```

#### **Options**

| Option | Description |
| :--- | :--- |
| `-c` | run daemon in P2P initiator mode |
| `-s` | display additional status information |

The above command all on one line is:

```text
.\connectd.exe -s -c eW91cm5hbWVAZXhhbXBsZS5jb20= c3VwM3JzZWtyZXQh 80:00:00:00:00:00:00:F1 T33000 2 127.0.0.1 12
```

Once the connection is established, \(ten seconds or less\) you should see the following:

```text
...
Starting Proxy on port 33000 on index 1.
Proxy started.
```

Now you can use your established and running P2P connection using 127.0.0.1 on port 33000.  For example, you can type 127.0.0.1:33000 in a browser window for a web application, or start an ssh connection to 127.0.0.1 port 33000 in a new console window. You can hit CTRL-C at any time in the console window that you used to start the connection above in order to terminate the P2P connection.

#### Option 2: connectd P2P initiator example using a simple script

Script p2p.ps1 automates some of the tasks needed to make a repeatable P2P connection to a single Service.  Download the p2p.zip file, then extract the p2p.ps1 script to the same folder where you downloaded connectd.exe on your system.   

{% file src="../../.gitbook/assets/p2p.zip" %}

Edit the following values in the p2p.ps1 script as needed, then save the file with your changes: 

* uid : the UID of the Service that you wish to connect to.
* address : any localhost address, usually 127.0.0.1
* port : any number between 33000 and 65535

{% page-ref page="where-do-i-find-the-uid-for-my-service.md" %}

Now run the p2p.ps1 script using the following command \(you may have to give permission for the script to run\):

```text
.\p2p.ps1 "username" "password"
```

where username and password are the credentials for your remote.it account.

Sample output from running the p2p.ps1 script is shown below.

```text
PS C:\Users\test\Downloads\remot3.it\P2P> .\p2p.ps1 username@email.com password
Connectd built Apr 20 2019 at 16:38:16 Now Starting Up
   Version 4.6 - (c)2019 remot3.it, Inc. All Rights Reserved
   Built with NATPMP BCASTER MALLOC_POOL RESOLVE BIGBUF pool=524288
   WIN32 Version
proxy local port is TCP = 33001
setting web config port to dest_server_port 80
primary local ip = 192.168.1.160
alloc pool
  Using server  on port 5959
  Using device uid = 00:00:00:00:00:00:00:00
  Using Server Channel Port 5980
  User faultline1989@yahoo.com connecting to 80:00:00:75:3a:00:34:fb
primary local ip = 192.168.1.160
local IP address found 192.168.1.160
initialize proxy client target 127.0.0.1 port 80
generate our own UID= f2:62:56:82:52:1b:08:1a
NAT PMP router found
Used NATPMP to map port 51670
Command Processor now active.
35733> req auth remote.it id username@email.com

35733> Status redirect to  209.235.201.48:5968

35733> req auth remote.it id username@email.com

Starting Proxy on port 33001 on index 1.
Proxy started.
...
Created a P2P connection to 80:00:00:75:3A:00:34:FB on 127.0.0.1 port 33001.
To terminate this connection, enter:
Stop-Process 6044
PS C:\Users\test\Downloads\remot3.it\P2P>
```

The p2p.ps1 script runs connectd.exe in the background so that you can continue to use the command prompt in the console window, and after about 10 seconds, shows you the PowerShell command that you can use to stop the connectd.exe process, and thus stop the connection when you are done.  The value shown in the "Stop-Process" command is the process ID \(PID\) of the connectd daemon that was just launched.

```text
Created a P2P connection to 80:00:00:75:3A:00:34:FB on 127.0.0.1 port 33001.
To terminate this connection, enter:
Stop-Process 6044
PS C:\Users\test\Downloads\remot3.it\P2P>
```

#### Option 3: connectd P2P initiator example using a provisioning file

The daemon connectd.exe allows the use of a provisioning, or configuration, file to allow better organization of multiple P2P connections.  Here is a sample provisioning file for a P2P initiator.

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

Copy and save the above sample provisioning file to a file that corresponds to your target Service.  For example, if the UID is for an ssh Service running on a Raspberry Pi, you could call this file SSH-Pi.txt, so you can remember which files correspond to which services.

Edit the following entries in the sample provisioning file to match your account and target device.  

* user\_id : your remote.it account user name
* auth\_pass : your remote.it account password
* remote\_address : your target Service's UID
* proxy\_local\_port : desired localhost port

Download p2p-file.ps1 to the same folder where you saved connectd.exe and SSH-Pi.txt.  p2p-file.ps1 is similar to p2p.ps1 except p2p-file.ps1 uses a provisioning file rather than placing all connection and account information on the connectd.exe command line.

{% file src="../../.gitbook/assets/p2p-file.ps1" %}

Then run:

```text
.\p2p-file.ps1 SSH-Pi.txt
```

The script will output connection information, then after about 10 seconds, you should see the following output:

```text
Starting Proxy on port 33301 on index 1.
Proxy started.
...
Created a P2P connection...
To terminate this connection, enter:
Stop-Process 11376
PS C:\Users\test\Downloads\remot3.it\P2P>
```

Note the process ID \(PID\) for connectd.exe is displayed \(here it is 11376\).  To kill the connectd process when you are done with the connection, run the following command:

```text
Stop-Process 11376
```

### Automatically maintain the P2P connection

You can set the autoconnect parameter value to 2 in the initiator provisioning file to have the daemon automatically attempt to reconnect to the target in the event of a network interruption.

### Having trouble connecting?

Please see our guide on troubleshooting connections:

{% page-ref page="../../troubleshooting-connections.md" %}

