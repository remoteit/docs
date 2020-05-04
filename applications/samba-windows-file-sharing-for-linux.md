# Samba Windows file sharing for Linux

The Samba package allows Linux PCs to access the file system of Windows PCs over a LAN.  See [https://www.samba.org/](https://www.samba.org/) for many more details.  Below, we demonstrate a configuration which uses a remote.it Samba Service on a Raspberry Pi configured for a LAN application \(pointed at the Samba server\) running on a Buffalo NAS device.  We use the remote.it Service installed on the Pi to access the Samba server on the NAS, where we don't have shell access and can't install remote.it directly.

First, [install connectd on your Raspberry Pi.](https://docs.remote.it/platforms/quick-start-on-raspberry-pi/install-remote.it)  Use the [interactive installer](../adding-remote.it-to-your-device/using-the-interactive-installer/) to [add a remote.it Service to a LAN application](../adding-remote.it-to-your-device/using-the-interactive-installer/add-a-service-to-a-lan-application/) pointing at the NAS \(192.168.1.254\) and configure it to use Samba on default port 445.

![](../.gitbook/assets/image%20%2874%29.png)

![](../.gitbook/assets/image%20%28326%29.png)

![](../.gitbook/assets/image%20%2836%29.png)

After giving the remote.it Service a name, you should see that the server at the IP address you gave is responding with "OK" in the "Application" column of this new remote.it Service.

![](../.gitbook/assets/image%20%28449%29.png)

Now, return to the remote.it web portal and connect by clicking on the remote.it Service name:

![](../.gitbook/assets/image%20%28371%29.png)

This returns the proxy server's URL and port in a generic dialog:

![](../.gitbook/assets/image%20%28110%29.png)

We will demonstrate the Samba [**smbclient** ](https://www.samba.org/samba/docs/current/man-html/smbclient.1.html)command using this proxy address and port.  

* &lt;port&gt; - port value from the TCP connection dialog
* &lt;hostname&gt; - hostname from the TCP connection dialog
* &lt;folder&gt; - the NAS folder we are accessing  
* &lt;password&gt; - password on the Pi running the smbclient command

```text
smbclient -p <port> \\\\<hostname>\\<folder> <password>
```

```text
pi@raspberrypi-90:~ $ smbclient -p 32642 \\\\proxy13.remot3.it\\share raspberry 
WARNING: The "syslog" option is deprecated
Domain=[HOME-NET] OS=[Unix] Server=[Samba 3.0.21c]
smb: \> ls
  .                                   D        0  Tue Jul 11 14:30:22 2017
  ..                                  D        0  Sun Apr 22 19:24:52 2007
  pictures                            D        0  Sat Aug 17 13:03:48 2019
  Office Backups                      D        0  Sat Aug 22 19:20:50 2015
  trashbox                            D        0  Mon Jul  8 07:31:54 2019
  Music                               D        0  Tue Jan  1 20:50:38 2019
  .DS_Store                          AH     8196  Sat Jul 13 11:07:32 2019
  Scans                               D        0  Thu Nov 24 07:43:00 2016
  Documents                           D        0  Sat Aug 22 18:40:22 2015
  Squid                               D        0  Sat Aug 22 18:40:36 2015
  Web Pages                           D        0  Sat Aug 22 18:36:56 2015
  _Audio                              D        0  Sat Mar 25 16:12:34 2017
  .Trash-1000                        DH        0  Fri Jan 15 14:51:08 2016
  Software                            D        0  Wed Mar 29 07:28:34 2017
  shared laptop drive                 D        0  Tue May 16 18:25:52 2017

                487417548 blocks of size 1024. 53455724 blocks available
smb: \>

```

