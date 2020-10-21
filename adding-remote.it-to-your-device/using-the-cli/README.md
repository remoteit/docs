---
description: Learn how to use the new remote.it Command Line Interface (CLI).
---

# The remote.it Command Line Interface

### Installation

The remoteit Command Line Interface \(CLI\) is installed as part of the remoteit package and Desktop applications.

{% page-ref page="../the-remoteit-package-for-raspbian.md" %}

{% page-ref page="../desktop-help.md" %}

## Setup

Using the remote.it CLI is consistent across platforms but please note:

* On Windows, you will need to open a "Command Prompt" as an Administrator and replace any example you see from `sudo remoteit` to `remoteit.exe` 
* On Mac and Linux, you will need to run any commands related to creating/managing a Device or Services as a root user \(e.g. `sudo`\) so that we can install and manage system Services to keep your Device running. 
* Note that the remote.it CLI has slightly different behavior if you are running as a root user versus a non-root user. In general, you will want to always run as a root user unless you have a specific reason not to.

### Quick start

Getting a new Device setup in your remote.it account using our CLI is accomplished in a few easy steps:

```text
# First, install the CLI

sudo remoteit agent install
sudo remoteit tools install

# Then signin

sudo remoteit signin --user <remote.it username> --pass <account password>

# Next, register your Device

sudo remoteit register --name <name of your device>

# Finally, add a Service (As many as needed)

sudo remoteit add --name <service name> --port <port> --type <connection type> 
```

