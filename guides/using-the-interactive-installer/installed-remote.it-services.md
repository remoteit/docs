# Installed remote.it Services

Initially, your table of "Installed remote.it Services" will be empty.  After you install some services, they will show up in this list.

![](../../.gitbook/assets/image%20%28172%29.png)

* The "Service Name" is the name you gave this service when you created it.
* "Protocol" indicates the selection you made at the "Protocol Selection Menu".
* "LAN Address" will show "localhost" for Services you installed using Main Menu Option 1.  It will show the IP address or mdns name of Services you installed using Main Menu option 2.
* "Port" shows the TCP port you selected when adding the Service.
* "Application" will show "OK" or "not detected" depending on whether the script was able to detect a TCP server at the assigned address and port.  In the case of Services on your device \(with LAN address "localhost"\), the table also shows the name of the application which is listening on that TCP port.

Below the list of Services is some additional information.

* Device Name - this is the Device Name you entered the first time you ran the interactive installer script.
* Platform: indicates the binary architecture of the installed connectd package.   You do not need to pay attention to this, although it might be useful information to send to support@remote.it in the event you have trouble getting remote.it working.
* Hardware ID - this is shown in the "HWID" column of the "View Devices" page of the remote.it web portal.  Again, this information is not normally important to pay attention to but might be useful in the event there is a problem.

In the event you see "not detected" in the "Application" column, several possibilities exist:

* You have not installed an application which is listening on this port
* You've installed an application, but it uses UDP, which remote.it does not support.
* The application is installed, but it's not running.  Check your application's documentation to make sure it is running.
* You entered the wrong port during the setup.
* The application is one that is actually there, but not detected by the script.

See the following page for more information if you encounter "not detected" and cannot resolve the issue.

{% page-ref page="plan-what-you-want-to-connect-to.md" %}



