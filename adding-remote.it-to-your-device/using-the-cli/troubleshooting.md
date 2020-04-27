---
description: Learn how to troubleshoot issues with the remote.it CLI.
---

# Troubleshooting

{% hint style="info" %}
**Note:** The remote.it CLI is a complex piece of software and works on a wide array of operating systems which means that there are a lot of variables that could potentially cause issues. In order to troubleshoot these issues, please review the following information.
{% endhint %}

## Request Support

```text
sudo remoteit support
```

This will send a remote.it support request with a dump of your system information so our support team can help you troubleshoot your issues.

You can also email us at [support@remote.it](mailto:support@remote.it).

## General Troubleshooting

```text
# Get information about the current system:
sudo remoteit info

# Get current process status
sudo remoteit status

# Get the status of the system service
sudo remoteit system status
```

### Windows

First shut down the system Service:

```text
remoteit.exe system stop
```

Then, remove any errant processes that may not have been cleaned up properly:

```text
taskkill /IM "remoteit.exe" /F
taskkill /IM "connectd.exe" /F
taskkill /IM "demuxer.exe" /F
```

Then restart the Service and check its status:

```text
remoteit.exe system start
remoteit.exe status
```

### Mac/Linux

Start by making sure the system Service is shut down:

```text
sudo remoteit system stop
```

Kill any errant processes:

```text
killall -9 remoteit
killall -9 connectd
killall -9 demuxer
```

Then try to start the Service again and check:

```text
sudo remoteit system start
sudo remoteit status
```

### Linux

View SystemD Service logs:

```text
journalctl -f -u it.remote.cli.service
```

