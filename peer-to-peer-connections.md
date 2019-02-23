# Peer to Peer Connections

## Command Line

Make sure you have the correct version of connectd for your platform.

&lt;link&gt;

Example username and password. For production uses it's best to use an authHash from our API \_ &lt;link&gt;:

```bash
connectd -c \
    bXluYW1lQGdtYWlsLmNvbQ==  # myname@gmail.com
    cGFzc3dvcmQ=              # password
    80:00:00:05:46:03:B0:1D   # Device Service Address
    T33000                    # Port TCP 33000
    2                         # Encryption Mode
    127.0.0.1                 # Address to bind to on local system
    10                        # Max unacknowledged packets
```

To run merge the command into one line:

```text
connectd -c bXluYW1lQGdtYWlsLmNvbQ== cGFzc3dvcmQ= 80:00:00:05:46:03:B0:1D 2 127.0.0.1 10 
```

Then you will see the connection established output confirming

```text
...
Starting Proxy on port 33000 on index 1.
Proxy started.
```

