# Authentication

{% api-method method="post" host="https://api.remot3.it" path="/apv/v27/user/login" %}
{% api-method-summary %}
Login
{% endapi-method-summary %}

{% api-method-description %}
This endpoint allows you to login to your remote.it account and get a authentication token which is required for all other authenticated  APIs. 
{% endapi-method-description %}

{% api-method-spec %}
{% api-method-request %}
{% api-method-headers %}
{% api-method-parameter name="developerkey" type="string" required=true %}
Your developer key which can be found by logging into remote.it and going to your Account settings page.
{% endapi-method-parameter %}
{% endapi-method-headers %}

{% api-method-body-parameters %}
{% api-method-parameter name="password" type="string" required=true %}
Password for remote.it
{% endapi-method-parameter %}

{% api-method-parameter name="username" type="string" required=true %}
Email \(or for legacy users, your username\) for remote.it
{% endapi-method-parameter %}
{% endapi-method-body-parameters %}
{% endapi-method-request %}

{% api-method-response %}
{% api-method-response-example httpCode=200 %}
{% api-method-response-example-description %}
User successfully logged in. The below "token" is used in any authenticated API calls.
{% endapi-method-response-example-description %}

```javascript
{
    "status": "true",
    "token": "a1327b84435481d9048504f0e924f431",
    "email": "someuser@remote.it",
    "service_authhash": "E1F1772EA75D04755B8BBD236C470550E7A9FB33"
}
```
{% endapi-method-response-example %}
{% endapi-method-response %}
{% endapi-method-spec %}
{% endapi-method %}



