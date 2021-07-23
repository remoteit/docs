# Devices and Services

## Application Types

Application types are service type definitions which are used as parameters for Get Devices By An Attribute and in services. In the case of services only the ID is returned so you will reference this response.

```javascript
query {
  applicationTypes {
   id
   name
   description
   port
   protocol
   proxy
  }
}
```

Response Example

```bash
{
  "data": {
    "applicationTypes": [
      {
        "id": 1,
        "name": "TCP",
        "description": "Generic TCP",
        "port": null,
        "protocol": "TCP",
        "proxy": false
      },
      {
        "id": 4,
        "name": "VNC",
        "description": "VNC remote desktop",
        "port": 5900,
        "protocol": "TCP",
        "proxy": false
      },
      ...
    ]
  }
}      
```

| Attributes | Data Type | Description |
| :--- | :--- | :--- |
| ID | Int | The primary key of the application type used in queries such as [Get Devices By An Attribute](devices-and-services.md#get-devices-by-an-attribute) |
| name | String | The given short name for an application type. This is unique |
| description | String | Further explanation of the application type |
| port | Int | The default port for the application type. This can be overridden on a service by service basis |
| protocol | String | The protocol used when creating a connection to this application type |
| proxy | Boolean | Whether the application type will use a reverse proxy when creating a proxy connection. |

## Get Your Devices

In this example we will be fetching your devices using graphQL. If you wish to get devices which meet a certain criteria like inactive devices, use the [Attribute Query](devices-and-services.md#get-devices-by-an-attribute). Devices uses [pagination](./#pagination) for the result set. Please refer to the [pagination explanation](./#pagination) for more on working with these results.

{% hint style="info" %}
This example only shows some of the variables and available attributes for the device and service collections.
{% endhint %}

```
#Query

query getDevices($size: Int, $from: Int, $sort: String) {
  login {
    devices(size: $size, from: $from, sort: $sort) {
      total
      hasMore
      items {
        id
        name
        hardwareId
        created
        services {
          id
          name
        }
      }
    }
  }
}

#Variables
{
  "size": 1000,
  "from": 0,
  "sort": 'name',
}
```

Response Example

```bash
{
  "data": {
    "login": {
      "devices": {
        "total": 1200,
        "hasMore": true,
        "items": [
          {
            "id": "8X:XX:XX:00:29:01:8e:ed",
            "name": "bento",
            "hardwareId": "dc:a6:32:19:8b:a3-xWoYf46uJ6QdtPXTloLb",
            "created": "2019-12-20T22:13:46.000Z",
            "services": [
              {
                "id": "8X:XX:XX:00:29:01:8e:ed",
                "name": "ssh service"
              }
            ]
          },
        ...
        ]
      }
    }
  }
}    
```

## Get Devices By An Attribute

In this example we will be fetching all devices with "tim" in the name using graphQL. This will return all devices with "tim" in the name and is not case sensitive. You can use any number of combinations of available attributes to narrow your result set further.

Other available parameters available:

<table>
  <thead>
    <tr>
      <th style="text-align:left">Parameter</th>
      <th style="text-align:left">Data Type</th>
      <th style="text-align:left">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">application</td>
      <td style="text-align:left">Int</td>
      <td style="text-align:left">
        <p>ID of the application type (service type). Using this parameter will return
          devices which have services of a given type and if the services are returned
          in the query will only include the services of this type. For example,
          if you request an application type id which is mapped to SSH and include
          the services, only services of type of SSH will be returned in the services
          array even when there are other services defined on the device.</p>
        <p>To get available service types, please see <a href="devices-and-services.md#application-types">Application Types</a>
        </p>
      </td>
    </tr>
    <tr>
      <td style="text-align:left">hardwareid</td>
      <td style="text-align:left">String</td>
      <td style="text-align:left">The hardware ID associated with the device.</td>
    </tr>
    <tr>
      <td style="text-align:left">name</td>
      <td style="text-align:left">String</td>
      <td style="text-align:left">String which is present in the name of the device and is not case sensitive.</td>
    </tr>
    <tr>
      <td style="text-align:left">platform</td>
      <td style="text-align:left">[Int]</td>
      <td style="text-align:left">Array of platform IDs</td>
    </tr>
    <tr>
      <td style="text-align:left">state</td>
      <td style="text-align:left">String</td>
      <td style="text-align:left">accepted values &quot;active&quot; and &quot;inactive&quot;</td>
    </tr>
  </tbody>
</table>

Additional attributes will become available over time. Please refer to the schema documentation for the extensive list.

{% hint style="info" %}
This example only shows some of the variables and available attributes for the device and service collections.
{% endhint %}

```
#Query

query getDevices($size: Int, $from: Int, $sort: String, $state: String, $name: String) {
  login {
    devices(size: $size, from: $from, sort: $sort, state: $state, name: $name) {
      total
      hasMore
      items {
        id
        name
        hardwareId
        created
        services {
          id
          name
        }
      }
    }
  }
}

#Variables
{
  "size": 1000,
  "from": 0,
  "sort": 'name',
  "state": "inactive",
  "name": "tim"
}
```

Once you get the results, if the hasMore response returns true you know to do another fetch and in this case the from will increment to 1001 to fetch the next set, you could also determine this by iteration until you get to the total. Size is limited to 1000 max in each return.

Response Example

```bash
{
  "data": {
    "login": {
      "devices": {
        "total": 1200,
        "hasMore": true,
        "items": [
          {
            "id": "8X:XX:XX:00:29:01:8e:ed",
            "name": "Bento Time Machine",
            "hardwareId": "dc:a6:32:19:8b:a3-xWoYf46uJ6QdtPXTloLb",
            "created": "2019-12-20T22:13:46.000Z",
            "services": [
              {
                "id": "8X:XX:XX:00:29:01:8e:ed",
                "name": "ssh service"
              }
            ]
          },
        ...
        ]
      }
    }
  }
}    
```

## Update a Device/Service Name

You can update a device or service name by using a REST-API request. You may need to fetch your device list to get the ID of the service you wish to modify. When you want to update a device name, update using the device ID. 

{% api-method method="post" host="" path="/apv/v27/device/name" %}
{% api-method-summary %}
Update Service Name
{% endapi-method-summary %}

{% api-method-description %}
You can update a device or service name by using a REST-API request. You may need to fetch your device list to get the ID of the service you wish to modify. When you want to update a device name, update it using the device ID for the service ID. The body parameters are a JSON string.
{% endapi-method-description %}

{% api-method-spec %}
{% api-method-request %}
{% api-method-headers %}
{% api-method-parameter name="auth" type="string" required=true %}

{% endapi-method-parameter %}
{% endapi-method-headers %}

{% api-method-body-parameters %}
{% api-method-parameter name="devicealias" type="string" required=false %}
The new name.
{% endapi-method-parameter %}

{% api-method-parameter name="deviceaddress" type="string" required=false %}
The service ID to be changed. In the case of a device name, use the device ID returned from get devices
{% endapi-method-parameter %}
{% endapi-method-body-parameters %}
{% endapi-method-request %}

{% api-method-response %}
{% api-method-response-example httpCode=200 %}
{% api-method-response-example-description %}
If the request is successful, then it will respond with "status"="true". If there was failure outside of authorization or bad request, then the response will still have a status code of 200 but the "status" would be "false" in the response body.
{% endapi-method-response-example-description %}

```
{
  "status": "true"
}
```
{% endapi-method-response-example %}

{% api-method-response-example httpCode=400 %}
{% api-method-response-example-description %}
Post data is not correct. Either missing the required deviceaddress or devicealias parameters OR an invalid deviceaddress was provided
{% endapi-method-response-example-description %}

```
{
"status": "false"
}
```
{% endapi-method-response-example %}
{% endapi-method-response %}
{% endapi-method-spec %}
{% endapi-method %}

