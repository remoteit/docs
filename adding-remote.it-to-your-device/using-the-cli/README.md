---
description: Learn how to use the new remote.it Command Line Interface (CLI).
---

# The remote.it Command Line Interface

## Beta Notice

**This project is currently in "beta" and is not ready for production use yet. If you want to use remote.it on your production Devices, please use an alternate method! Click the following link to see our other options:**

## Get Started

### Download

Please download the latest release [**here.**](https://github.com/remoteit/cli/releases/latest)\*\*\*\*

* For Raspberry PI use `remoteit_linux_armv6`

  * Place it onto your system `PATH` \(usually `/usr/local/bin` or `/usr/bin`\)
  * `sudo cp ./remoteit_linux_armv6 /usr/local/bin/remoteit`

* For Linux use `remoteit_linux_x86_64`

  * Place it onto your system `PATH` \(usually `/usr/local/bin` or `/usr/bin`\)
  * `sudo cp ./remoteit_linux_x86_64 /usr/local/bin/remoteit`

* For Mac use `remoteit_mac-osx_x86_64`

  * Place it onto your system `PATH` \(usually `/usr/local/bin` or `/usr/bin`\)
  * `sudo cp ./remoteit_mac-osx_x86_64 /usr/local/bin/remoteit`

* For Windows use `remoteit_windows_x86_64.exe`
  * Place it onto your system `PATH` \(usually `C:\Windows`\)
  * `copy remoteit_windows_x86_64.exe C:\windows\`

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

