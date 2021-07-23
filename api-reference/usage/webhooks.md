# Webhooks

remote.it supports **webhooks** which allow you to receive HTTP push notifications for device online/offline notifications. This allows you to build integrations on top of remote.it. Some examples are to perform debug operations on devices which go offline, send messages, or check for the device IP change when it comes online.

Your webhook consumer is a simple HTTP endpoint. It is not an email address or a general website url. It must satisfy the following conditions:

* It's available in a publicly accessible HTTPS, non-localhost URL
* It will respond to the remote.it Webhook push \(HTTP POST request\) with a `HTTP 200` \("OK"\) response

If a delivery fails \(i.e. server unavailable or responded with a non-200 HTTP status code\), the push might subsequently be retried a couple of times. If the webhook URL continues to be unresponsive the webhook might be disabled by remote.it, and must be re-enabled again manually.

For additional information on Webhooks, you can use any of these resources:

* [RequestBin: Webhooks – The Definitive Guide](https://requestbin.com/blog/working-with-webhooks/)
* [requestbin.com](https://requestbin.com/) is a great tool for testing webhooks
* [GitHub Developer Guide: Webhooks](https://developer.github.com/webhooks/)

## Enabling a Webhook

You can add a webhook endpoint to your account, by signing in to your account and navigating to the account page. Select the types of notifications you to which you wish to subscribe and enter the webhook url.

{% hint style="info" %}
A webhook url is not a email address or a general website url. If you wish to receive email notifications select the email checkbox.
{% endhint %}

![](../../.gitbook/assets/webhook-portal.png)

## Notification Latency

* Online notifications will be sent almost immediately.
* Offline notifications will be sent almost immediately, if the system was shutdown or rebooted using specific "shutdown" or "reboot" commands. Using command line options to stop and start the connectd daemons directly will also send notifications immediately.
* If the reason for your device going offline is an unexpected interruption of power or internet connection, it may take up to 15 minutes to receive the offline notification.

