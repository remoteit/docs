# Cancelling a Job

The most common reason for cancelling a job is that one of the tasks within the job has failed to complete, which will keep this job from being reported as "done" in the table on the "Scripting" page.

If your Job stays in the "running" state longer than you expect, you can check on the status of individual devices by clicking on the highlighted "running" link:

![](../../.gitbook/assets/image%20%28167%29.png)

Now you will see a dialog showing the detailed status of the script on each Device.

![](../../.gitbook/assets/image%20%28110%29.png)

The Status is "done" on all Devices in this example except for the "Liverock-Bulk-03" Device.  In this example demonstrating a script failure, the "Liverock-Bulk-03" Device uses a different OS than all the others and it is missing a utility that the script depends on.

To cancel this Job, close the "Job Details" dialog, then click on the red circled "x" under "Actions".

![](../../.gitbook/assets/image%20%2822%29.png)

![](../../.gitbook/assets/image%20%28294%29.png)

Confirm that you wish to cancel, then click on "Submit".

The status will initially show as "Cancelling" and finally "Failed".

