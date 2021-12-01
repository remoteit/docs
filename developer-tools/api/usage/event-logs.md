# Event Logs

## Event Log Attributes

| Attribute | Description |
| :--- | :--- |
| id | Event ID |
| timestamp | DateTime of the Event in ISO 8601 format Date String |
| type | Event Type |
| actor | User who initiated the event. This is currently only applicable for DEVICE\_SHARE and DEVICE\_CONNECT. You can get user ID and email |
| owner | User who owns the device when the event affects a device/service. You can get user ID and email |
| users | An array of users affected by the event. For example on a DEVICE\_SHARE it is the users whose access to a device/service was added or removed. On a DEVICESTATE event it is the users who were notified of the event.  |
| state | The service state \(online or offline\) |
| target | The services affected by the event. For example the services that changed state, the services that where share access was changed, or the services connected |

### Additional Attributes by Type

For each event type extends the general EventType. Please refer to the schema documentation for the available attributes.

## Event Log Parameters

Event Logs support pagination which is described [here](./#pagination). Event response are sorted chronologically descending.

Additional parameters

<table>
  <thead>
    <tr>
      <th style="text-align:left">Parameter</th>
      <th style="text-align:left">Type</th>
      <th style="text-align:left">Description</th>
      <th style="text-align:left">Default</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align:left">types</td>
      <td style="text-align:left">Array of EventTypes</td>
      <td style="text-align:left">
        <p>&quot;DEVICE_STATE&quot;, &quot;DEVICE_CONNECT&quot;, &quot;DEVICE_SHARE&quot;</p>
        <p>More types will be become available. Please refer to the schema for current
          list</p>
      </td>
      <td style="text-align:left">All</td>
    </tr>
    <tr>
      <td style="text-align:left">maxDate</td>
      <td style="text-align:left">DateTime</td>
      <td style="text-align:left">The last date you wish to be included in the result set. Accepts ISO 8601
        format Date String with or without the timestamp</td>
      <td style="text-align:left">Today with 1000 events being the max size</td>
    </tr>
    <tr>
      <td style="text-align:left">minDate</td>
      <td style="text-align:left">DateTime</td>
      <td style="text-align:left">The first date you wish to be included in the result set. Accepts ISO
        8601 format Date String with or without the timestamp</td>
      <td style="text-align:left">1 month ago with 1000 events being the max size</td>
    </tr>
  </tbody>
</table>

## Get All Event Logs

These examples will fetch 1000 connection logs for all of your devices in the last month.  See above for other event types. Min and max dates should not exceed 1 month.

### JSON 

```javascript
query getEvents($size: Int, $from: Int, $minDate: DateTime, $maxDate: DateTime, $types: [EventType!]){
  login {
    events(size: $size, from: $from, minDate: $minDate, maxDate: $maxDate, types: $types) {
      hasMore
      total
      items {
        type
        owner {
          email
        }
        actor {
          email
        }
        target {
          created
          id
          name
        }
        users {
          email
        }
        timestamp
      }    
    }
  }
}

#Variables
{
  "size": 1000,
  "from": 0,
  "minDate": "2021-06-01",
  "maxDate": "2021-07-01"
  "types": ["DEVICE_CONNECT"]
}
```

Response Example

```bash
{
  "data": {
    "login": {
      "events": {
        "hasMore": false,
        "total": 4,
        "items": [
          {
            "type": "DEVICE_CONNECT",
            "owner": {
              "email": "XXX@gmail.com"
            },
            "actor": {
              "email": "actor@remote.it"
            },
            "target": [
              {
                "created": "2021-03-24T09:56:16.873Z",
                "id": "80:XX:00:00:01:0A:FF:00",
                "name": "ssh"
              }
            ],
            "users": [],
            "timestamp": "2021-07-16T20:53:59.644Z"
          },
          {
            "type": "DEVICE_CONNECT",
            "owner": {
              "email": "owner@remote.it"
            },
            "actor": {
              "email": "actor@remote.it"
            },
            "target": [
              {
                "created": "2021-03-24T09:56:16.873Z",
                "id": "80:XX:00:00:01:0A:FF:00",
                "name": "ssh"
              }
            ],
            "users": [],
            "timestamp": "2021-07-16T20:35:06.215Z"
          },
          {
            "type": "DEVICE_CONNECT",
            "owner": {
              "email": "owner@remote.it"
            },
            "actor": {
              "email": "actor@remote.it"
            },
            "target": [
              {
                "created": "2021-03-24T09:56:16.873Z",
                "id": "80:XX:00:00:01:0A:FF:00",
                "name": "ssh"
              }
            ],
            "users": [],
            "timestamp": "2021-07-16T20:20:41.601Z"
          },
          {
            "type": "DEVICE_CONNECT",
            "owner": {
              "email": "owner@remote.it"
            },
            "actor": {
              "email": "actor@remote.it"
            },
            "target": [
              {
                "created": "2021-03-24T09:56:16.873Z",
                "id": "80:XX:00:00:01:0A:FF:00",
                "name": "ssh"
              }
            ],
            "users": [],
            "timestamp": "2021-07-16T18:56:31.453Z"
          }
        ]
      }
    }
  }
}
```

### CSV

This returns a url which you can use to download the results in a  csv format. The url will expire in 1 hour. Max 10000 lines or 28 seconds of execution. 

```bash
{
  login {
    eventsUrl(minDate: "2021-06-01", maxDate: "2021-07-01", types: ["DEVICE_CONNECT"])
  }
}
```

Response example

```bash
{
  "data": {
    "login": {
      "eventsUrl": "https://api.remote.it/graphql/v1/files/e60xxxx-8a71-4870-bxxf-xxxdd2021f7.csv"
    }
  }
}
```

## Get Event Logs for Specific Devices

This request will fetch state logs for a specified device in a csv format using graphQL. In these examples we want to get the external IP address each time it comes online to track the device location.

### JSON Result

```javascript
#query
query getEvents($deviceID: [String!]!, $minDate: DateTime, $maxDate: DateTime, $types: [EventType!]) {
  login {
    device(id: $deviceID) {
      events(minDate: $minDate, maxDate: $maxDate, types: $types) {
        hasMore
        total
        items {
          state
          timestamp
          target {
            name
            id
          }
          ... on DeviceStateEvent {
          externalAddress
          geo {
            connectionType
            isp
          }
          } 
        }
      }
    }
  }
}

#variables
{
  "deviceID": ["80:XX:00:00:01:05:82:22"],
  "minDate": "2021-06-01",
  "maxDate": "2021-07-01",
  "types": ["DEVICE_STATE"]
}
```

Response Example

```javascript
{
  "data": {
    "login": {
      "device": [
        {
          "events": {
            "hasMore": false,
            "total": 76,
            "items": [
              {
                "state": "inactive",
                "timestamp": "2021-07-17T22:16:11.921Z",
                "target": [
                  {
                    "name": "MacBook-Pro-15 - vnc",
                    "id": "80:XX:00:00:01:05:82:23"
                  }
                ],
                "externalAddress": "73.189.XX.XXX:53190",
                "geo": {
                  "connectionType": "Cable/DSL",
                  "isp": "Comcast Cable"
                }
              },
              {
                "state": "inactive",
                "timestamp": "2021-07-17T22:16:07.479Z",
                "target": [
                  {
                    "name": "New ssh",
                    "id": "80:XX:00:00:01:1A:4A:AB"
                  }
                ],
                "externalAddress": "73.189.XX.XXX:56236",
                "geo": {
                  "connectionType": "Cable/DSL",
                  "isp": "Comcast Cable"
                }
              },
              ...
            ]
          }
        }
      ]
    }
  }
}
```

### CSV Result

This request will return a url for a CSV download. The url will expire in 1 hour. Max 10000 lines or 28 seconds of execution. Min and max dates should not exceed 1 month.

```javascript
query getEventsUrl($deviceID: [String!]!, $minDate: DateTime, $maxDate: DateTime, $types: [EventType!]) {
  login {
    device(id: $deviceID) {
      eventsUrl(minDate: $minDate, maxDate: $maxDate, types: $types)
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

## 

