# Connecting to a Service using the API

{% api-method method="post" host="https://api.remot3.it" path="/apv/v27/device/connect" %}
{% api-method-summary %}
Connect to a device
{% endapi-method-summary %}

{% api-method-description %}
Create a connection to a device.  Please note that the term "device" in this context is a legacy reference.  In all other contexts on this web site, a "device" is called a "Service".
{% endapi-method-description %}

{% api-method-spec %}
{% api-method-request %}
{% api-method-headers %}
{% api-method-parameter name="auth" type="string" required=false %}
See authentication section for the auth headers required.
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
Controls the connection mode.  See description below.
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
        "deviceaddress": "80:00:00:00:00:00:00:91",
        "expirationsec": "28797",
        "proxy": "https://xppoobalo.p18.rt3.io"
        "connectionid":"A78B3919-52E1-B674-58CC-5C0009377419"
    },
    "status": "true"
}
```
{% endapi-method-response-example %}
{% endapi-method-response %}
{% endapi-method-spec %}
{% endapi-method %}

{% hint style="info" %}
For http and https remote.it Services, the returned value for "proxy" will be a single string similar to the following.  It does not need an explicit port value to be used.  These are "reverse proxies".   Reverse proxies are always public, which is why the randomized URL is generated at the time of creating the connection.

```text
"proxy": "https://xprbjalo.p18.rt3.io"
```

For all other types of remote.it Services, the returned value for "proxy" will include a hostname and a port value separated by a colon, as shown below.  These are "port proxies".

```text
"proxy": "http:\/\/proxy18.rt3.io:38575"
```
{% endhint %}

### Connection modes

The following options apply only to "port proxies", namely all Service types except the **http** and **https** Service types, which use "reverse proxies".  Reverse proxies are always public which is why the randomized URL is created.

#### Public

By setting the "hostip" parameter to 0.0.0.0, anyone who has the connection URL and port can connect to it until the connection expires or is closed using the API described at [Terminating a proxy connection to a device](device-connect-stop.md).  If you use the Public connection mode, make sure that your resources are properly password protected.

#### IP Restricted

By setting the "hostip" parameter to the client's public IP address, IP restriction is enabled.  Only connections coming from that public IP address will be allowed.  Any other incoming connection will be blocked.

#### IP Latching

By setting the "hostip" parameter to 255.255.255.255, whoever uses the connection URL and port first will "latch" the connection, blocking all other connection attempts regardless of where they originated.

{% hint style="info" %}
The value returned for "connectionid" can be used with the [/device/connect/stop](device-connect-stop.md#terminate-a-proxy-connection-to-a-device) API endpoint to terminate the proxy connection to your target when you are done using it.
{% endhint %}

{% hint style="info" %}
**Note**  
Some response values are omitted from the example above because they are only used in very specific circumstances.
{% endhint %}

## Usage Examples

{% tabs %}
{% tab title="cURL" %}
```bash
#!/bin/sh

#!/bin/bash

KEY_ALIAS="ACCESS_KEY"
SECRET_BASE64="ACCESS_SECRET"
SECRET=`echo ${SECRET_BASE64} | base64 --decode`
DEVELOPER_KEY="DEVELOPER_KEY"

HOST="api.remot3.it"
URL_PATH="device/connect"
URL="https://{$HOST}/{$URL_PATH}"

CONTENT_TYPE="application/json"

DATE=$(LANG=en_US date "+%a, %d %b %Y %H:%M:%S %Z")

CONTENT_LENGTH=${#DATA}

SIGNING_STRING="(request-target): ${LC_VERB} /${URL_PATH}
host: ${HOST}
date: ${DATE}
content-type: ${CONTENT_TYPE}
content-length: ${CONTENT_LENGTH}"

echo ${SIGNING_STRING}

SIGNATURE=`echo -n "${SIGNING_STRING}" | openssl dgst -binary -sha256 -hmac "${SECRET}" | base64`

SIGNATURE_HEADER="Signature keyId=\"${KEY_ALIAS}\",algorithm=\"hmac-sha256\",headers=\"(request-target) host date content-type content-length\",signature=\"${SIGNATURE}\""

DEVICE_ADDRESS="your_service_id"
HOSTIP="your_public_ip"

curl -v -X POST \
 -H "Authorization:${SIGNATURE_HEADER}" \
 -H "DeveloperKey:${DEVELOPER_KEY}" \
 -H "Date:${DATE}" \
 -H "Content-Type:${CONTENT_TYPE}" ${URL} --insecure
 -d "{\"wait\":\"true\",\"deviceaddress\":\"$DEVICE_ADDRESS\", \
          \"hostip\":\"$HOSTIP\" }" \

```
{% endtab %}

{% tab title="Node \(JavaScript\)" %}
```javascript
const axios = require("axios");

const deviceaddress = process.env.REMOTEIT_DEVICE_ADDRESS;
const hostip = process.env.MY_PUBLIC_IP;
const wait = "true";

axios
  .post(
    "https://api.remot3.it/apv/v27/device/connect",
    { 
      deviceaddress,
      wait,
      hostip
    },
    {
      headers: {
        # to be updated.
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
import binascii
import os

import requests
from requests_http_signature import HTTPSignatureAuth

key_id = os.environ.get('R3_ACCESS_KEY_ID')
key = os.environ.get('R3_SECRET_ACCESS_KEY')
DEVICE_ADDRESS="80:00:00:3F:AE:00:00:11" #update to the correct service ID

DATA={"wait":"true","deviceaddress":"$DEVICE_ADDRESS", "hostip": os.environ["MY_PUBLIC_IP"] }

response = requests.post('https://api.remot3.it/apv/v27/device/connect', data=json.dumps(DATA), auth=HTTPSignatureAuth(key=binascii.a2b_base64(key), key_id=key_id))

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
            # to be updated to auth method.
            requestData.Headers.Add("developerkey", Environment.GetEnvironmentVariable("REMOTEIT_DEVELOPER_KEY"));
            requestData.Headers.Add("token", Environment.GetEnvironmentVariable("REMOTEIT_TOKEN"));

            Dictionary<string, string> bodyData = new Dictionary<string, string>() {
                {
                    "deviceaddress", Environment.GetEnvironmentVariable("REMOTEIT_DEVICE_ADDRESS"),
                    "wait", "true",
                    "hostip", Environment.GetEnvironmentVariable["MY_PUBLIC_IP"] 
                }
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
        "wait" => true,
        "hostip" => $_ENV["MY_PUBLIC_IP"]
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

