# Listing Devices

{% hint style="info" %}
**Note**  
It is highly recommended that you use the graphQL API for fetching the device list. Only use this API if you have 100 devices or less. 
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
{% api-method-parameter name="auth" type="string" required=true %}
HTTP request signature. See https://docs.remote.it/api-reference/authentication for more information about authentication.
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
            "deviceaddress": "80:00:00:80:01:00:01:25",
            "devicealias": "Demo_Router_Web_Port_80",
            "devicelastip": "126.237.116.49",
            "devicestate": "active",
            "devicetype": "00:1E:00:00:00:01:00:00:04:60:00:50:00:01:00:00",
            "georegion": "Asia"
            "lastcontacted": "2018-12-29T14:56:50-05:00"
            "lastinternalip": "10.61.12.80"
            "ownerusername": "joeh@remot3.it"
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

## Usage Examples

{% tabs %}
{% tab title="cURL" %}
```bash
import binascii
import os

import requests
from requests_http_signature import HTTPSignatureAuth

# For more on authentication see https://docs.remote.it/api-reference/authentication
key_id = os.environ.get('R3_ACCESS_KEY_ID')
key = os.environ.get('R3_SECRET_ACCESS_KEY')

response = requests.get('https://api.remot3.it/apv/v27/device/list/all', auth=HTTPSignatureAuth(key=binascii.a2b_base64(key), key_id=key_id))

if response.status_code == 200:
    print(response.text)
else:
    print(response.status_code)
```
{% endtab %}

{% tab title="Node \(Javascript\)" %}
```javascript
# This example uses the npm modules axios and axios-adapter-hmac

const axios = require("axios");
const hmacAdapter = require("axios-adapter-hmac");
 
# To be replaced by http request signature example
# For more on authentication see https://docs.remote.it/api-reference/authentication
const auth = XXX


axios
  .get("https://api.remot3.it/apv/v27/device/list/all", {
    headers: {
      #to finish
      auth
    }
  })
  .then(response => {
    console.log("Status Code:", response.status);
    console.log("Body:", response.data);
  })
  .catch(error => {
    console.log(error);
  });
```
{% endtab %}

{% tab title="Python" %}
```python
import binascii
import os

import requests
from requests_http_signature import HTTPSignatureAuth

# For more on authentication see https://docs.remote.it/api-reference/authentication
key_id = os.environ.get('R3_ACCESS_KEY_ID')
key = os.environ.get('R3_SECRET_ACCESS_KEY')

response = requests.get('https://api.remot3.it/apv/v27/device/list/all', auth=HTTPSignatureAuth(key=binascii.a2b_base64(key), key_id=key_id))

if response.status_code == 200:
    print(response.text)
else:
    print(response.status_code)
```
{% endtab %}

{% tab title="C\#" %}
```csharp
using System;
using System.Net.Http;

namespace remote.it_api_example
{
    class Program
    {
        static void Main(string[] args)
        {
            string jsonString = "";
            string url = "https://api.remot3.it/apv/v27/device/list/all";

            HttpClient client = new HttpClient();
            HttpRequestMessage requestData = new HttpRequestMessage();            

            //  Configure the HTTP requests's url, headers, and body
            requestData.Method = HttpMethod.Get;
            requestData.RequestUri = new Uri(url);

            # To be replaced by http request signature example
            # For more on authentication see https://docs.remote.it/api-reference/authentication

            # requestData.Headers.Add("developerkey", Environment.GetEnvironmentVariable("REMOTEIT_DEVELOPER_KEY"));
            # requestData.Headers.Add("token", Environment.GetEnvironmentVariable("REMOTEIT_TOKEN"));            

            try
            {
                // Send the HTTP request and run the inner block upon recieveing a response
                var response = client.SendAsync(requestData).ContinueWith((taskMessage) =>
                {
                    var result = taskMessage.Result;
                    var jsonTask = result.Content.ReadAsStringAsync();
                    jsonTask.Wait();

                    // Store the body of API response
                    jsonString = jsonTask.Result;
                });
                response.Wait();
            }
            catch (HttpRequestException e)
            {
                // Triggered when the API returns a non-200 response code
                jsonString = e.Message;
            }

            // Print JSON response from API
            Console.WriteLine(jsonString);
        }
    }
}
```
{% endtab %}

{% tab title="PHP" %}
```php

<?php

$access_key = getenv ( string 'R3_ACCESS_KEY_ID') 
$access_secret = getenv ( string 'R3_SECRET_ACCESS_KEY') 
$hash = hash_hmac('sha256', $access_key, $access_secret);

$ch = curl_init();
curl_setopt_array($ch, array(
    CURLOPT_URL => "https://api.remot3.it/apv/v27/device/list/all",
    CURLOPT_HTTPHEADER => array(
       auth: keyId="abc123",algorithm="hmac-sha256",headers="(request-target) date",signature="base64string"
    ),
    CURLOPT_RETURNTRANSFER => true
));
$response = curl_exec($ch);
$statusCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);

print("Status Code: ".$statusCode."\n");
$responseData = json_decode($response);
print_r($responseData);

?>
```
{% endtab %}
{% endtabs %}

### 

### Device Find By Name

Find a Service by name

{% api-method method="post" host="https:api.remot3.it/apv/v27" path="/device/find/by/name/" %}
{% api-method-summary %}

{% endapi-method-summary %}

{% api-method-description %}

{% endapi-method-description %}

{% api-method-spec %}
{% api-method-request %}
{% api-method-headers %}
{% api-method-parameter name="Auth" type="string" required=true %}

{% endapi-method-parameter %}
{% endapi-method-headers %}
{% endapi-method-request %}

{% api-method-response %}
{% api-method-response-example httpCode=200 %}
{% api-method-response-example-description %}

{% endapi-method-response-example-description %}

```
{
    "devices": [
        {
            "createdate": "2018-03-29T04:19:02.19-04:00",
            "deviceaddress": "80:00:00:80:01:00:01:25",
            "devicealias": "Demo_Router_Web_Port_80",
            "devicelastip": "126.237.116.49",
            "devicestate": "active",
            "devicetype": "00:1E:00:00:00:01:00:00:04:60:00:50:00:01:00:00",
            "georegion": "Asia"
            "lastcontacted": "2018-12-29T14:56:50-05:00"
            "lastinternalip": "10.61.12.80"
            "ownerusername": "joeh@remot3.it"
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

