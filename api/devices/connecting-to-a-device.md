# Connecting to a Device

{% api-method method="post" host="https://api.remot3.it" path="/apv/v27/device/connect" %}
{% api-method-summary %}
Connect to a device
{% endapi-method-summary %}

{% api-method-description %}
Create a connection to a device. Use the 
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

{% api-method-body-parameters %}
{% api-method-parameter name="wait" type="string" required=false %}
Whether to wait for the connection or not. Should most likely be "true"
{% endapi-method-parameter %}

{% api-method-parameter name="deviceaddress" type="string" required=true %}
The service address \(e.g. service ID\) for the device you'd like to connect to.
{% endapi-method-parameter %}
{% endapi-method-body-parameters %}
{% endapi-method-request %}

{% api-method-response %}
{% api-method-response-example httpCode=200 %}
{% api-method-response-example-description %}
Connection with device successfully created.
{% endapi-method-response-example-description %}

```javascript
{
    "connection": {
        "deviceaddress": "80:00:00:00:00:00:00:F1",
        "expirationsec": "28797",
        "proxy": "https://xprbjalo.p18.rt3.io"
    },
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



