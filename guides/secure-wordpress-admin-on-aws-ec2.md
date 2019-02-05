# Secure WordPress Admin on AWS EC2

## Overview

Wordpress powers approximately 32% of the top one million websites on the internet. Despite its widespread adoption, there exist many widely known security variabilities.

A common attack vector for WordPress websites is attackers gaining access to the WordPress admin dashboard (/wp-admin). Admins can use Apache Htaccess rules to block access to /wp-admin from all senders excluding localhost. While providing increased security, admins themselves will then have a difficult time accessing the admin dashboard.

Fortunately, we can use remote.it to access the WordPress admin dashboard while it's blocked to the outside world. In this guide, we'll deploy a WordPress configured AWS EC2 instance, lockdown /wp-admin using Htaccess, and create a proxy connection using remote.it.

## Prerequisites

1. A remote.it account. Don't have one? Register here!
2. An AWS account with EC2 privileges.

## Launch your AWS EC2 Instance

We'll be using AWS EC2 to deploy our WordPress site. Specifically, we'll be using the [BitNami WordPress EC2 AMI](https://aws.amazon.com/marketplace/pp/B00NN8Y43U). This AMI automates the installation and configuration of WordPress.

If you're new to EC2, follow this [AWS guide on how to configure and launch your instance](https://aws.amazon.com/getting-started/tutorials/launch-a-wordpress-website/).

## Lockdown wp-admin using htaccess.conf

## Install remote.it

```shell
sudo apt−get dist−upgrade
sudo apt-get update
```

```shell
sudo apt-get install remoteit
sudo remoteit
```

## Configure Your Device

## Generate The Proxy URL

## Connect To The Admin Dashboard
