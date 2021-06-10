# Terminating a proxy connection to a device

{% api-method method="post" host="https://api.remote.it" path="/apv/v27/device/connect/stop" %}
{% api-method-summary %}
Terminate a proxy connection to a device
{% endapi-method-summary %}

{% api-method-description %}
Terminate a proxy connection to a device \(one created by /device/connect\)
{% endapi-method-description %}

{% api-method-spec %}
{% api-method-request %}
{% api-method-headers %}
{% api-method-parameter name="developerkey" type="string" required=true %}
Your developer key which can be found by logging into remote.it and going to your "Account" settings page.
{% endapi-method-parameter %}

{% api-method-parameter name="token" type="string" required=true %}
Your session token, created by logging in using the API.
{% endapi-method-parameter %}
{% endapi-method-headers %}

{% api-method-body-parameters %}
{% api-method-parameter name="deviceaddress" type="string" required=true %}
The service address \(e.g. service ID\) for the device you connected to, but now you want to terminate the proxy for that connection.
{% endapi-method-parameter %}

{% api-method-parameter name="connectionid" type="string" required=true %}
The connection ID returned from the /device/connect API call
{% endapi-method-parameter %}
{% endapi-method-body-parameters %}
{% endapi-method-request %}

{% api-method-response %}
{% api-method-response-example httpCode=200 %}
{% api-method-response-example-description %}
Connection with device successfully stopped.
{% endapi-method-response-example-description %}

```javascript
{
    "status": "true",
    "connectionid":"A481EBED-C678-4DA4-60D2-60F1FE8EB5DA"
}
```
{% endapi-method-response-example %}

{% api-method-response-example httpCode=401 %}
{% api-method-response-example-description %}
One or more of:  
a\) developerkey failed validation   
b\) connectionid incorrect or missing  
c\) deviceaddress incorrect or missing  
{% endapi-method-response-example-description %}

```
{
    "status": "false",
    "reason":"<error message>"
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
#!/bin/sh

TOKEN="your_login_token"
DEV_KEY="your_developer_key"
DEVICE_ADDRESS="your_device_address"
CONNECTION_ID="your_connection_id"

curl -X POST \
     -H "token:$TOKEN" \
     -H "developerkey:$DEV_KEY" \
     -d "{\"connectionid\":\"$CONNECTION_ID\", \
          \"deviceaddress\":\"$DEVICE_ADDRESS\" }" \
     https://api.remot3.it/apv/v27/device/connect/stop
```
{% endtab %}

{% tab title="Node \(JavaScript\)" %}
```javascript
const axios = require("axios");

const developerkey = process.env.REMOTEIT_DEVELOPER_KEY;
const token = process.env.REMOTEIT_TOKEN;
const deviceaddress = process.env.REMOTEIT_DEVICE_ADDRESS;
const connectionid = process.env.REMOTEIT_CONNECTION_ID;

axios
  .post(
    "https://api.remot3.it/apv/v27/device/connect/stop",
    { deviceaddress,
      connectionid 
    },
    {
      headers: {
        developerkey,
        token
      }
    }
  )
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
import requests
import json
import os

headers = {
    "developerkey": os.environ["REMOTEIT_DEVELOPER_KEY"],
    # Created using the login API
    "token": os.environ["REMOTEIT_TOKEN"]
}
body = {
    "deviceaddress": "your_device_address",
    "connectionid": "your_connection_id"
}

url = "https://api.remot3.it/apv/v27/device/connect/stop"

response = requests.post(url, data=json.dumps(body), headers=headers)
response_body = response.json()

print("Status Code: %s" % response.status_code)
print("Raw Response: %s" % response.raw)
print("Body: %s" % response_body)
```
{% endtab %}

{% tab title="C\#" %}
```csharp
using System;
using System.Net.Http;
using Newtonsoft.Json;
using System.Collections.Generic;

namespace remote.it_api_example
{
    class Program
    {
        static void Main(string[] args)
        {
            string jsonString = "";
            string url = "https://api.remot3.it/apv/v27/device/connect/stop";

            HttpClient client = new HttpClient();
            HttpRequestMessage requestData = new HttpRequestMessage();            

            //  Configure the HTTP requests's url, headers, and body
            requestData.Method = HttpMethod.Post;
            requestData.RequestUri = new Uri(url);
            requestData.Headers.Add("developerkey", Environment.GetEnvironmentVariable("REMOTEIT_DEVELOPER_KEY"));
            requestData.Headers.Add("token", Environment.GetEnvironmentVariable("REMOTEIT_TOKEN"));

            Dictionary<string, string> bodyData = new Dictionary<string, string>() {
                {"deviceaddress", Environment.GetEnvironmentVariable("REMOTEIT_DEVICE_ADDRESS") },
                {"connectionid", Environment.GetEnvironmentVariable("REMOTEIT_CONNECTION_ID") }
            };

            string jsonFormattedBody = JsonConvert.SerializeObject(bodyData);
            requestData.Content = new StringContent(jsonFormattedBody);

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

$ch = curl_init();
curl_setopt_array($ch, array(
    CURLOPT_URL => "https://api.remot3.it/apv/v27/device/connect/stop",
    CURLOPT_HTTPHEADER => array(
        "developerkey: ".$_ENV["REMOTEIT_DEVELOPER_KEY"],
        "token: ".$_ENV["REMOTEIT_TOKEN"] // Created using the login API
    ),
    CURLOPT_POSTFIELDS => json_encode(array(
        "deviceaddress" => $_ENV["REMOTEIT_DEVICE_ADDRESS"],
        "connectionid" => $_ENV["REMOTEIT_CONNECTION_ID"]
    )),
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

