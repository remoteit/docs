---
description: Use remote.it on 32 or 64-bit Centos 6 and 7
---

# Centos

If you are using the interactive installer program, you may notice that all Applications are shown as "not detected" in the main menu after installing remote.it Services.

```text
=========================  Installed remote.it Services  ======================
 Service Name       | Protocol | LAN Address        | Port | Application
-------------------------------------------------------------------------------
 CEntos-SSH         | SSH      | localhost          | 22   | not detected
 web-8080-centos    | HTTP     | localhost          | 8080 | not detected
-------------------------------------------------------------------------------
```

The Linux utilities **netstat** and **nc** \(which are used for detecting applications\) may not be installed by default.  Please note that this has no effect on configuring remote.it Services.  It means the script can't accurately tell whether the applications are responding.

Optional: To install these utilities, run \(as root or using sudo\):

```text
yum update
yum install nc
yum install net-tools
```

{% page-ref page="32-bit-centos-7.md" %}

{% page-ref page="64-bit-centos-7.md" %}



