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

## Usage Examples

{% tabs %}
{% tab title="Python" %}
```python
import requests
import os

headers = {
    "developerkey": os.environ["REMOTEIT_DEVELOPER_KEY"],
    "token": os.environ["REMOTEIT_TOKEN"]
}

url = "https://api.remot3.it/apv/v27/device/list/all"

response = requests.get(url, headers=headers)
response_body = response.json()

print("Status Code: %s" % response.status_code)
print("Raw Response: %s" % response.raw)
print("Body: %s" % response_body)
```
{% endtab %}

{% tab title="C\#" %}
```csharp
using System;
using System.IO;
using System.Net;

namespace remote.it_api_example
{
    class Program
    {
        static void Main(string[] args)
        {     
            string url = "https://api.remot3.it/apv/v27/device/list/all";

            WebRequest request = WebRequest.Create(url);

            WebHeaderCollection headers = new WebHeaderCollection() {
                {"developerKey", Environment.GetEnvironmentVariable("REMOTEIT_DEVELOPER_KEY") },
                {"token", Environment.GetEnvironmentVariable("REMOTEIT_TOKEN") }
            };

            request.Method = "GET";
            request.Headers = headers;

            WebResponse response = request.GetResponse();        
            Stream dataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(dataStream);

            // Stores the response from the API as a string. You can use a JSON deserializer 
            // library such as the Json.NET package to cast the JSON to an abstract data type. 
            string status = ((HttpWebResponse)response).StatusDescription;
            string responseFromServer = reader.ReadToEnd();

            Console.WriteLine(status);
            Console.WriteLine(responseFromServer);
            
            // Clean up the streams and the response.  
            reader.Close();
            response.Close();
        }
    }
}
```
{% endtab %}
{% endtabs %}

