---
description: Learn how to use the new remote.it Command Line Interface (CLI).
---

# The remote.it Command Line Interface

### Installation

The remoteit Command Line Interface \(CLI\) is installed as part of the remoteit package and Desktop applications.

{% page-ref page="../the-remoteit-package-for-raspbian.md" %}

{% page-ref page="../the-remote.it-desktop-app-for-windows-and-macos..md" %}

## Setup

Using the remote.it CLI is consistent across platforms but please note:

* On Windows, you will need to open a "Command Prompt" as an Administrator and replace any example you see from `sudo remoteit` to `remoteit.exe` 
* On Mac and Linux, you will need to run any commands related to creating/managing a Device or Services as a root user \(e.g. `sudo`\) so that we can install and manage system Services to keep your Device running. 
* Note that the remote.it CLI has slightly different behavior if you are running as a root user versus a non-root user. In general, you will want to always run as a root user unless you have a specific reason not to.

### Quick start

Getting a new Device setup in your remote.it account using our CLI is easy as 1-2-3:

```text
sudo remoteit signin # First - signin into your account
sudo remoteit setup # Then - setup a Device
sudo remoteit add # Finally - add services (as many as needed)
```

