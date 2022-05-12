# Devices and Services

## Remote.it Insomnia Collection

We have developed an example set of GraphQL queries and mutations in a collection that you can import directly into insomnia to get started. You will still need to install the authentication plug-in [here](../using-developer-tools.md#add-the-plugin-to-insomnia) and create your access keys in your account before getting started.

```
$ git clone https://github.com/remoteit/code_samples.git
```

## Application Types

Application types are service type definitions which are used as parameters for Get Devices By An Attribute and in services. In the case of services only the ID is returned so you will reference this response.

```graphql
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

| Attributes  | Data Type | Description                                                                                                                                        |
| ----------- | --------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| ID          | Int       | The primary key of the application type used in queries such as [Get Devices By An Attribute](devices-and-services.md#get-devices-by-an-attribute) |
| name        | String    | The given short name for an application type. This is unique                                                                                       |
| description | String    | Further explanation of the application type                                                                                                        |
| port        | Int       | The default port for the application type. This can be overridden on a service by service basis                                                    |
| protocol    | String    | The protocol used when creating a connection to this application type                                                                              |
| proxy       | Boolean   | Whether the application type will use a reverse proxy when creating a proxy connection.                                                            |

## Get Your Devices

In this example we will be fetching your devices using graphQL. If you wish to get devices which meet a certain criteria like inactive devices, use the [Attribute Query](devices-and-services.md#get-devices-by-an-attribute). Devices uses [pagination](./#pagination) for the result set. Please refer to the [pagination explanation](./#pagination) for more on working with these results.

{% hint style="info" %}
This example only shows some of the variables and available attributes for the device and service collections.
{% endhint %}

```graphql
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

| Parameter   | Data Type | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| ----------- | --------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| application | Int       | <p>ID of the application type (service type). Using this parameter will return devices which have services of a given type and if the services are returned in the query will only include the services of this type. For example, if you request an application type id which is mapped to SSH and include the services, only services of type of SSH will be returned in the services array even when there are other services defined on the device.</p><p>To get available service types, please see <a href="devices-and-services.md#application-types">Application Types</a></p> |
| hardwareid  | String    | The hardware ID associated with the device.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| name        | String    | String which is present in the name of the device and is not case sensitive.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| platform    | \[Int]    | Array of platform IDs                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| state       | String    | accepted values "active" and "inactive"                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |

Additional attributes will become available over time. Please refer to the schema documentation for the extensive list.

{% hint style="info" %}
This example only shows some of the variables and available attributes for the device and service collections.
{% endhint %}

```graphql
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

Only the owner of the device **or an admin on the organization owning the device** can update the name of the device or service.

| Parameters | Data Type | Description                                              |
| ---------- | --------- | -------------------------------------------------------- |
| serviceId  | String    | This is the device Id or service Id that will be updated |
| name       | String    | The new name of the device or service                    |

```graphql
mutation {
  renameService(
    serviceId: "80:00:00:01:23:45:67:89",
    name: "New Name"
  )
}
```

Query Response

```graphql
{
  "data": {
    "renameService": true
  }
}
```

## Delete Device

Only the owner of the device **or an admin on the organization owning the device** can delete a device. Devices can only be deleted when the state is `inactive`.

```graphql
mutation {
  deleteDevice(
    deviceId: "80:00:00:98:01:23:45:67"
  )
}
```

Query Response

```graphql
{
  "data": {
    "deleteDevice": true
  }
}
```

## Remove a Service

Only the owner of the device **or an admin on the organization owning the device** can remove a service from a device.&#x20;

{% hint style="danger" %}
Services will be removed even if active and in use&#x20;
{% endhint %}

```graphql
mutation {
  removeService(
    id:"80:00:00:98:01:23:45:67"
    )
}
```

Query Response

```graphql
{
  "data": {
    "removeService": true
  }
}
```

&#x20;
