# Remote.It Agent

The [RemoteIt Agent](https://hub.docker.com/r/remoteit/remoteit-agent) docker image is the Remote.It [Device Package](../device-package/) running inside a Docker container.

### Running the container in a development environment:

Get your registration code docker command from [app.remote.it ](https://app.remote.it)or Remote.It Desktop by clicking on the "Add Device" button in the left nav and then selecting "Docker" which is in the Add a device. Example below:

{% code overflow="wrap" lineNumbers="true" %}
```bash
docker run -d -e R3_REGISTRATION_CODE="<registration_code>" remoteit/remoteit-agent:latest
```
{% endcode %}

This will run a basic Remote.it agent and automatically register it to your Remote.it account based on the registration code.

The command is sufficient for testing but should not be used in a Production environment. There are a few other docker settings to add in order to make this container recoverable so it can be restarted without losing your configuration.

The Remote.it Agent uses a file to keep track of this device's metadata information as well as connection info. In order to maintain this configuration, there are a few more docker settings that need to be set so that when you stop and start the Remote.it Agent container, it comes back as the already registered device. We'll start off with a full production example and explain the different options in the command.

```
docker run \
  -d \
  --name myname \
  --hostname myname \
  -v $PWD/myname:/etc/remoteit \
  -e R3_REGISTRATION_CODE="<registration_code>" \
  --restart unless-stopped \
  remoteit/remoteit-agent:latest
```

This is a breakdown of the command:

* **-d** = Run this container in detached mode in the background.
* **--name myname** = This sets the container name. Otherwise a name is generated for you.
* **--hostname myname** = This sets the hostname within the container. The hostname is used by the Remote.It Agent to set the Device Name during registration.
* **-v $PWD/myname:/etc/remoteit** = The path on the Docker host that will be mapped to the /etc/remoteit folder within the container. Anything written to the /etc/remoteit folder in the container will show up on the Docker host. When you stop or kill the container, you can restart it and the Remote.it Agent will find the existing /etc/remoteit/config.json.
* **-e R3\_REGISTRATION\_CODE="\<registration\_code>"** = This is your registration\_code that you can get from the Remote.it Desktop by clicking on the + sign in the Device list and selecting "Docker" from the "Add a Device" section.
* **--restart unless-stopped** = This insures that the remoteit-agent docker container restarts after a shutdown of the docker daemon such as a power on/off or reboot of the docker host.
