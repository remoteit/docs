# Services



A configuration registered on the [target device](https://support.remote.it/hc/en-us/articles/360051286351-Glossary-of-Terms#h\_01FMR1CAQ6AGF2077RXY49FTSX) which you will use to access remote [applications](https://support.remote.it/hc/en-us/articles/360051286351-Glossary-of-Terms#h\_01FMR1FGMKVJ6ZB9X3DQ8RJ133). The target device can have many services. There is a bulk service created by default and does not require entry of any service attributes. The bulk service provides the basis for a target device and enables scripting functionality._Attributes of a service:_

* Application Type: The application mapped to this service i.e. SSH, VNC, RDP, HTTP/S
* Port: The port on the target device which the application is listening
* Service host address: Local network IP address or fully qualified domain name to host this service
* Enabled: Whether or not the remote.it service is available for connections. You may want to disable this and enable it only when needed if you are concerned with bandwidth like on a cellular internet connection
* Status: This is online/offline status of the remote.it service.
