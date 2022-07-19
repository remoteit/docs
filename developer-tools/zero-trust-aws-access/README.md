# Zero-Trust AWS Access

You can use an EC2 instance as a Jump server to other services running in the same VPC, such as a database or Kubernetes cluster. You can also add remote.it access to any services which are running on an existing EC2 instance. Setup only takes a couple of minutes. You can do all of this without any inbound rules in the AWS security groups, thereby blocking all ingress traffic and eliminating open ports to the internet.

With the target services setup such as databases, storage and web applications, you can simply add authorized users via email address in the Remote.It application. This works well with your remote workers and contractors by eliminating the need for IP allow lists to be maintained. It also works on CGNAT connections where your team may be connected via a cellular or satellite carrier where IP addresses are not known or are transient. For more information on Organizations, [click here](https://link.remote.it/support/organizations).&#x20;

{% embed url="https://youtu.be/6kv_EYkfiyY" %}

## Creating a EC2 instance with Remote.It

You will need:

* A Remote.It account
* Remote.It Desktop Application (version 3.5.2 or greater)
* AWS console access to the account where you will setup the instance

### 1. Retrieve your Remote.It one line setup code

Log into the Remote.It Desktop App with the account which will act as owner of the instance

Click + (add device) and select "Linux & Raspberry Pi"\


![](<../../.gitbook/assets/mceclip1 (1).png>)

Copy the generated command (You will be using this in your EC2 setup)\


![](<../../.gitbook/assets/mceclip2 (1).png>)

### 2. Launch your EC2 instance

Log into AWS console account

Select the region and go the the EC2 dashboard

Select "Launch Instance"

Enter name for the instance and leave the defaults for the Application and OS images (Amazon Linux 2)

The instance type can be left at t2.micro (if this instance is being used as a bastion host)

Select a key pair that you already have setup or create a new key pair

Deselect the checkbox for "Allow SSH traffic from" (you do not need public access with Remote.It)

Open "Advanced details"

In the "User data", field enter `#!/bin/sh` + return and your previously copied command from Remote.it\


![](<../../.gitbook/assets/EC2\_Management\_Console (2).png>)

Click "Launch Instance"

Once the EC2 instance initializes and is running it should automatically appear in your Remote.It device list with an SSH service.

**Congratulations, you are now ready to connect via SSH or continue on to** [**add other services**](./#3.-add-other-services-optional-1) **or** [**share**](./#4.-share-with-colleagues-optional-1)****

## Install remote.it on an existing EC2 instance

You will need:

* A Remote.It account
* Remote.It Desktop Application (version 3.5.2 or greater)
* SSH access to the EC2 instance

### 1. Retrieve your Remote.It one line setup command

Log into the Remote.It Desktop App with the account which will act as owner of the instance

Click + (add device) and select "Linux & Raspberry Pi"\


![](<../../.gitbook/assets/mceclip1 (1).png>)

Copy the generated command (You will be using this in your EC2 setup)\


![](<../../.gitbook/assets/mceclip2 (1).png>)

### 2. Install remote.it

SSH into your EC2 instance

Paste the generated command into your terminal and enter

This will automatically install Remote.It, register the EC2 instance to your account, and setup the SSH service in Remote.It

Once the installation is complete, it will automatically appear in your Remote.It device list with an SSH service.

**Congratulations!** You are now ready to connect via SSH or continue on to [add other services](./#3.-add-other-services-optional-1) or [share](./#4.-share-with-colleagues-optional-1). You can also close any external inbound security groups which have IP allow lists once you share to anyone who needs access.

## Add other services (optional)

You can add additional services that are either on the instance (i.e. web server) or a jump target to a service in the VPC such as a database which will allow you to connect directly as localhost.&#x20;

### Add a jump service

Examples are not limited to the ones provided. As long as you have an internal route from the EC2 instance to the target, you can add anything. You can look at any of the examples for a general guide. If you need further assistance, contact support@remote.it&#x20;

* [RDS](aws-rds-postgres-and-mysql.md) (Postgres and MySQL)
* More examples coming soon!

### Add a service which is running on the EC2 instance

Use this option when you want to add access to a service(port) which is on the instance itself such as a web server.

Select the instance from the device list

Click + (Add Service)

![](<../../.gitbook/assets/remote\_it (2).png>)

Select the service type from the list and name the service

Verify the port (will default to the standard port for that type)

Click "Save"

The service will be available in a few moments.

#### You are ready to connect!

## Share with colleagues (optional)

You can also share access to this instance and even only to specific services.&#x20;

[Learn more about organizations](https://link.remote.it/support/organizations)

[Learn more about sharing](https://link.remote.it/docs/sharing)
