---
description: >-
  There are multiple developer tool IDEs such as Insomnia, Postman, and Altair.
  This is an example using Insomnia.
---

# Using Developer Tools

Insomnia is an API request IDE and a remote.it plugin is available to assist with authentication to allow you to experiment before you develop code.  
For graphQL, you can explore the schema, generate queries and mutations.  
For the REST-API, you can create http requests.

### Download and Install Insomnia

{% embed url="https://insomnia.rest/" %}

It is recommended that you install Insomnia Core rather than Insomnia Designer, but the plugin should work for both versions.

### Add the Plugin to Insomnia

We will be using a remote.it provided plugin to create queries which will automatically sign the requests.

Go to preferences:

![](../.gitbook/assets/1e236728-af1d-44ae-bfa2-a9bcaf851267.png)

Enter insomnia-plugin-remoteit and click _Install Plugin_

### Generate a graphQL Request

Make sure to create a _**POST**_ request and select _**GraphQL Query**_ as Body type. NOTE: All graphQL queries and mutations are made with **POST**

You can type a sample GraphQL query to [https://api.remote.it/graphql/v1](https://api.remote.it/graphql/v1) like:

```text
{
  login {
    email
  }
}
```

If you haven't already set up your machine with the credentials file, see [here](authentication.md) and do so now.

Select the _**Auth**_ tab of the query and select _**Bearer Token**_ authentication. You then can ctrl + click on the field to select the _**remote.it API authentication**_ tag, and select a specific profile otherwise the default profile will be used. 

You now can send the request and execute the query using the credentials stored earlier.

