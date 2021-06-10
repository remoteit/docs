# Update Device or Service Name

You will need the service ID which can be retrieved using the [graphQL API](../graphql/usage-examples.md#find-services-by-name) or REST-API [device list](list.md#get-your-device-list) or [find by name](list.md#device-find-by-name).

{% api-method method="post" host="https://api.remote.it/apv/v27/device/name/" path="" %}
{% api-method-summary %}
Update Service Name
{% endapi-method-summary %}

{% api-method-description %}
This endpoint is used to update a service/device name. In the case of the device name, update the "bulk service". 
{% endapi-method-description %}

{% api-method-spec %}
{% api-method-request %}
{% api-method-headers %}
{% api-method-parameter name="auth" type="string" required=true %}
HTTP request signature or deprecated token and developerkey
{% endapi-method-parameter %}
{% endapi-method-headers %}

{% api-method-body-parameters %}
{% api-method-parameter name="devicealias" type="string" required=true %}
Updated Name
{% endapi-method-parameter %}

{% api-method-parameter name="deviceaddress" type="string" required=true %}
Service ID. In the case of device name, use the "bulk service" ID
{% endapi-method-parameter %}
{% endapi-method-body-parameters %}
{% endapi-method-request %}

{% api-method-response %}
{% api-method-response-example httpCode=200 %}
{% api-method-response-example-description %}
Success is status code 200 and json string. Failure will also return status code of 200, but with the body status "false"
{% endapi-method-response-example-description %}

```
{"status":"true"}
```
{% endapi-method-response-example %}
{% endapi-method-response %}
{% endapi-method-spec %}
{% endapi-method %}

