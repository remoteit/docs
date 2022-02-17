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
