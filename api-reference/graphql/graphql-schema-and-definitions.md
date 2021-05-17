# GraphQL Schema and Definitions

You can view our visual schema reference [**here.**](https://api.remote.it/graphql/v1/doc)

### Schema Definitions

GraphQL endpoint supports introspection queries via the \_\_schema query**.**

Schema convention is to use upper camel case for object types and lower camel case for property names.

Note that these objects and parameters are continually enhanced. Please use your IDE for the most up to date schema. The changes are designed to be non-breaking by adding rather than deleting or changing existing definitions.

Basic types are:

* ID \(similar to the string type but used for object IDs\)
* String
* Int
* Float
* Boolean
* DateTime \(returned in ISO 8601 format\)

