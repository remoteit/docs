---
description: >-
  This describes the use of the connectd daemon as a P2P initiator, also known
  as client mode
---

# Using connectd

## **Download connectd**

The below example shows you how to download and run connectd on your machine. The example is for Mac OSX, but we have [many other versions available](https://github.com/remoteit/misc_bins_and_scripts/tree/master/connectd).

```bash
# Download the most recent release (this is for OSX)
wget https://github.com/remoteit/misc_bins_and_scripts/raw/master/connectd/connectd.x86_64-osx

# Make it executable
chmod u+x connectd.x86_64-osx

# Move to somehwere on your PATH
mv connectd.x86_64-osx /usr/local/bin/connectd
```

## Running connectd with username & password

```bash
connectd -c \
  BASE_64_USER \
  BASE_64_PASSWORD \
  DEVICE_UID \
  BIND_PORT \
  ENCRYPTION_MODE \
  LOCAL_HOST_ADDRESS \
  MAX_OUTSTANDING
```

#### Options

<table>
  <thead>
    <tr>
      <th style="text-align:left">Option</th>
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
      <td style="text-align:left">The port you want to bind the connection to on your local machine (eg
        3000)</td>
    </tr>
    <tr>
      <td style="text-align:left"><code>ENCRYPTION_MODE</code>
      </td>
      <td style="text-align:left">
        <p>The level of encryption to use. Choices are: <code>1</code> or <code>2</code>
        </p>
        <p>NOTE: Take <code>2</code> unless you have any reason.</p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left"><code>LOCALHOST_ADDRESS</code>
      </td>
      <td style="text-align:left">The address to bind to on your local network. This is normally either
        127.0.0.1.</td>
    </tr>
    <tr>
      <td style="text-align:left"><code>MAX_OUTSTANDING</code>
      </td>
      <td style="text-align:left"></td>
    </tr>
  </tbody>
</table>#### Example:

```bash
connectd -s -c \
  eW91cm5hbWVAZXhhbXBsZS5jb20= \   # Base64 encoded username/email
  c3VwM3JzZWtyZXQh \               # Base64 encoded password
  80:00:00:00:00:00:00:F1 \        # Device ID on remote.it
  T3000 \                          # Port to bind to, prefixed with "T"
  1 \                              # Encryption mode (1 or 2)
  127.0.0.1 \                      # Localhost address
  12                               # Max outstanding
```

#### **Options**

* `-d` run in daemon mode, meaning keep the connection running in the background
* `-s` print out status information

To run merge the command into one line:

```text
connectd -c bXluYW1lQGdtYWlsLmNvbQ== cGFzc3dvcmQ= 80:00:00:05:46:03:B0:1D 2 127.0.0.1 10
```

It it worked you will see output confirming:

```text
...
Starting Proxy on port 33000 on index 1.
Proxy started.
```

## Running connectd with service\_authhash

Most of the parameters are the same as with a username and password except for the service\_authhash and ip restriction settings indicated below:

```bash
connectd -p 
    eW91cm5hbWVAZXhhbXBsZS5jb20= \
    16509BA77F1AF0FBAA7BBB3B2B992ED90308CAB9 \  # service_authhash
    80:00:00:00:00:00:00:F1 \
    T3000 \
    1 \
    127.0.0.1 \
    0.0.0.0 \        # 0.0.0.0 allows all or enter and IP to restrict to
    10
```

To get an service\_authhash from remote.it you need to use the login API



## connectd exit codes

If running connectd with the `-s` flag and connectd exits for any reason, it will emit a message on stdout in the format: `!!exit [CODE] : MESSAGE` where the code is a numerical code \(see below\) and a message describing what happened.

| Code | Message |
| :--- | :--- |
| 001 | process lifetime expired |
| 002 | shutdown packet received |
| 003 | termination from windows signal |
| 003 | \(all platforms except windows\) |
| 004 | Disabled By User Configuration |
| 010 | bad user specified \(probably not possible at this time\) |
| 011 | authentication error \(may be multiple because of retry\) |
| 012 | auto connect failed \(Initiator p2p connect failed\) |
| 013 | Initiate session create failed \(initiator p2p connect failed !autoconnect\) |
| 014 | Connection To remot3.it Service has Timed Out |
| 015 | cannot get UID from service \(not a initiator side error\) |
| 016 | Cannot Bind UDP Port \(UDP P2P port\) |
| 017 | Cannot Bind Proxy Port \(initiator port\) |
| 020 | connection to peer closed or timed out |
| 021 | connection to peer failed \(failed p2p connect\) |
| 025 | unknown reason \(this should not happen\) |
| 030 | user console exit |

{% page-ref page="../api-reference/authentication.md" %}

### Having trouble connecting?

Please see our guide on troubleshooting connections:

