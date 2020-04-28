# Connect to your EC2 instance using remote.it

To connect to SSH on your EC2 instance using a remote.it proxy connection through the remote.it web portal, start by clicking on the new Device Name to open the Services Dialog.

![](../../.gitbook/assets/image%20%2820%29.png)

Now click on the ssh service you created.

![](../../.gitbook/assets/image%20%28295%29.png)

This gives you parameters you can use for an AWS command line using your PEM key over a remote.it connection.

![](../../.gitbook/assets/image%20%28210%29.png)

Use the values above in the following ssh command to connect to your AWS instance over remote.it:

_ssh - i &lt;local PEM key&gt; &lt;user&gt;@&lt;Host Name&gt; - p &lt;Port&gt;_

![](../../.gitbook/assets/image%20%28412%29.png)

This sounds like a job for the API!

{% page-ref page="../../api-reference/overview.md" %}

