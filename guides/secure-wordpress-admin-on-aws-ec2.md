# Secure WordPress Admin on AWS EC2

## Overview

Wordpress powers approximately [32% of the top one million websites on the internet](https://www.codeinwp.com/blog/wordpress-statistics/). Despite its widespread adoption, there exist many widely known security variabilities.

A [common attack vector](https://www.inmotionhosting.com/support/edu/wordpress/wp-login-brute-force-attack) for WordPress websites is attackers gaining access to the WordPress admin dashboard (/wp-admin). Admins can use Apache Htaccess rules to block access to /wp-admin from all senders excluding localhost. While providing increased security, admins themselves will then have a difficult time accessing the admin dashboard.

Fortunately, we can use remote.it to access the WordPress admin dashboard while it's blocked to the outside world. In this guide, we'll deploy a WordPress configured AWS EC2 instance, lockdown /wp-admin using Htaccess, and create a proxy connection to the dashboard using remote.it.

## Prerequisites

1. A remote.it account. [Don't have one?](https://app.remote.it/auth/#/sign-up)
2. An AWS account with EC2 privileges.

## Launch your AWS EC2 Instance

We'll be using an AWS EC2 to deploy our WordPress site. Specifically, we'll be using the [BitNami WordPress EC2 AMI](https://aws.amazon.com/marketplace/pp/B00NN8Y43U). This AMI automates the installation and configuration of WordPress.

If you're new to EC2, follow this [AWS guide on how to configure and launch your instance](https://aws.amazon.com/getting-started/tutorials/launch-a-wordpress-website/). Make sure to select/generate an ssh key pair.

Enter the public IP address for your instance into your browser's search bar.

![alt text](../.gitbook/assets/wordpress-aws/locate-id.png "aws ec2 running instances dashboard")

The page that appears will look something like this.

![alt text](../.gitbook/assets/wordpress-aws/website-front-page.png "your wordpress front page")

Notice how if you add `/admin` to your route you can access the admin login page. This is the security issue we're going to fix. We want to block all public access to this page but still be able to access it via remote.it.

## Lockdown wp-admin using htaccess.conf

### SSH into your instance

We're going to use the key pair associated with your instance to connect via ssh. Run the following commands in your terminal.

```shell
chmod 400 PATH_TO_KEY
ssh -i PATH_TO_KEY ubuntu@INSTANCE_ADDRESS
```

![alt text](../.gitbook/assets/wordpress-aws/ec2-ssh.png "ssh terminal")

You've now SSHed into the EC2 instance! Now we can start securing the WordPress site.

## Lockdown wp-admin using Htaccess

### What is Htacces?

Htaccess is a directory level configuration file that, among other use cases, can be used to block access to particular resources. In the BitNami WordPress AMI, there is a single Htaccess file that handles configuration for the entire application. This is the file we'll be working with. To learn more about the BitNami WordPress AMI project structure, [check out the documentation](https://docs.bitnami.com/aws/apps/wordpress/).

### Edit The Htacces Configuration File

Run the following command to begin editing the website Htaccess configuration.

`vim /opt/bitnami/apps/wordpress/conf/htaccess.conf`

![alt text](../.gitbook/assets/wordpress-aws/htaccess-vanilla.png "before locking down wp-admin")

Add the following code to the bottom of the file.

```shell
<Directory "/opt/bitnami/apps/wordpress/htdocs/wp-admin">
    # Block access to wp-admin to all IP's excluding localhost.
    Order deny,allow
    Deny from all
    Allow from 127.0.0.1
</Directory>
```

![alt text](../.gitbook/assets/wordpress-aws/htaccess-edited.png "after locking down wp-admin")

Save and exit Vim and run the following command to restart the web server.

`sudo /opt/bitnami/ctlscript.sh restart`

Once the server has restarted, `Site_IP/admin` will appear like this.

![alt text](../.gitbook/assets/wordpress-aws/admin-forbidden.png "your blocked admin dashboard")

Congratulations - you've now blocked all incoming access to your websites admin portal. This dramatically increases the security of your site. However, we currently have no way ourselves to access the admin dashboard. This is where remote.it comes in.

## Install remote.it connectd

```shell
sudo apt-get update
sudo apt-get install connectd
sudo connectd_installer
```

## Configure Your Device

1. Start the connectd installer by running `sudo connectd_installer` and sign in.

![alt text](../.gitbook/assets/wordpress-aws/sudo-connectd-installer.png "the connectd installer menue")

1. Enter 1 for `Attach/reinstall a remote.it Service to an application`.

2. Chose the default port assignment (80).

3. Name the service `wordpress-admin`.

![alt text](../.gitbook/assets/wordpress-aws/http-service-setup.png "")

You've now configured a remote.it service on the host machine. We will now be able to make secure HTTP proxy connection to our machine via remote.it.

## Generate The Proxy URL

Navigate to app.remote.it and select the device with the name you entered.

![alt text](../.gitbook/assets/wordpress-aws/device-services.png "connectd service options")

## Connect To The Admin Dashboard

Select the `wordpress-admin` http service. You will be presented with a proxy URL similar to `wcdnqety.p17.rt3.io`. Add `/wp-admin` to this path. This URL takes you to the WordPress admin dashboard

![alt text](../.gitbook/assets/wordpress-aws/wp-admin.png "secured admin dashboard")

We've now just demonstrated the use for remote.it in securing your WordPress website. By using Htaccess, we've entirely blocked all public access to our admin dashboard making it inaccessible accept via remote.it. You can share your device with any other truster admins allowing your whole team to quickly and securely maintain your website.