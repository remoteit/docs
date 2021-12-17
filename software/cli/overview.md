# Installation

{% hint style="info" %}
The remote.it CLI has slightly different behavior if you are running as a root user versus a non-root user. In general, you will want to always run as a root user.

* On Windows, you will need to open a "Command Prompt" as an Administrator and replace any example you see as `sudo remoteit` by `remoteit.exe`
* On Mac and Linux, you must run any commands related to creating/managing a Device or Services as a root user (e.g. `sudo`)
{% endhint %}

## Installation

Download the binary for the platform and Architecture/Distribution to the device.&#x20;

{% tabs %}
{% tab title="Debian" %}
Place the file in /usr/bin and rename to "remoteit"

You will need to change permissions on the file to make it executable by opening Terminal

```
chmod +x /usr/bin/remoteit
```

After placing the binary and making it executable, you will need to install the agent using the following command

```
sudo remoteit agent install
```

At this point you can start using CLI. See [Usage](../../developer-tools/cli-usage.md)
{% endtab %}

{% tab title="MacOS" %}
Place the file in /usr/local/bin and rename to "remoteit"

You will need to change permissions on the file to make it executable by opening Terminal

```
chmod +x /usr/local/bin/remoteit
```

After placing the binary and making it executable, you will need to install the agent using the following command

```
sudo remoteit agent install
```

At this point you can start using CLI see [Usage](../../developer-tools/cli-usage.md)
{% endtab %}

{% tab title="Windows" %}
Place the file in your drive which has "Program Files" typically your c drive and rename to "remoteit.exe"

You will need to update your PATH environmental variables to add the full path to the exe.

You will need to install the agent using the following command as admin in command line

```
remoteit agent install
```

At this point you can start using CLI see [Usage](broken-reference)
{% endtab %}
{% endtabs %}

