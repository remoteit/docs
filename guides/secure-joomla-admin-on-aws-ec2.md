# Secure Joomla Admin on AWS EC2

## Overview

Joomla powers about 3% of all websites on the internet, and much like Wordpress, it is a common target for attacks.

Since the administrator login page can be accessed just by navigating to /administrator on the webpage, a brute-force attack is very common. Even if the username and password are very strong, as time goes one these bots will become better at guessing login credentials.

Admins can use Apache Htaccess rules to block access to /administrator from all senders excluding localhost. While providing increased security, admins themselves will then have a difficult time accessing the admin dashboard.

Fortunately, we can use remote.it to access the Joomla admin dashboard while it's blocked to the outside world. In this guide, we'll deploy a Joomla configured AWS EC2 instance, lockdown /administrator using Htaccess, and create a proxy connection to the dashboard using remote.it.

## Prerequisites

1. A remote.it account. [Don't have one?](https://app.remote.it/auth/#/sign-up)
2. An AWS account with EC2 privileges.
