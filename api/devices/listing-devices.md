# Listing Devices

{% hint style="info" %}
**Note**  
Only use this API if you have 100 devices or less. [Contact support](https://remot3it.zendesk.com) for APIs for large device lists.
{% endhint %}

{% api-method method="get" host="https://api.remot3.it" path="/apv/v27/device/list/all" %}
{% api-method-summary %}
Get your device list
{% endapi-method-summary %}

{% api-method-description %}
Get your list of devices.
{% endapi-method-description %}

{% api-method-spec %}
{% api-method-request %}
{% api-method-headers %}
{% api-method-parameter name="token" type="string" required=true %}
Your session token, created by logging in using the API. 
{% endapi-method-parameter %}

{% api-method-parameter name="developerkey" type="string" required=true %}
Your developer key which can be found by logging into remote.it and going to your "Account" settings page.
{% endapi-method-parameter %}
{% endapi-method-headers %}
{% endapi-method-request %}

{% api-method-response %}
{% api-method-response-example httpCode=200 %}
{% api-method-response-example-description %}
Connection with device successfully created.
{% endapi-method-response-example-description %}

```javascript
{
    "devices": [
        {
            "createdate": "2018-03-29T04:19:02.19-04:00",
            "deviceaddress": "80:00:00:00:01:00:01:25",
            "devicealias": "Demo_CoralEdge_01_Web_Port_80",
            "devicelastip": "126.237.116.49",
            "devicestate": "active",
            "devicetype": "00:1E:00:00:00:01:00:00:04:60:00:50:00:01:00:00",
            "georegion": "Asia"
            "lastcontacted": "2018-12-29T14:56:50-05:00"
            "lastinternalip": "10.61.12.80"
            "ownerusername": "masaki@remot3.it"
            "servicetitle": "Basic Web"
            "shared": "shared-from"
        }
    ],
    "status": "true"
}
```
{% endapi-method-response-example %}
{% endapi-method-response %}
{% endapi-method-spec %}
{% endapi-method %}

{% hint style="info" %}
**Note**  
Some response values are omitted from the example above because they are only used in very specific circumstances.
{% endhint %}

