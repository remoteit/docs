# Jump Service/Bastion Host

You can use the Remote.It application running on one device to access TCP services on other devices on the same LAN, without needing to install remoteit on those other devices. This is sometimes referred to as a **jump service/box** also known as a **bastion host**.

Best practice is to install remoteit on a device that will be available at all times. This is ideal in an AWS environment to have a since EC2 instance act as the gateway into the VPC.

This is typically done when the targeted resource is not compatible with Remote.It and it cannot be installed (e.g. a printer, hosted resources)
