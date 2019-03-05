# 32-bit Centos

### Download the tar file

Copy the "curl" line below to your system's console and execute it.

```bash
curl -LkO https://github.com/remoteit/installer/releases/download/v2.2.5/connectd_2.2.5_x86-etch.tar
```

Which should output something like:

```bash
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  330k  100  330k    0     0   838k      0 --:--:-- --:--:-- --:--:--  838k
```

### Check the file size and MD5 checksum

```bash
ls -l
```

Should output something like:

```bash
total 332 -rw-r--r--. 1 
root root 337920 Feb 12 03:28 connectd_2.2.5_x86-etch.tar
```

Now check the MD5 checksum:

```bash
md5sum connectd_2.2.5_x86-etch.tar 155ff94fc5d349b4be29a843a38c53fb connectd_2.2.5_x86-etch.tar 
```

### Move the connectd tar file to the root folder and extract it

If you are not the root user, use "sudo su" prior to executing these following commands.  After you are done, "exit" back to your normal user account.

```bash
mv connectd_2.2.5_x86-etch.tar / 
cd / 
tar -xf connectd_2.2.5_x86-etch.tar 
```

Now you can run the interactive installer to configure your device.

{% page-ref page="../../guides/using-the-interactive-installer/" %}

