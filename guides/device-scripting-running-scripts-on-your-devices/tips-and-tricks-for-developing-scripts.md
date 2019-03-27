# Tips and tricks for developing scripts

### General 

* Only the “Bulk Service” is required to run scripts. 
* Scripts may operate differently on different versions of the operating system or different devices 
* Scripts are only supported currently on Linux devices
* Scripts execute as root user – so “sudo” is not needed and you can mess things up if you are not careful!

### Writing scripts 

* Start with the supplied examples
* Scripts MUST end with either “Status 1 OK” \(success\) or “Status 2 Failed” \(failure\) commands.  Without one of these, tasks and jobs will never get to the "completed" state.
* You can clear a status cell in your scripts by executing, e.g. “Status a '' “  \(that is two single quotes without anything in between following the letter "a"\).
* Learn how to use Linux utilities like “grep”, “awk” and “sed” to trim the information you want to display 
* Test script fragments at the console first 

### Debugging scripts 

* Scripts download to and execute from the /tmp folder.
* Install and connect to a remote.it SSH service 
* Write frequently to a log file which you can review at the console 
* Send intermediate results to a status cell

### Job Status 

* One task \(a script running on a device\) which does not complete keeps the Job in the “Running” state. 
* Cancel Jobs which you suspect have not completed, then debug. 
* Canceling a Job does not “undo” the action of the script. 
* Job status can take several minutes to update, so be patient

