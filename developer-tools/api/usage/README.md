# Usage

remote.it is in the process of making available all functions in graphQL and will be eventually deprecate the REST-API. This documentation provides the REST-API where the function is not available via graphQL.

## What is GraphQL?

GraphQL is a data query language for API's, developed by Facebook in 2012 before being publicly released in 2015. GraphQL provides an alternative to the REST API.

For more information on GraphQL, learn on the official GraphQL website [**here.**](https://graphql.org)

## How to Access GraphQL

`https://api.remote.it/graphql/v1` Continue through this documentation to learn about our schema and some useful examples.

remote.it authentication uses HTTP Request Signature; more on Authentication can be found [here](../authentication.md).

### GraphQL Clients (Developer Tools)

These are some of the most popular developer tools used with GraphQL API's which you can use to explore the schema.

* [**Insomnia**](https://insomnia.rest/graphql/)
* [**Postman**](https://www.getpostman.com)
* [**GraphiQL**](https://www.electronjs.org/apps/graphiql)
* [**Altair**](https://altair.sirmuel.design)

We provide some basic setup and usage for the Insomnia client [here](../using-developer-tools.md).

You can view our visual schema reference [**here.**](https://api.remote.it/graphql/v1/doc)

### **Schema Definitions**

GraphQL endpoint supports introspection queries via the \_\_schema query**.**

{% hint style="info" %}
#### We recommend using a GraphQL client (Developer Tools) to introspect and explore the schema.

Configure your GraphQL client to use the API endpoint:&#x20;

`https://api.remote.it/graphql/v1`
{% endhint %}

Schema convention is to use upper camel case for object types and lower camel case for property names.

Note that these objects and parameters are continually enhanced. Please use your IDE for the most up to date schema. The changes are designed to be non-breaking by adding rather than deleting or changing existing definitions.

Basic types are:

* ID (similar to the string type but used for object IDs)
* String
* Int
* Float
* Boolean
* DateTime (ISO 8601 format Date String)

## Queries

Queries are requests which read the data and will not change the data. All queries will be in context of the user associated with the access key and secret. The usage examples include a variable section which will need to accompany the query or alternatively, you can put the values inline.&#x20;

### Fetching updates

If you're working on building an application which display data and you want the status information to update (near) realtime, use the [webhook](../../webhooks/). To prevent excessive usage of our API, we recommend that you be mindful about your implementation.

**Do's:**

* Register a programmatic [webhook](../../webhooks/) and get updates for status changes on your devices. When you detect changes, update the device information

**Dont's:**

* Poll updates for each device. There should never be a reason to do this, unless in small cases and your application might get rate limited. See above tactics to implement this better.

## Mutations

Mutations are requests which update data. All mutations are in context of the user associated with the access key and secret.

In the case where we do not have the functionality supported, the REST-API examples are provided. These will be updated from time to time as remote.it migrates to support graphQL only.

## Pagination

The list responses from the devices and event log queries return paginated results. We implement a pagination model with `from`/`after` and `size` pagination arguments. Responses can return `hasMore`, `last` and `total` . If the `hasMore` response returns true, this indicates do another fetch. In this case, the `from` will increment to 1001 to fetch the next set. You could also determine this by iteration until you get to the `total`. Size is limited to 1000 max in each return.

```javascript
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

Result Response

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
