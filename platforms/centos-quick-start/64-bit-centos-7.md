# 64-bit Centos

### Download the tar file

Copy the "curl" line below to your system's console and execute it.

```bash
curl -LkO https://github.com/remoteit/installer/releases/download/v2.2.5/connectd_2.2.5_x86_64-etch.tar
```

Which should output something like:

```bash
% Total % Received % Xferd Average Speed Time Time Time Current Dload Upload Total Spent Left Speed 
100 621 0 621 0 0 3088 0 --:--:-- --:--:-- --:--:-- 3105 100 350k 100 350k 0 0 1229k 0 --:--:-- --:--:-- --:--:-- 1229k 
```

### Check the file size and MD5 checksum

```bash
ls -l total 352 -rw-rw-r--. 1 
```

Which should output something like:

```bash
centos centos 358400 Feb 12 00:29 connectd_2.2.5_x86_64-etch.tar
```

Then check the MD5 checksum:

```bash
md5sum connectd_2.2.5_x86_64-etch.tar 416fca581f711a3ca238c1e768841f8b connectd_2.2.5_x86_64-etch.tar 
```

### Move the connectd tar file to the root folder and extract it

```bash
sudo mv connectd_2.2.5_x86_64-etch.tar / 
cd / 
sudo tar -xf connectd_2.2.5_x86_64-etch.tar 
```

Now you can run the interactive installer to configure your device.

{% page-ref page="../../guides/using-the-interactive-installer/" %}

