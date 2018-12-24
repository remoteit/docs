# Troubleshooting connections

## `ssh_exchange_identification: Connection closed by remote host`

### Problem

If you are attempting to SSH into a device and you get the error message:

```bash
ssh_exchange_identification: Connection closed by remote host
```

Try running SSH with the `-v` flag:

```bash
ssh pi@proxy2.remot3.it -p 36294 -v
```

You may see something similar to the follow \(this is out from Mac OSX\):

```bash
OpenSSH_7.8p1, LibreSSL 2.7.3 
debug1: Reading configuration data /Users/username/.ssh/config 
debug1: /Users/username/.ssh/config line 1: Applying options for  
debug1: Reading configuration data /etc/ssh/ssh_config 
debug1: /etc/ssh/ssh_config line 48: Applying options for  
debug1: Connecting to proxy2.remot3.it port 36294. 
debug1: Connection established. 
debug1: identity file /Users/username/.ssh/id_rsa type 0 
debug1: identity file /Users/username/.ssh/id_rsa-cert type -1 
debug1: Local version string SSH-2.0-OpenSSH_7.8 
ssh_exchange_identification: Connection closed by remote host
```

### Solution

