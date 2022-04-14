# Custom Attributes

Attributes can be added to Users, Devices and Services. Attributes can have overrides defined by context. This is used for your own custom metadata.&#x20;

### Add/Update Attribute

| Parameter | Data Type | Description                                                                                           |
| --------- | --------- | ----------------------------------------------------------------------------------------------------- |
| name      | String    | <p><strong>required</strong></p><p>Name of attribute</p>                                              |
| value     | String    | <p><strong>required</strong></p><p>Value of attribute <br><code>null</code> to remove</p>             |
| serviceId | String    | <p><strong>required</strong></p><p>The userId, deviceId or serviceId the attribute is assigned to</p> |
| context   | String    | defined context of the attribute. Allows for override of attribute value for the same name            |

```graphql
mutation {
  setAttribute(
    name: "CustomAttribute",
    value: "ValueOfAttribute",
    serviceId: "80:00:00:00:12:34:56:78",
    context: "CustomContext"
  )
}
```

Query Response

```graphql
{
  "data": {
    "setAttribute": "ValueOfAttribute"
  }
}
```

### Category and Status Fields

We have reserved names of remote.it Device attributes which will be displayed on the Web Portal and Desktop UIs. These attributes are for Category and Status fields. The UI currently can display Category A-E and Status A-E. These must be set against the Device ID (also known as the Bulk Service's "Service ID" of the remote.it Device). The convention for the name is $remoteit.categoryA for category attributes and $remoteit.statusA for status attributes. The convention is the same for removing and retrieving these attributes.

**Example Category Mutation**&#x20;

```graphql
mutation {
  setAttribute(
    name: "$remoteit.categoryA",
    value: "my category A value",
    serviceId: "80:00:00:00:12:34:56:78",
  )
}
```

### Remove Attribute

```graphql
mutation {
  setAttribute(
    name: "CustomAttribute",
    value: null,
    serviceId: "80:00:00:00:12:34:56:78",
  )
}
```

### Set Multiple Attributes

This method shows how to update multiple attributes on a single device by passing in a JSON formatted variables.

```graphql
#Query
mutation UpdateMultipleAttributes($attributes: Object!, $serviceId: String!) {
	setAttributes(attributes: $attributes, serviceId: $serviceId)
}

#Variables
{
  "attributes": {
    "$remoteit": {
      "categoryA": "Uptime:1h, 06m",
      "categoryB": "Version:navitas-5.4.1649680544",
      "categoryC": "Serial:lps8k380254",
      "categoryD": "GatewayID:a840411f41244150"
    },
    "MoreJsonAttributes": {
      "version": "1.0"
    },
    "StringAttribute": "newvalue"
  },
  "serviceId": "80:00:00:00:01:12:12:12"
}
```

### Retrieve Attributes

```graphql
{
  login {
    attributes #User Attributes
    devices{
      items{
        attributes #Device Attributes
        services{ 
          attributes(context: "customContext") #Service Attributes
        }
      }			
    }
  }
}
```

Query Response

```graphql
{
  "data": {
    "login": {
      "attributes": { #User Attributes
	"newAttribute": "CustomAttributeValue",
	},
     "devices": {
	"items": [
	{
	"attributes": { #Device Attributes
	  "newAttribute": "CustomAttributeValue"
	},
	"services": [
	{
	  "attributes": { #Service Attributes
	     "newAttribute": "ContextAttributeValue"
	   }
	},...]						
	}
	]
      }
    }
  }
}
```
