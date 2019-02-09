# Completely close your AWS Security Group

Now, you can change your AWS security group to completely close open access from the outside.

Before:

![](../../.gitbook/assets/image%20%2842%29.png)

After:

![](../../.gitbook/assets/image%20%2817%29.png)

Confirm that direct SSH access to the AWS EC2 instance times out now:

_`C:\>ssh -i "Ubuntu-Virginia.pem" ubuntu@ec2-xx-xx-xx-xxx.compute-1.amazonaws.com`_ 

`ssh: connect to host ec2-xx-xx-xx-xxx.compute-1.amazonaws.com port 22: Connection timed out`

You've made your system invisible to the outside world, yet access using remote.it still works!



