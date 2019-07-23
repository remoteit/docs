# Connecting to a Device

{% api-method method="post" host="https://api.remot3.it" path="/apv/v27/device/connect" %}
{% api-method-summary %}
Connect to a device
{% endapi-method-summary %}

{% api-method-description %}
Create a connection to a device.
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
The service address \(e.g. service ID\) for the device you'd like to connect to
{% endapi-method-parameter %}

{% api-method-parameter name="wait" type="boolean" required=true %}
Whether to wait for the connection or not. Should be set to "true"
{% endapi-method-parameter %}

{% api-method-parameter name="hostip" type="string" required=true %}
The clients public IP address, which is used to enforce "IP restriction" upon making the connection. Defaults to the IP address of the the API caller if not provided. Pass "0.0.0.0" if you want any IP address to connect \(warning: this is potentially insecure if your resource is not itself secured properly!\)
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

## Usage Examples

{% tabs %}
{% tab title="cURL" %}
```bash
curl -X POST \
     -H "token:$REMOTEIT_TOKEN" \
     -H "developerkey:$REMOTEIT_DEVELOPER_KEY" \
     -d '{"wait":"true","deviceaddress":"'$REMOTEIT_DEVICE_ADDRESS'"}' \
     https://api.remot3.it/apv/v27/device/connect
```
{% endtab %}

{% tab title="Node \(JavaScript\)" %}
```javascript
const axios = require("axios");

const developerkey = process.env.REMOTEIT_DEVELOPER_KEY;
const token = process.env.REMOTEIT_TOKEN;
const deviceaddress = process.env.REMOTEIT_DEVICE_ADDRESS;

axios
  .post(
    "https://api.remot3.it/apv/v27/device/connect",
    { deviceaddress },
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
    "deviceaddress": "80:00:00:3F:AE:00:00:11"
}

url = "https://api.remot3.it/apv/v27/device/connect"

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
            string url = "https://api.remot3.it/apv/v27/device/connect";

            HttpClient client = new HttpClient();
            HttpRequestMessage requestData = new HttpRequestMessage();            

            //  Configure the HTTP requests's url, headers, and body
            requestData.Method = HttpMethod.Post;
            requestData.RequestUri = new Uri(url);
            requestData.Headers.Add("developerkey", Environment.GetEnvironmentVariable("REMOTEIT_DEVELOPER_KEY"));
            requestData.Headers.Add("token", Environment.GetEnvironmentVariable("REMOTEIT_TOKEN"));

            Dictionary<string, string> bodyData = new Dictionary<string, string>() {
                {"deviceaddress", Environment.GetEnvironmentVariable("REMOTEIT_DEVICE_ADDRESS") }
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
    CURLOPT_URL => "https://api.remot3.it/apv/v27/device/connect",
    CURLOPT_HTTPHEADER => array(
        "developerkey: ".$_ENV["REMOTEIT_DEVELOPER_KEY"],
        "token: ".$_ENV["REMOTEIT_TOKEN"] // Created using the login API
    ),
    CURLOPT_POSTFIELDS => json_encode(array(
        "deviceaddress" => $_ENV["REMOTEIT_DEVICE_ADDRESS"],
        "wait" => true
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

