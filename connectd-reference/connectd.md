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

| Option | Description |
| :--- | :--- |
| `BASE_64_USER` | Your Base64 encoded username \(probably your email\) |
| `BASE_64_PASSWORD` | Your Base64 encoded remote.it password |
| `DEVICE_UID` | The ID \(also called address\) of the device you want to connect to |
| `BIND_PORT` | The port you want to bind the connection to on your local machine \(eg 3000\) |
| `ENCRYPTION_MODE` | The level of encryption to use. Choices are: `1` or `2` |
| `LOCALHOST_ADDRESS` | The address to bind to on your local network. This is normally either 127.0.0.1. |
| `MAX_OUTSTANDING` |  |

#### Example: 

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

{% page-ref page="../api-reference/authentication.md" %}

### Having trouble connecting?

Please see our guide on troubleshooting connections:

{% page-ref page="../guides/connecting-to-a-device/troubleshooting-connections.md" %}

