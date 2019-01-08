# Authentication

{% api-method method="post" host="https://api.remot3.it" path="/apv/v27/user/login" %}
{% api-method-summary %}
Login
{% endapi-method-summary %}

{% api-method-description %}
This endpoint allows you to login to your remote.it account and get a authentication token which is required for all other authenticated APIs. You can get your developer key here.
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

You can get your [developer key here](https://app.remote.it/account.html).

## Usage Examples

{% tabs %}
{% tab title="Python" %}
```python
import requests
import json
import os

headers = {
    "developerkey": os.environ["REMOTEIT_DEVELOPER_KEY"]
}
body = {
    "password": os.environ["REMOTEIT_PASSWORD"],
    "username": os.environ["REMOTEIT_USERNAME"]
}

url = "https://api.remot3.it/apv/v27/user/login"

response = requests.post(url, data=json.dumps(body), headers=headers)
response_body = response.json()

print("Status Code: %s" % response.status_code)
print("Raw Response: %s" % response.raw)
print("Body: %s" % response_body)
```

Save this to a file \(say `remoteit-login.py`\), then run the following:

```bash
export REMOTEIT_DEVELOPER_KEY="...your developer key..."
export REMOTEIT_USERNAME="...your remote.it username..."
export REMOTEIT_PASSWORD="...your remote.it password..."

python remoteit-login.py
```

Note: Make sure to put your developer key, remote.it username and password above.
{% endtab %}

{% tab title="Node" %}
This example uses the awesome [Axios](https://github.com/axios/axios) request library. To install, run `npm install axios`.

```javascript
const axios = require("axios");

const developerkey = process.env.REMOTEIT_DEVELOPER_KEY;
const username = process.env.REMOTEIT_USERNAME;
const password = process.env.REMOTEIT_PASSWORD;

axios
  .post(
    "https://api.remot3.it/apv/v27/user/login",
    { username, password },
    { headers: { developerkey } }
  )
  .then(response => {
    console.log("Status Code:", response.status);
    console.log("Body:", response.data);
  })
  .catch(error => {
    console.log(error);
  });
```

Save this to a file \(say `remoteit-login.js`\), then run the following:

```bash
export REMOTEIT_DEVELOPER_KEY="...your developer key..."
export REMOTEIT_USERNAME="...your remote.it username..."
export REMOTEIT_PASSWORD="...your remote.it password..."

node remoteit-login.js
```

Note: Make sure to put your developer key, remote.it username and password above.
{% endtab %}
{% endtabs %}

