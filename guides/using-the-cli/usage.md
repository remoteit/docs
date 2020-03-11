---
description: Learn more about using the remote.it CLI.
---

# Usage

The below commands are documented specifically for Linux/Mac. If you're running on Windows, the commands are the same, but you will just need to remove the `sudo` from the front of the commands and open a "Command Prompt" as Administrator \(right click to see this option\).

Most commands need to be run as a "root" \(or admin\) user.

## **Get help**

To learn more about a command, run `remoteit help`:

```text
sudo remoteit help add
# or
sudo remoteit add -h
```

## Global flags

* `--json / -j` - to output any command in JSON format
* `--verbose / -v` - to output more insight, helpful when you come across issues

## General usage

### Signing out

```text
sudo remoteit signout
```

_Note that you do not need to be signed into remote.it after you initially setup your Device, so it is safe to signout. You will need to sign back in if you need to add/remove Services or perform other actions that require signin._

### Learn about remote.it CLI configuration

To learn exactly where remote.it is putting its configuration, binaries, logs and other general system information, you can run the `info` command to get a detailed output of this information:

```text
sudo remoteit info
```

### Manage remote.it system service

Setting up a remote.it Device configures a system Service that runs our software on boot \(or login if running as a non-root user\). This Service can be managed using the `service` command:

```text
sudo remoteit system -h
sudo remoteit system status
sudo remoteit system uninstall
```

### Scan your network

```text
sudo remoteit scan

# Output results in JSON
sudo remoteit scan --json # or just -j
```

### Manage remote.it tools

remote.it requires some other tools to be installed, including our tools `connectd`, `muxer`, and `demuxer`. These get installed automatically for you when you signin or setup a new Device. However, there may be cases where you want to manage them yourself.

```text
# See all options
sudo remoteit tools

# Install tools if missing
sudo remoteit tools install

# Update all tools
sudo remoteit tools install --update # or just -u
```

### Specify a different configuration path

{% hint style="warning" %}
**Note:** Unless you have a good reason to do this, you probably should not use this command flag.
{% endhint %}

If for some reason you need to use a different path for configuration the defaults, you can pass a `--config`/`-c` flag when running a command to use a different path.

```text
sudo remoteit signin --config path/to/my/config.json
```

Note that you will have to pass in this path for every command in which you want to use this config file otherwise commands default to using the default config location. You can define the environment variable `REMOTEIT_CONFIG_PATH="..."` to set the default config path to use for all commands.

### Uninstall remote.it

If you need to remove your remote.it Device, you can run `remoteit uninstall`. This will remove everything from you system related to remote.it including all your configuration. Note that this does not remove your Device or Services from remote.it directly, but you can do this in the web portal.

{% hint style="danger" %}
**Be careful with this command as it is permanent.**
{% endhint %}

If you uninstall remote.it, you will have to re-configure your Device if you want to add remote.it back to your system.

This uninstalls everything but the `remoteit` CLI binary.

