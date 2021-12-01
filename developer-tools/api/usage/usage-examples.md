# Connections

## Create a Connection

### On Demand Connections

To create a connection from one device to another which will reconnect on demand, you can use the Desktop Application or the CLI tool. This type of connection is Peer to Peer by default with a Proxy Failover.

{% swagger baseUrl="https://api.remot3.it" path="/apv/v27/device/connect" method="post" summary="Create a Proxy Connection" %}
{% swagger-description %}
This REST-API request creates a proxy connection to a service. See authentication section for information on how to add the correct headers.
{% endswagger-description %}

{% swagger-parameter in="header" name="auth" type="string" %}
See authentication section for the auth headers required.
{% endswagger-parameter %}

{% swagger-parameter in="body" name="deviceaddress" type="string" %}
The service address (e.g. service ID) for the device you'd like to connect to
{% endswagger-parameter %}

{% swagger-parameter in="body" name="wait" type="boolean" %}
Whether to wait for the connection or not. Should be set to "true"
{% endswagger-parameter %}

{% swagger-parameter in="body" name="hostip" type="string" %}
Controls the connection mode. See description below.
{% endswagger-parameter %}

{% swagger-response status="200" description="Connection with device successfully created." %}
```javascript
{
    "connection": {
        "deviceaddress": "80:00:00:00:00:00:00:91",
        "expirationsec": "28797",
        "proxy": "https://xppoobalo.p18.rt3.io"
        "connectionid":"A78B3919-52E1-B674-58CC-5C0009377419"
    },
    "status": "true"
}
```
{% endswagger-response %}

{% swagger-response status="400" description="Bad requests and not authorized requests will still return as a status 200 but with the response text as status false" %}
```javascript
{
    "status": "false"
}
```
{% endswagger-response %}
{% endswagger %}

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

#### Public

By setting the "hostip" parameter to 0.0.0.0, anyone who has the connection URL and port can connect to it until the connection expires or is closed using the API described at [Terminating a proxy connection to a device](usage-examples.md#stop-a-proxy-connection). If you use the Public connection mode, make sure that your resources are properly password protected.

#### IP Restricted

By setting the "hostip" parameter to the client's public IP address, IP restriction is enabled. Only connections coming from that public IP address will be allowed. Any other incoming connection will be blocked.

#### IP Latching

By setting the "hostip" parameter to 255.255.255.255, whoever uses the connection URL and port first will "latch" the connection, blocking all other connection attempts regardless of where they originated.

{% hint style="info" %}
The value returned for "connectionid" can be used with the [/device/connect/stop](usage-examples.md) API endpoint to terminate the proxy connection to your target when you are done using it.
{% endhint %}

{% hint style="info" %}
**Note**\
Some response values are omitted from the example above because they are only used in very specific circumstances.
{% endhint %}

## Terminating Connection

### Terminating an On Demand Connection

To stop an on demand connection from one device to another, you can use the Desktop Application or the CLI tool. This type of connection is Peer to Peer by default with a Proxy Failover.

{% swagger baseUrl="https://api.remote.it" path="/apv/v27/device/connect/stop" method="post" summary="Terminate a Proxy Connection" %}
{% swagger-description %}
This REST-API request will stop a proxy connection from one device to another. See the authentication page for further information about authentication
{% endswagger-description %}

{% swagger-parameter in="header" name="auth" type="string" %}
See the Authentication Page for further details about this header and request signing.
{% endswagger-parameter %}

{% swagger-parameter in="body" name="deviceaddress" type="string" %}
The service address (e.g. service ID) for the device you connected to, but now you want to terminate the proxy for that connection.
{% endswagger-parameter %}

{% swagger-parameter in="body" name="connectionid" type="string" %}
The connection ID returned from the /device/connect API call
{% endswagger-parameter %}

{% swagger-response status="200" description="Connection with device successfully stopped." %}
```javascript
{
    "status": "true",
    "connectionid":"A481EBED-C678-4DA4-60D2-60F1FE8EB5DA"
}
```
{% endswagger-response %}

{% swagger-response status="401" description="One or more of:
a) developerkey failed validation
b) connectionid incorrect or missing
c) deviceaddress incorrect or missing" %}
```
{
    "status": "false",
    "reason":"<error message>"
}
```
{% endswagger-response %}
{% endswagger %}

{% hint style="info" %}
**Note**\
Some response values are omitted from the example above because they are only used in very specific circumstances.
{% endhint %}
