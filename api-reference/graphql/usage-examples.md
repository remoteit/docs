---
description: >-
  Examples of query structure and usage including variables to allow for
  programatic queries.
---

# Usage Examples

## Queries

All queries will be in context of your user and are just the query examples which you can use in your graphQL IDE and to build the structure of the query programatically. For code examples see earlier sections. The examples below name the query and adds the variables. You will need to include the variable section to execute the query successfully. 

### Get Your Devices

Fetch your inactive devices. 

{% hint style="info" %}
This example only shows some of the variables and available attributes of the device and service collections.
{% endhint %}

```
#Query

query getDevices($size: Int, $from: Int, $sort: String, $state: String) {
  login {
    devices(size: $size, from: $from, state: $state, sort: $sort) {
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
  "state": "inactive",
  "sort": 'name',
}
```

Once you get the results, if the hasMore response returns true you know to do another fetch and in this case the from will increment to 1001 to fetch the next set, you could also determine this by iteration until you get to the total. Size is limited to 1000 max.

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

### Find Services by Name

```bash
#Query

query getDevice($name: String) {
  login {
    devices(name: $name) {
      items {
        name
        id
      hardwareId
      }
    }
  }
}

#Variables
{
  "name": "tim"
}
```

This will return all devices with "tim" in the name and is not case sensitive. For example:

```bash
{
  "data": {
    "login": {
      "devices": {
        "items": [
          {
            "name": "Game-Timer-01",
            "id": "80:00:00:05:XX:XX:XX:XX",
            "hardwareId": "XX:XX:XX:XX:XX:XX-TVKNqPiIfao8dwK1EHyq"
          }
        ]
      }
    }
  }
}
```

## Mutations

Mutations are queries which update data.

### Update Device Sharing

```bash
# Notes:
# Action options are "ADD", "REMOVE", "LEAVE"
# Notify sends email to the emails included in the share action. Default is true
# Scripting allows the users to execute scripts on the device. Default is false. N/A if removing the share
# Omit services parameter if you want to add or remove sharing of all services belonging to the device
# If using the services parameter, any services not explicitly sent will remain unchanged i.e.if previously shared will remain shared

mutation updateSharing($action: SharingAction, $emails: [String!]!, $notify: Boolean, $scripting: Boolean, $deviceId: String!, $services:[ServiceSharingOptions!]){
  share(action: $action, email:$emails, notify: $notify, scripting: $scripting, deviceId: $deviceId, services: $services)
}


#Variables
{
  "action": "ADD",
  "emails": ["bstrech@gmail.com"],
  "notify": false,
  "scripting": true,
  "deviceId": "80:00:00:00:01:0A:FA:C6",
  "services": [
    {
    "serviceId": "80:00:00:00:01:0A:FA:C7",
  	"action": "ADD"
    }
  ]
}
```

Response

```bash
#failure will return false
{
  "data": {
    "share": true
  }
}
```

