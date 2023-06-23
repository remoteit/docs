# Docker

Docker is already well known for its application on desktops and servers.  More and more devices are also supporting Docker in their environments.  This can greatly simplify the installation and upgrade of Remote.It.

Our first implementation of Remote.It on Docker was based on the OpenWRT docker image with our Remote.It Device Package installed.  This is called the "remoteit-agent".

Our second implementation was a Docker Desktop Extension.  Our Remote.It Docker Extension is based on the Alpine image and not only has the Remote.It Device Package installed, but it also has a node application that communicates with the Docker Daemon. &#x20;

Here is an illustration of an environment which has a Docker container with a web server, database, Redis, and Remote.It agent installed.

![](<../../.gitbook/assets/remoteit docker (1).png>)
