# AWS RDS (Postgres and MySQL)

Building off the setup of an EC2 instance, you can use it as a bastion host to "jump" to other services in the VPC. One of these types of services can be an RDS (managed relational database). The advantage is that you do not have to make it publicly accessible and still have access yourself. \


This allows the developers to work with the database with their tools and in their local development environments as if the database were running locally even when the database has multiple availability zones.

{% hint style="info" %}
The RDS instance must have a VPC security group assigned which allows the EC2 instance a path to the RDS instance.
{% endhint %}

To get started you will need:

* A Remote.It account which owns the EC2 device or management rights to the device
* Remote.It Desktop Application (version 3.5.2 or greater)
* AWS console access to the RDS instance



1. Open your AWS Console to the database instance page.
2. Copy the Endpoint address (internal DNS name) and note the port. See image below

![](../../.gitbook/assets/RDS\_Management\_Console.png)

3\. In the Remote.It Desktop App, select the instance from the device list

4\. Click + (Add Service)

![](<../../.gitbook/assets/remote\_it (2).png>)

5\. Select the service type from the list and name the service (Many options are available, if you do not see the type you need, you can select TCP), name your service so you can identify it in the future from the list.

6\. Verify the port which will default to the standard port for the service type. If you have changed it, update it to match what is shown in your AWS Console.

7\. In the Service Host Address field, which is pre-populated with "127.0.0.1", paste the address you copied from the AWS console.

![](<../../.gitbook/assets/remote\_it (1).png>)

8\. Click "Save". In a few moments the service will become available and is ready to connect.



