# Device Sharing

This mutation allows you to add or remove device and service sharing from your account to other users. DeviceId and ServiceId can be retrieved [here](devices-and-services.md#get-your-devices).&#x20;

| Parameters | Data Type                | Description                                                                                                                               |
| ---------- | ------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------- |
| deviceId   | String                   | <p><strong>required</strong></p><p>The ID of the device to share</p>                                                                      |
| email      | \[String]                | <p><strong>required</strong></p><p>The email(s) of the user you want to share the device with, or you can specify an array of emails.</p> |
| scripting  | Boolean                  | Grants bulk scripting permission to the user (**default**: false)                                                                         |
| notify     | Boolean                  | The user will be notified (**default**: true)                                                                                             |
| action     | String                   | ADD, REMOVE, LEAVE (**default**: ADD)                                                                                                     |
| services   | \[ServiceSharingOptions] | For sharing only a subset of services. This field and below is not required if sharing all services of a device                           |
| serviceId  | String                   | The ID of the specific service associated with the deviceID                                                                               |

### Add or Remove

This example shares and notifies `email@example.com` that deviceId `80:00:00:00:12:34:56:78` has been shared and all services associated with it but does not grant bulk scripting permissions.

```graphql
mutation {
  share(deviceId: "80:00:00:00:12:34:56:78", 
        email: "email@example.com", 
        scripting: false,
        notify: true,
        action: ADD)
}
```

This example shares a service and removes a share of another service on the same device to multiple users.

```graphql
mutation {
  share(deviceId: "80:00:00:00:12:34:56:78",
        email: [
          "email1@example.com",
          "email2@example.com"
        ],
        notify: true,
        services: [
          {serviceId: "80:00:00:00:12:34:56:79", action: ADD},
          {serviceId: "80:00:00:00:12:34:56:79", action: REMOVE}
        ]
```

### Leave

If you want to leave a shared device that another user has shared with you previously

```graphql
mutation {
  share(
    deviceId: "80:00:00:00:12:34:56:78"
    email: "YourEmail@example.com"
    action: LEAVE
  )
}
```

Response Example

```graphql
{
  "data": {
    "share": true
  }
}
```
