# Zero Trust Azure Cloud Access

You can use a Virtual Machine as a Jump server to other services running in the same VPC, such as a database or Kubernetes cluster. You can also add Remote.It access to any services which are running on an existing Virtual Machine instance. Setup only takes a couple of minutes. You can do all of this without any inbound rules in the security groups, thereby blocking all ingress traffic and eliminating open ports to the internet.

With the target services setup such as databases, storage and web applications, you can simply add authorized users via email address in the Remote.It application. This works well with your remote workers and contractors by eliminating the need to maintain IP allow lists. It also works on CGNAT connections where your team may be connected via a cellular or satellite carrier where IP addresses are not known or are transient. For more information on Organizations, [click here](https://link.remote.it/support/organizations).&#x20;

This allows the developers to work with the database with their tools and in their local development environments as if the database were running locally even when the database has multiple availability zones.

{% hint style="success" %}
We have a [video tutorial available at YouTube](https://link.remote.it/youtube/azure). Written step by step guide is coming soon.
{% endhint %}

{% embed url="https://youtu.be/L1REB9l6-DE" %}
