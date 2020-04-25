# Making connections in Windows

## SSH Connections

* The SSH username is a user-configurable login name that will be included in the connection login string.  This setting only appears on SSH connections.  

![](../../../.gitbook/assets/image%20%28310%29.png)

* When you select the clipboard icon, the SSH string, including the supplied SSH Username, is copied to the clipboard.  You can then paste it into a terminal or command prompt to initiate an SSH connection.

![](../../../.gitbook/assets/image%20%28361%29.png)

* This is the "SSH string":

```text
ssh -l pi 127.0.0.1 -p 33002 -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile /dev/null"
```

* Pasting that into a Windows 10 command prompt gives:

```text
C:\Users\me>ssh -l pi 127.0.0.1 -p 33002 -o "StrictHostKeyChecking=no" -o "UserKnownHostsFile /dev/null"
Warning: Permanently added '[127.0.0.1]:33002' (ECDSA) to the list of known hosts.
pi@127.0.0.1's password:
Linux raspberrypi 4.19.97-v7l+ #1294 SMP Thu Jan 30 13:21:14 GMT 2020 armv7l

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
Linux raspberrypi 4.19.97-v7l+ #1294 SMP Thu Jan 30 13:21:14 GMT 2020 armv7l

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Tue Mar 24 07:31:50 2020
pi@raspberrypi:~ $
```

You can use the SSH string in Linux and Mac terminal as well.

## VNC Connections

* When you select the clipboard icon, the VNC string is copied to the clipboard.  You can then paste it into your VNC application.

![](../../../.gitbook/assets/image%20%28170%29.png)

* This is the VNC string:

```text
127.0.0.1:33003
```

* This can be copied and pasted into the address bar of the RealVNC Viewer application.

![](../../../.gitbook/assets/image%20%2839%29.png)

* Provide the username and password to complete the VNC connection.

![](../../../.gitbook/assets/image%20%2824%29.png)

![](../../../.gitbook/assets/image%20%28320%29.png)

## Web connections

Select the arrow to launch the connection URL directly in your default browser.

![](../../../.gitbook/assets/image%20%28424%29.png)

![](../../../.gitbook/assets/image%20%2897%29.png)

