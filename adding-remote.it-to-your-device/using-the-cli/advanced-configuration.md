---
description: Learn how to use advanced configuration with the remote.it CLI.
---

# Advanced Configuration

{% hint style="danger" %}
**Note:** Advanced configuration should not be necessary for most installations/setups. If you think you need to use advanced configuration, please contact support at [support@remote.it](mailto:support@remote.it) first.
{% endhint %}

## Environment variables

{% hint style="warning" %}
**Note:** These are for advanced users. You should not use these unless you have a specific reason to.
{% endhint %}

You can set the following environment variables to control the remote.it CLI's behavior:

* `REMOTEIT_CONFIG_PATH="/path/to/config.json"` path to the config file. Note that you can also set this using the `-c, --config` flag on the CLI to do this.
* `REMOTEIT_HWID="some-hardware-id"` the Hardware ID to use to identify this Device.
* `REMOTEIT_VERBOSE=true` to turn on verbose mode. Note you can also use the `-v, --verbose` flag on the CLI to do this.
* `REMOTEIT_DIR="/path/to/remoteit"` to configure where remote.it related files exist. This is used as a root for things like logs and binaries on some systems, primarily Windows.
* `REMOTEIT_LOG_DIR="/path/to/logs"` to configure where logs should be written to.
* `REMOTEIT_BINARY_DIR="/path/to/binaries"` to configure where remote.it related binaries exist.
* `REMOTEIT_CONNECTD_PATH="/path/to/connectd"` to configure where the connectd binary exists.
* `REMOTEIT_MUXER_PATH="/path/to/muxer"` to configure where the muxer binary exists.
* `REMOTEIT_DEMUXER_PATH="/path/to/demuxer"` to configure where the demuxer binary exists.
* `REMOTEIT_SCHANNEL_PORT=5980` to configure what port SChannel should listen on.

Additionally, you can set these on

* Raspberry Pi/Linux/Mac/Unix using `export VARIABLE="VALUE"`
* Windows using `set VARIABLE="VALUE"`

