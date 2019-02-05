# Download and install the connectd Debian package

Copy and paste the following command to your console \(be sure to copy both wget and the long URL after it\) to download the remote.it connectd package:

wget [https://github.com/remoteit/installer/releases/download/v2.2.3.24/connectd\_2.2.3.24\_amd64.deb](https://github.com/remoteit/installer/releases/download/v2.2.3.24/connectd_2.2.3.24_amd64.deb)

This package is compatible with 64-bit x86 Debian \(which includes Ubuntu, Linux Mint, and many other distributions\).

Run the following command:

_sudo dpkg -i connectd\_2.2.3.24\_amd64.deb_

Now, you're ready to run the interactive installer.  Follow the directions given at this link to configure your AWS EC2 instance with a Device Name and a Service for SSH.

{% page-ref page="../../using-the-interactive-installer/" %}

