---
description: >-
  Examples of query structure and usage including variables to allow for
  programatic queries.
---

# Usage Examples

## Queries

All queries will be in context of the user associated with the access key and secret. These are query examples which you can use in your graphQL IDE and to build the structure of the query programatically. For code examples see earlier sections. The examples below name the query and adds the variables. You will need to include the variable section or put the values inline to execute the query successfully. 

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

### Get Event Logs

This request will fetch connection logs for all of your devices in a csv format. You can also request other logs of DEVICE\_STATE \(device online/offline activity\) and DEVICE\_SHARE \(device sharing activity\). The url will expire in 1 hour. Max 10000 lines or 28 seconds of execution. Min and max dates should not exceed 1 month.

```bash
{
  login {
    eventsUrl(minDate: "2021-06-01", maxDate: "2021-07-01", types: DEVICE_CONNECT)
  }
}
```

Response Example

```bash
{
  "data": {
    "login": {
      "eventsUrl": "https://api.remote.it/graphql/v1/files/e60xxxx-8a71-4870-bxxf-xxxdd2021f7.csv"
    }
  }
}
```

### Get Event Logs for a Specific Device

This request will fetch connection logs for a specific device in a csv format. You can also request other logs of DEVICE\_STATE \(device online/offline activity\) and DEVICE\_SHARE \(device sharing activity\). 

```bash
{
  login {
    device(id: "80:00:01:f2:7E:XX:00:7B") {
      eventsUrl(minDate: "2021-06-01", maxDate: "2021-07-01", types: DEVICE_CONNECT)
    }
  }
}
```

Response Example

```bash
{
  "data": {
    "login": {
      "device": [
        {
          "eventsUrl": "https://api.remote.it/graphql/v1/files/af7xxx-82x7-464c-xxxc-132xxxx.csv"
        }
      ]
    }
  }
}
```

### Event Log CSV File

| Field | Description |
| :--- | :--- |
| id | Event ID |
| timestamp | DateTime of the Event in ISO 8601 format Date String |
| type | Event Type |
| actor | The email address user that performed the action if appropriate |
| devices | List of devices referenced by this event |
| owner | Email of the owner of the device |

Each event type also has additional attributes

#### DEVICE\_STATE



## Mutations

Mutations are queries which update data. All mutations are in context of the user associated with the access key and secret being used.

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
  "emails": ["apisample@remote.it"],
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

