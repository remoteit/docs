# Authentication

The REST-API and GraphQL API require authentication for requests. remote.it authentication uses HTTP Request Signature. The advantages of this method are:

* Keys do not expire
* Keys can be disabled and revoked (deleted) by the user at any time
* Keys are not dependent on password
* Keys are more secure (the secret is never transmitted because the request is signed)

{% hint style="danger" %}
**With 2FA enabled,** you'll need to provide an authentication code when accessing remote.it through your browser, desktop and mobile apps. If you access remote.it using other methods, such as the API or the CLI, you'll need to sign in with credentials using and access key and secret.
{% endhint %}

## Key Management

You can generate, enable, disable and delete keys in the Account section of the web portal here [https://app.remote.it](https://app.remote.it). Screen shot is provided below.

{% hint style="warning" %}
_**Please note: Generation of keys is crypto-random and the secret is only available immediately after creation by clicking the “Show secret access key” link or downloading the key as a CSV file (containing the Access Key ID and Secret Access Key)**_
{% endhint %}

![](../.gitbook/assets/Account\_-\_remote\_it-2.png)

You are limited to 2 active access keys. The account page will also show when the key was created and last used for authentication. If you suspect your key has been compromised, generate a new one, replace it in your code and disable. If desired you can delete the compromised key after disabling it.

In addition, if you will be using the REST-API you will also need to retrieve your Developer API Key. This can also be found in the Account section of the web portal.

### Create a remote.it Credentials File

You will need to follow the steps above with Key Management to generate your access key and secret before proceeding

Create the following file to save all your [remote.it](http://remote.it) credentials. The file must located be in \~/.remoteit/credentials (in your home directory). For windows, the directory is C:\Users\&lt;name>.remoteit\credentials with no extension.

The file is in the standard ini file format:

```
[default]
R3_ACCESS_KEY_ID=Z5QCS6ZO7PXXXMVDNXXX
R3_SECRET_ACCESS_KEY=XXXWC14Qsktnq/nbF+iXxXq2yc4sVPkQn3J0m5i
R3_DEVELOPER_API_KEY=XXXXXXX
```

You can save more than one key pair under different profiles (sections) in the remote.it credentials file. Profile names are case-insensitive, cannot contain a period (.) and default is the default profile name.

## API Request Signing

To authenticate an API request, the client must generate a signature using the previously created key and secret. The REST-API example you will also need your Developer API Key which you can get from your account page [https://app.remote.it/#account](https://app.remote.it/#account)

### Examples

{% hint style="warning" %}
These are examples of query requests only for the purposes of how to do the request signing. Please refer to the schema and usage documentation for requests which are supported.
{% endhint %}

{% tabs %}
{% tab title="bash/cURL" %}
The examples reads the \~/.remoteit/credentials file for the variables of your access key, secret, and developer key.

**GraphQL**

```bash
#!/bin/bash
source ~/.remoteit/credentials

SECRET=`echo ${R3_SECRET_ACCESS_KEY} | base64 --decode`

HOST="api.remote.it"
URL_PATH="graphql/v1"
URL="https://{$HOST}/{$URL_PATH}"

VERB="POST"

CONTENT_TYPE="application/json"

LC_VERB=`echo "${VERB}" | tr '[:upper:]' '[:lower:]'`

DATE=$(LANG=en_US date "+%a, %d %b %Y %H:%M:%S %Z")

DATA='{ "query": "{ login { email  devices (size: 1000, from: 0) { items { id name services { id name} } } } }" }'

CONTENT_LENGTH=${#DATA}

SIGNING_STRING="(request-target): ${LC_VERB} /${URL_PATH}
host: ${HOST}
date: ${DATE}
content-type: ${CONTENT_TYPE}
content-length: ${CONTENT_LENGTH}"

echo ${SIGNING_STRING}

SIGNATURE=`echo -n "${SIGNING_STRING}" | openssl dgst -binary -sha256 -hmac "${SECRET}" | base64`

SIGNATURE_HEADER="Signature keyId=\"${R3_ACCESS_KEY_ID}\",algorithm=\"hmac-sha256\",headers=\"(request-target) host date content-type content-length\",signature=\"${SIGNATURE}\""

curl --write-out -v -X ${VERB} -H "Authorization:${SIGNATURE_HEADER}" -H "Date:${DATE}" -H "Content-Type:${CONTENT_TYPE}" ${URL} -d "${DATA}" --insecure
```

**REST-API**

{% hint style="warning" %}
Please note, that you need the DEVELOPER API KEY in addition to the access key and access key secret. This example is for the purposes of demonstrating the REST-API request signing. For the device list, please use the graphQL API example above.
{% endhint %}

```bash
#!/bin/bash
source ~/.remoteit/credentials

SECRET=`echo ${R3_SECRET_ACCESS_KEY} | base64 --decode`

HOST="api.remote.it"
URL_PATH="apv/v27/device/list/all"
URL="https://{$HOST}/{$URL_PATH}"

VERB="GET"

CONTENT_TYPE="application/json"

LC_VERB=`echo "${VERB}" | tr '[:upper:]' '[:lower:]'`

DATE=$(LANG=en_US date "+%a, %d %b %Y %H:%M:%S %Z")
DATA=''
CONTENT_LENGTH=${#DATA}

SIGNING_STRING="(request-target): ${LC_VERB} /${URL_PATH}
host: ${HOST}
date: ${DATE}
content-type: ${CONTENT_TYPE}
content-length: ${CONTENT_LENGTH}"

echo ${SIGNING_STRING}

SIGNATURE=`echo -n "${SIGNING_STRING}" | openssl dgst -binary -sha256 -hmac "${SECRET}" | base64`

SIGNATURE_HEADER="Signature keyId=\"${R3_ACCESS_KEY_ID}\",algorithm=\"hmac-sha256\",headers=\"(request-target) host date content-type content-length\",signature=\"${SIGNATURE}\""

curl --write-out -v -X ${VERB} -H "Authorization:${SIGNATURE_HEADER}" -H "DeveloperKey:${R3_DEVELOPER_API_KEY}" -H "Date:${DATE}" -H "Content-Type:${CONTENT_TYPE}" ${URL} --insecure
```
{% endtab %}

{% tab title="Node" %}
**GraphQL**

This typescript example shows&#x20;

1. How to retrieve credentials from the remote.it credentials file using a `default` profile
2. Use `http-signature` client library to Authenticate each request
3. How to query GraphQL using variables and the `https` library

```javascript
import fs from 'fs'
import https from 'https'
import os from 'os'
import path from 'path'
​
import httpSignature from 'http-signature'  // npm install http-signature
import ini from 'ini'                       // npm install ini
​
const R3_ACCESS_KEY_ID = 'R3_ACCESS_KEY_ID'
const R3_SECRET_ACCESS_KEY = 'R3_SECRET_ACCESS_KEY'
​
const CREDENTIALS_FILE = '.remoteit/credentials'
const DEFAULT_PROFILE = 'default'
​
const SIGNATURE_ALGORITHM = 'hmac-sha256'
const SIGNED_HEADERS = '(request-target) host date content-type content-length'
​
const APPLICATION_JSON = 'application/json'
​
const GRAPHQL_HOST = 'api.remote.it'
const GRAPHQL_URL = '/graphql/v1'
​
function getCredentials(profileName = DEFAULT_PROFILE) {
  const file = path.resolve(os.homedir(), CREDENTIALS_FILE)
​
  if (!fs.existsSync(file)) throw new Error(`remote.it credentials file not found: ${file}`)
​
  const credentials = ini.parse(fs.readFileSync(file, 'utf-8'))
​
  const profile = Object.entries(credentials).find(([name]) => name.toUpperCase() === profileName.toUpperCase())
​
  if (!profile) throw new Error(`remote.it profile not found: ${profileName}`)
​
  const [_, section] = profile
​
  const keyId = section[R3_ACCESS_KEY_ID]
​
  if (!keyId) throw new Error(`remote.it credentials missing: ${R3_ACCESS_KEY_ID}`)
​
  const secret = section[R3_SECRET_ACCESS_KEY]
​
  if (!secret) throw new Error(`remote.it credentials missing: ${R3_SECRET_ACCESS_KEY}`)
​
  return {keyId, secret}
}
​
async function graphql(keyId, secret, query, variables) {
  const body = JSON.stringify({query, variables})
​
  const options = {
    host: GRAPHQL_HOST,
    port: 443,
    path: GRAPHQL_URL,
    method: 'POST',
    headers: {
      'Content-Type': APPLICATION_JSON,
      'Content-Length': body.length
    },
    body
  }
​
  return new Promise((resolve, reject) => {
    const request = https.request(options, response => {
      response.on('data', json => resolve(JSON.parse(json)))
    })
​
    httpSignature.sign(request, {
      keyId,
      key: Buffer.from(secret, 'base64'),
      algorithm: SIGNATURE_ALGORITHM,
      headers: SIGNED_HEADERS.split(/\s+/)
    })
​
    request.on('error', error => reject(error))
​
    request.write(body)
    request.end()
  })
}
​
(async () => {
  try {
    const query = 'query TestQuery($id: String!) {' +
      '  login {' +
      '    device(id: [$id]) {' +
      '      name' +
      '      endpoint {' +
      '        timestamp' +
      '        state' +
      '        externalAddress' +
      '      }' +
      '    }' +
      '  }' +
      '}'
​
    const variables = {
      id: '80:00:00:00:01:02:03:04'
    }
​
    const {keyId, secret} = getCredentials()
​
    const result = await graphql(keyId, secret, query, variables)
​
    console.log(JSON.stringify(result, null, 2))
  } catch (error) {
    console.error(error)
  }
})()
```
{% endtab %}

{% tab title="Python 3" %}
This example is using a helper library requests\_http\_signature for Python 3 which will sign the request before submitting it to the server. This demonstrates how to safely reference the key and secret from environment variables rather than including it in the code. You will need to set the environment variables before executing.

**GraphQL**

```
import os
import requests
import json
from requests_http_signature import HTTPSignatureAuth
from base64 import b64decode

key_id = os.environ.get('R3_ACCESS_KEY_ID')
key_secret_id = os.environ.get('R3_SECRET_ACCESS_KEY')

body = {"query": "query { login { id email devices { items { id name }}}}"}
host = 'api.remote.it'
url_path = '/graphql/v1'
content_type_header = 'application/json'
content_length_header = str(len(body))

headers = {
    'host': host,
    'path': url_path,
    'content-type': content_type_header,
    'content-length': content_length_header,
}

response = requests.post('https://' + host + url_path,
                         json=body,
                         auth=HTTPSignatureAuth(algorithm="hmac-sha256",
                                                key=b64decode(key_secret_id),
                                                key_id=key_id,
                                                headers=[
                                                    '(request-target)', 'host',
                                                    'date', 'content-type',
                                                    'content-length'
                                                ]),
                         headers=headers)

if response.status_code == 200:
    print(response.text)
else:
    print(response.status_code)
```

**REST-API**

{% hint style="warning" %}
Please note, that you need the DEVELOPER API KEY in addition to the access key and access key secret. This example is for the purposes of demonstrating the REST-API request signing. For the device list, please use the graphQL API example above.
{% endhint %}

```
import requests
from requests_http_signature import HTTPSignatureAuth
from base64 import b64decode

# For more on authentication see https://docs.remote.it/api-reference/authentication
key_id = os.environ.get('R3_ACCESS_KEY_ID')
key_secret_id = os.environ.get('R3_SECRET_ACCESS_KEY')
api_key = os.environ.get('R3_DEVELOPER_API_KEY')

body = ''  #update this with your data if posting with a body
host = 'api.remote.it'
url_path = '/apv/v27/device/list/all'
content_type_header = 'application/json'
content_length_header = str(len(body))
headers = {
    'host': host,
    'content-type': content_type_header,
    'content-length': content_length_header,
    'DeveloperKey': api_key
}
response = requests.get('https://' + host + url_path,
                        auth=HTTPSignatureAuth(algorithm="hmac-sha256",
                                               key=b64decode(key_secret_id),
                                               key_id=key_id,
                                               headers=[
                                                   '(request-target)', 'host',
                                                   'date', 'content-type',
                                                   'content-length'
                                               ]),
                        headers=headers)

if response.status_code == 200:
    print(response.text)
else:
    print(response.status_code)
    print(response.text)
```
{% endtab %}

{% tab title="C#" %}
This example is using RestSharp to make the requests, and the built in cryptography library (System.Security.Cryptography) to sign the **** request. This demonstrates using a configuration manager to safely reference the key and secret from environmental variables rather than including it in the code. You will need to set the environmental variables before executing.

ExecuteRequest requires a string which is your graphQL query body.

**graphQL**

```
private static readonly RestClient Client = new RestClient("https://api.remote.it/graphql/v1");
private static readonly HMACSHA256 SignatureGenerator = new HMACSHA256(Convert.FromBase64String(ConfigurationManager.AppSettings.Get("R3_SECRET_ACCESS_KEY")));

public static async Task<IRestResponse> ExecuteRequest(string requestContent)
{
    string date = DateTime.UtcNow.ToString("ddd, dd MMM yyy HH':'mm':'ss 'GMT'");

    string signatureParams = "(request-target): post /graphql/v1\n" +
    "host: api.remote.it\n" +
    $"date: {date}\n" +
    "content-type: application/json\n" + 
    $"content-length: {requestContent.Length}";
    string signature = Convert.ToBase64String(SignatureGenerator.ComputeHash(Encoding.UTF8.GetBytes(signatureParams)));

    RestRequest request = new RestRequest(Method.POST);
    request.AddHeader("Host", "api.remote.it");
    request.AddHeader("Date", date);
    request.AddHeader("Content-Type", "application/json");
    request.AddHeader("Content-Length", requestContent.Length.ToString());
    request.AddHeader("Authorization", 
        $"Signature keyId=\"{ConfigurationManager.AppSettings.Get("R3_ACCESS_KEY_ID")}\"," +
            "algorithm=\"hmac-sha256\"," +
            "headers=\"(request-target) host date content-type content-length\"," +
            $"signature=\"{signature}\"");
    request.AddParameter("application/json", requestContent, ParameterType.RequestBody);

    var response = await Client.ExecuteAsync(request);
    return response;
}
```
{% endtab %}

{% tab title="Other Languages" %}
You can reference different standard implementations of the signature in different languages from w3c-ccg [https://github.com/w3c-ccg/http-signatures/issues/1](https://github.com/w3c-ccg/http-signatures/issues/1)
{% endtab %}
{% endtabs %}