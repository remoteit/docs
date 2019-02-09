# Secure Joomla Admin on AWS EC2

## Overview

Joomla powers about 3% of all websites on the internet, and much like Wordpress, it is a common target for attacks.

Since the administrator login page can be accessed just by navigating to /administrator on the webpage, a brute-force attack is very common. Even if the username and password are very strong, as time goes one these bots will become better at guessing login credentials.

Admins can use Apache Htaccess rules to block access to /administrator from all senders excluding localhost. While providing increased security, admins themselves will then have a difficult time accessing the admin dashboard.

Fortunately, we can use remote.it to access the Joomla admin dashboard while it's blocked to the outside world. In this guide, we'll deploy a Joomla configured AWS EC2 instance, lockdown /administrator using Htaccess, and create a proxy connection to the dashboard using remote.it.

## Prerequisites

1. A remote.it account. [Don't have one?](https://app.remote.it/auth/#/sign-up)
2. An AWS account with EC2 privileges.

## Launch your AWS EC2 Instance

We'll be using an AWS EC2 to deploy our WordPress site. Specifically, we'll be using the [BitNami Joomla EC2 AMI](https://aws.amazon.com/marketplace/pp/B00NNZUP54). This AMI automates the installation and configuration of Joomla.

If you're new to EC2, follow this [AWS guide on how to configure and launch your instance](https://aws.amazon.com/getting-started/tutorials/launch-a-wordpress-website/). Make sure to select/generate an ssh key pair.

Enter the public IP address for your instance into your browser's search bar.

![Instances Dashboard](../.gitbook/assets/joomla-aws/locate-id.png "aws ec2 running instances dashboard")

The page that appears will look something like this.

![Joomla Front Page](../.gitbook/assets/joomla-aws/website-front-page.png "your joomla front page")

Notice how if you add `/administrator` to your route you can access the admin login page. This is the security issue we're going to fix. We want to block all public access to this page but still be able to access it via remote.it.

## SSH into your instance

We're going to use the key pair associated with your instance to connect via ssh. Run the following commands in your terminal.

```shell
chmod 400 PATH_TO_KEY
ssh -i PATH_TO_KEY ubuntu@INSTANCE_ADDRESS
```

![Terminal Window](../.gitbook/assets/joomla-aws/ec2-ssh.png "ssh terminal")

You've now SSHed into the EC2 instance! Now we can start securing the Joomla site.

## Lockdown administrator login using Htaccess

### What is Htacces?

Htaccess is a directory level configuration file that, among other use cases, can be used to block access to particular resources. In the BitNami Joomla AMI, there is a single Htaccess file that handles configuration for the entire application. This is the file we'll be working with. To learn more about the BitNami Joomla AMI project structure, [check out the documentation](https://docs.bitnami.com/aws/apps/joomla/).

### Edit The Htacces Configuration File

Inside the EC2 instance, run the following command to begin editing the website Htaccess configuration.

`vim /home/bitnami/apps/joomla/conf/htaccess.conf`

![Vim Editor](../.gitbook/assets/wordpress-aws/htaccess-vanilla.png "before locking down administrator login")

Add the following code to the bottom of the file.

```shell
<Directory "/opt/bitnami/apps/joomla/htdocs/administrator">
    # Block access to administrator login to all IP's excluding localhost.
    Order deny,allow
    Deny from all
    Allow from 127.0.0.1
</Directory>
```

![Vim Editor](../.gitbook/asset/joomla-aws/htaccess-edited.png "after locking down administrator login")

Save and exit Vim and run the following command to restart the web server.

`sudo /opt/bitnami/ctlscript.sh restart`

Once the server has restarted, `Site_IP/administrator` will appear like this.

![Blocked Admin Dashboard](../.gitbook/assets/joomla-aws/admin-forbidden.png "your blocked admin dashboard")

Congratulations - you've now blocked all incoming access to your website's admin portal. This dramatically increases the security of your site. However, we currently have no way ourselves to access the admin dashboard. This is where remote.it comes in.

## Install remote.it connectd

Inside the EC2 instance, run the following commands

```shell
sudo apt-get update
sudo apt-get install connectd
sudo connectd_installer
```

## Configure Your Device

1. Start the connectd installer by running `sudo connectd_installer` and sign in.

![Connectd Installer Menu](../.gitbook/assets/joomla-aws/sudo-connectd-installer.png "the connectd installer menu")

1. Enter 1 for `Attach/reinstall a remote.it Service to an application`.

2. Chose the default port assignment (80).

3. Name the service `joomla-admin`.

![Connectd Service Setup](../.gitbook/assets/joomla-aws/http-service-setup.png "seting up an http service")

You've now configured a remote.it service on the host machine. We will now be able to make secure HTTP proxy connection to our machine via remote.it.

## Generate The Proxy URL

Navigate to app.remote.it and select the device with the name you entered.

![remote.it Device Menu](../.gitbook/assets/joomla-aws/device-services.png "connectd service options")

## Connect To The Admin Dashboard

Select the `joomla-admin` http service. You will be presented with a proxy URL similar to `wcdnqety.p17.rt3.io`. Add `/administrator` to this path. This URL takes you to the admin dashboard

![Secured Admin Dashboard](../.gitbook/assets/joomla-aws/joomla-admin.png "secured admin dashboard")

We've now just demonstrated the use for remote.it in securing your WordPress website. By using Htaccess, we've entirely blocked all public access to our admin dashboard making it inaccessible accept via remote.it. You can share your device with any other truster admins allowing your whole team to quickly and securely maintain your website.
