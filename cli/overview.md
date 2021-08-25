# Overview and Installation

The Command Line Interface \(CLI\) is a unified tool that provides a consistent interface for interacting with remote.it on a given device. CLI commands are covered in the next page including descriptions, syntax, and usage examples.

The remote.it Command Line Interface \(CLI\) is installed as part of the Desktop Application as well as the remote.it packages for various Linux distributions. This set of instructions is to install the CLI as a stand alone where the desktop application is not needed. 

{% hint style="info" %}
The remote.it CLI has slightly different behavior if you are running as a root user versus a non-root user. In general, you will want to always run as a root user.

* On Windows, you will need to open a "Command Prompt" as an Administrator and replace any example you see as `sudo remoteit` by `remoteit.exe`
* On Mac and Linux, you must run any commands related to creating/managing a Device or Services as a root user \(e.g. `sudo`\)
{% endhint %}

## Available Packages

| Platform | Architecture/Distribution | URL |
| :--- | :--- | :--- |
| Windows | x86 | [https://downloads.remote.it/cli/latest/remoteit\_windows\_x86.exe](https://downloads.remote.it/cli/latest/remoteit_windows_x86.exe) |
| Windows | x86\_64 | [https://downloads.remote.it/cli/latest/remoteit\_windows\_x86\_64.exe](https://downloads.remote.it/cli/latest/remoteit_windows_x86_64.exe) |
| MacOS | x86\_64 | [https://downloads.remote.it/cli/latest/remoteit\_mac-osx\_x86\_64](https://downloads.remote.it/cli/latest/remoteit_mac-osx_x86_64) |
| Debian | ARMv5 | [https://downloads.remote.it/cli/latest/remoteit\_linux\_armv5](https://downloads.remote.it/cli/latest/remoteit_linux_armv5) |
| Debian | ARMv6 | [https://downloads.remote.it/cli/latest/remoteit\_linux\_armv6](https://downloads.remote.it/cli/latest/remoteit_linux_armv6) |
| Debian | ARMv7 | [https://downloads.remote.it/cli/latest/remoteit\_linux\_armv7](https://downloads.remote.it/cli/latest/remoteit_linux_armv7) |
| Debian | ARM64 | [https://downloads.remote.it/cli/latest/remoteit\_linux\_arm64](https://downloads.remote.it/cli/latest/remoteit_linux_arm64) |
| Debian | x86\_64 | [https://downloads.remote.it/cli/latest/remoteit\_linux\_x86\_64](https://downloads.remote.it/cli/latest/remoteit_linux_x86_64) |

## Installation

Download the binary for the platform and Architecture/Distribution to the device. 

{% tabs %}
{% tab title="Debian" %}
Place the file in /usr/bin and rename to "remoteit"

You will need to change permissions on the file to make it executable by opening Terminal

```text
chmod +x /usr/bin/remoteit
```

After placing the binary and making it executable, you will need to install the agent using the following command

```text
sudo remoteit agent install
```

At this point you can start using CLI. See [Usage](usage.md)
{% endtab %}

{% tab title="MacOS" %}
Place the file in /usr/local/bin and rename to "remoteit"

You will need to change permissions on the file to make it executable by opening Terminal

```text
chmod +x /usr/local/bin/remoteit
```

After placing the binary and making it executable, you will need to install the agent using the following command

```text
sudo remoteit agent install
```

At this point you can start using CLI see [Usage](usage.md)
{% endtab %}

{% tab title="Windows" %}
Place the file in your drive which has "Program Files" typically your c drive and rename to "remoteit.exe"

You will need to update your PATH environmental variables to add the full path to the exe.

You will need to install the agent using the following command as admin in command line

```text
remoteit agent install
```

At this point you can start using CLI see [Usage](usage.md)
{% endtab %}
{% endtabs %}



