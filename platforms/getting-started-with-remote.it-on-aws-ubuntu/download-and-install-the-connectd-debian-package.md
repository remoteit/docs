# Download and install the connectd Debian package

Copy and paste the following command to your console \(be sure to copy both wget and the long URL after it\) to download the remote.it connectd package:

```bash
wget https://github.com/remoteit/installer/releases/download/v2.2.5/connectd_2.2.5_amd64.deb
```

This package is compatible with 64-bit x86 Debian \(which includes Ubuntu, Linux Mint, and many other distributions\).

Run the following command:

```bash
sudo dpkg -i connectd_2.2.5_amd64.deb
```

Now, you're ready to run the interactive installer. Follow the directions given at this link to configure your AWS EC2 instance with a Device Name and a Service for SSH.

{% page-ref page="../../guides/using-the-interactive-installer/" %}

