# Remote.it Docker Extension

The [Remote.it](https://www.remote.it) Docker Extension is a docker image.

You can install this docker image in two ways:

* Docker Extension
* Docker Container

### Docker Extension

1. Open your Docker Dashboard from your Docker Desktop app
2. Go to the Extensions menu item on the left side
3. Click on the "Add Extensions" menu item
4. In "Browse" search bar enter "Remote.It"
5. Select the "Remote.It" extension
6. Click on "Install" and then "Open" after the Remote.It Docker Extension is installed
7. Click on "Get Registration Code" and log into your RemoteIt account that you want to register this device with
8. Once you have logged in you will see it generate a registration code and ask you to open Docker Desktop
9. Once you get back to Docker Desktop the new registration code should be automatically populated for you
10. Just click the "Register" button

### Docker Container

You can run this same image on server-based docker hosts that do not have the Docker Desktop installed. For example, you could install this on a Raspberry Pi running just the Docker daemon. In order to do that you can run the following command:

```
docker run \
  -d \
  --name myname \
  --hostname myname \
  -e R3_REGISTRATION_CODE="<registration_code>" \
  -v $PWD/myname:/etc/remoteit \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --restart unless-stopped \
  remoteit/docker-extension
```

This is a breakdown of the command:

* **-d** = run this container in detached mode in the background.
* **--name myname** = This sets the container name. Otherwise a name is generated for you.
* **--hostname myname** = This sets the hostname within the container. The hostname is used by Remote.it to set the Device Name during registration.
* **-e R3\_REGISTRATION\_CODE="\<registration\_code>"** = This is your registration\_code that you get from the Remote.it Desktop by clicking on the + sign in the Device list and selecting "Docker" from the "Add a Device" section.
* **-v $PWD/myname:/etc/remoteit** = The path on the Docker host that will be mapped to the /etc/remoteit folder within the container. Anything which is written to the /etc/remoteit folder in the container will show up on the Docker host. When you stop or kill the container, you can restart it and the Remote.it Agent will find the existing /etc/remoteit/config.json.
* _**-v /var/run/docker.sock:/var/run/docker.sock**_ = Mount the docker socket inside the container.
* **--restart unless-stopped** = Insures that the remoteit-agent docker container restarts after a shutdown of the docker daemon such as a power on/off or reboot of the docker host.
