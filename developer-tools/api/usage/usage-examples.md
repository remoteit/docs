# Connections

## On Demand Connections

To create a connection from one device to another which will reconnect on demand, you can use the Desktop Application or the CLI tool. This type of connection is Peer to Peer by default with a Proxy Failover.

## Create a Proxy Connection

{% hint style="info" %}
For http and https remote.it Services, the returned value for "proxy" will be a single string similar to the following. It does not need an explicit port value to be used. These are "reverse proxies". Reverse proxies are always public, which is why the randomized URL is generated at the time of creating the connection.

```
"proxy": "https://xprbjalo.p18.rt3.io"
```

For all other types of remote.it Services, the returned value for "proxy" will include a hostname and a port value separated by a colon, as shown below. These are "port proxies".

```
"proxy": "http:\/\/proxy18.rt3.io:38575"
```
{% endhint %}

### Proxy Connection Modes

The following options apply only to "port proxies", namely all Service types except the **http** and **https** Service types, which use "reverse proxies". Reverse proxies are always public which is why the randomized URL is created.

#### hostIP Options

| Mode          | Value          | Description                                                                                                                                                                                                   |
| ------------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Public        | 0.0.0.0        | Anyone who has the connection URL and port can connect to it until the connection expires or is closed. If you use the Public connection mode, make sure that your resources are properly password protected. |
| IP Restricted | Unique IP      | Only connections coming from that public IP address will be allowed. Any other incoming connection will be blocked.                                                                                           |
| IP Latching   | 255.255.255.25 | Whoever uses the connection URL and port first will "latch" the connection, blocking all other connection attempts regardless of where they originated.                                                       |

### Connect

<table><thead><tr><th>Parameter</th><th width="171.33333333333331">Data Type</th><th>Description</th></tr></thead><tbody><tr><td>serviceId</td><td>String</td><td>The id of the service you will make a connection to</td></tr><tr><td>hostIP</td><td>String</td><td>Used to restrict the range of IP addresses who can connect to the proxy.</td></tr></tbody></table>



```graphql
#Query
mutation query($serviceId: String!, $hostIP: String!) {
  connect(serviceId: $serviceId, hostIP: $hostIP) {
	id
	created
	host
	port
	reverseProxy
	timeout
	}
}
#Variables
{
	"serviceId": "80:00:00:12:34:56:78:90",
	"hostIP": "255.255.255.255"
}
```

Query response for reverse proxy connections (http/s services)

```graphql
{
  "data": {
    "connect": {
      "id": "123ddfff-6432-49d0-6432-205d49d08454",
      "created": "2020-01-01T01:09:00.000Z",
      "host": "a4csg2w9f8wipk.p16.rt3.io",
      "port": null,
      "reverseProxy": true,
      "timeout": 28800
    }
  }
}
```

{% hint style="info" %}
The value returned for "id" can be used with the [Disconnect](usage-examples.md#disconnect) API endpoint to terminate the proxy connection to your target when you are done using it.
{% endhint %}

Query response for all other proxy requests where host + port is required to connect

```graphql
{
  "data": {
    "connect": {
      "id": "123ddfff-6432-49d0-6432-205d49d08454",
      "created": "2020-01-01T01:20:00.000Z",
      "host": "proxy18.rt3.io",
      "port": 37488,
      "reverseProxy": false,
      "timeout": 28800
    }
  }
}
```

### Disconnect

| Parameter    | Data Type | Description                                                              |
| ------------ | --------- | ------------------------------------------------------------------------ |
| serviceId    | String    | The id of the service you want to terminate the connection for           |
| connectionId | String    | This is the connect id in the query response from the connect call above |

```graphql
#Query
mutation query($serviceId: String!, $connectionId: String!){
  disconnect(serviceId: $serviceId, connectionId: $connectionId)
}
#Variables
{
	"serviceId": "80:00:00:12:34:56:78:90",
	"connectionId": "123ddfff-6432-49d0-6432-205d49d08454"
}
```

Query Response

```graphql
{
  "data": {
    "disconnect": true
  }
}
```
