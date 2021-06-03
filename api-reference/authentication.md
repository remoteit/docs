# Authentication

The REST-API and GraphQL API require authentication for requests. remote.it authentication uses HTTP Request Signature. The advantages of this method are:

* keys do not expire
* keys can be disabled and revoked \(deleted\) by the user at any time
* keys are not dependent on password
* keys are more secure \(the secret is never transmitted because the request is signed\)

## Key Management

You can generate, enable, disable and delete keys in the Account section of the web portal here [https://app.remote.it](https://app.remote.it). Screen shot is provided below. 

{% hint style="info" %}
_**Please note: Generation of keys is crypto-random and the secret is only available immediately after creation by clicking the “Show secret access key” link or downloading the key as a CSV file \(containing the Access Key ID and Secret Access Key\)**_
{% endhint %}

![](../.gitbook/assets/account_-_remote_it.png)

You are limited to 2 active access keys. The account page will also show when the key was created and last used for authentication. If you suspect your key has been compromised, generate a new one, replace it in your code and disable. If desired you can delete the compromised key after disabling it.

### Create a remote.it Credentials File

You will need to follow the steps above with Key Management to generate your access key and secret before proceeding

Create the following file to save all your [remote.it](http://remote.it/) credentials. The file must located be in ~/.remoteit/credentials \(in your home directory\). For windows, the directory is C:\Users\&lt;name&gt;\.remoteit\credentials with no extension. 

The file is in the standard ini file format:

```text
[default]
R3_ACCESS_KEY_ID=Z5QCS6ZO7PXXXMVDNXXX
R3_SECRET_ACCESS_KEY=XXXWC14Qsktnq/nbF+iXxXq2yc4sVPkQn3J0m5i
```

You can save more than one key pair under different profiles \(sections\) in the remote.it credentials file. Profile names are case-insensitive, cannot contain a period \(.\) and default is the default profile name.

## API Request Signing

To authenticate an API request, the client must generate a signature using the previously created key and secret.

### Examples

{% tabs %}
{% tab title="Python" %}
This example is using a helper library requests\_http\_signature for python which will sign the request before submitting it to the server. This demonstrates how to safely reference the key and secret from environmental variables rather than including it in the code.

#### GraphQL

```text
import binascii
import os

import requests
from requests_http_signature import HTTPSignatureAuth

key_id = os.environ.get('R3_ACCESS_KEY_ID')
key = os.environ.get('R3_SECRET_ACCESS_KEY')

response = requests.post('https://api.remote.it/graphql/v1',
                         json={"query": "query { login { id email devices { items { id name }}}}"},
                         auth=HTTPSignatureAuth(key=binascii.a2b_base64(key), key_id=key_id))

if response.status_code == 200:
    print(response.text)
else:
    print(response.status_code)
```

#### REST-API

```text
import binascii
import os

import requests
from requests_http_signature import HTTPSignatureAuth

key_id = os.environ.get('R3_ACCESS_KEY_ID')
key = os.environ.get('R3_SECRET_ACCESS_KEY')

response = requests.get('https://api.remot3.it/apv/v27/device/list/all', auth=HTTPSignatureAuth(key=binascii.a2b_base64(key), key_id=key_id))

if response.status_code == 200:
    print(response.text)
else:
    print(response.status_code)
```
{% endtab %}

{% tab title="bash/cURL" %}
 These example reads the ~/.remoteit/credentials file for the variables of your access key and secret. In the REST-API example you will also need your Developer API Key which you can get from your account page [https://app.remote.it/\#account](https://app.remote.it/#account)

#### GraphQL

```text
#!/bin/bash
set -a
. ~/.remoteit/credentials
set +a

echo $R3_ACCESS_KEY_ID

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

#### REST-API 

Replace the developer key value with your Developer API Key.

```text
#!/bin/bash
set -a
. ~/.remoteit/credentials
set +a

DEVELOPER_KEY="XXXXXX" #get your Developer API Key from your account page 

SECRET=`echo ${R3_SECRET_ACCESS_KEY} | base64 --decode`

HOST="api.remot3.it"
URL_PATH="apv/v27/device/list/all"
URL="https://{$HOST}/{$URL_PATH}"

VERB="GET"

CONTENT_TYPE="application/json"

LC_VERB=`echo "${VERB}" | tr '[:upper:]' '[:lower:]'`

DATE=$(LANG=en_US date "+%a, %d %b %Y %H:%M:%S %Z")


SIGNING_STRING="(request-target): ${LC_VERB} /${URL_PATH}
host: ${HOST}
date: ${DATE}
content-type: ${CONTENT_TYPE}
content-length: 0"

echo ${SIGNING_STRING}

SIGNATURE=`echo -n "${SIGNING_STRING}" | openssl dgst -binary -sha256 -hmac "${SECRET}" | base64`

SIGNATURE_HEADER="Signature keyId=\"${R3_ACCESS_KEY_ID}\",algorithm=\"hmac-sha256\",headers=\"(request-target) host date content-type content-length\",signature=\"${SIGNATURE}\""

curl --write-out -v -X ${VERB} -H "Authorization:${SIGNATURE_HEADER}" -H "DeveloperKey:${DEVELOPER_KEY}" -H "Date:${DATE}" -H "Content-Type:${CONTENT_TYPE}" ${URL} --insecure

```
{% endtab %}

{% tab title="Node" %}


Enter access key, secret and developer key which will call the graphql request in the script using openssl

```text
const fs = require('fs')
const ini = require('ini')
const os = require('os')
const path = require('path')
const httpSignature = require('http-signature')
const https: require('https')

const R3_ACCESS_KEY_ID = 'R3_ACCESS_KEY_ID'
const R3_SECRET_ACCESS_KEY = 'R3_SECRET_ACCESS_KEY'

const CREDENTIALS_FILE = '.remoteit/credentials'
const DEFAULT_PROFILE = 'default'

const SIGNATURE_ALGORITHM = 'hmac-sha256'
const SIGNED_HEADERS = '(request-target) host date content-type content-length'

const data = JSON.stringify({
  todo: 'Buy the milk'
})

const options = {
  hostname: 'whatever.com',
  port: 443,
  path: '/todos',
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Content-Length': data.length
  }
}

const file = path.resolve(os.homedir(), CREDENTIALS_FILE)

      if (!fs.existsSync(file)) return `remote.it credentials file not found: ${file}`

      let credentials

      try {
        credentials = ini.parse(fs.readFileSync(file, 'utf-8'))
      } catch (error) {
        return `remote.it credentials file error: ${error.message}`
      }

      if (profile) {
        credentials = getSection(credentials, profile)

        if (!credentials) return `remote.it profile not found: ${profile}`
      } else {
        credentials = getSection(credentials, DEFAULT_PROFILE) || credentials
      }

      const key = credentials[R3_ACCESS_KEY_ID]

      if (!key) return `remote.it credentials missing: ${R3_ACCESS_KEY_ID}`

      const secret = credentials[R3_SECRET_ACCESS_KEY]

      if (!secret) return `remote.it credentials missing: ${R3_SECRET_ACCESS_KEY}`

      await Promise.all([
        context.store.setItem(R3_ACCESS_KEY_ID, key),
        context.store.setItem(R3_SECRET_ACCESS_KEY, secret)
      ])
      
const [key, secret] = await Promise.all([
      context.store.getItem(R3_ACCESS_KEY_ID),
      context.store.getItem(R3_SECRET_ACCESS_KEY)
    ])
          
httpSignature.sign(new RequestWrapper(context.request), {
      keyId: key,
      key: Buffer.from(secret, 'base64'),
      algorithm: SIGNATURE_ALGORITHM,
      headers: SIGNED_HEADERS.split(/\s+/)
    })

const req = https.request(options, res => {
  console.log(`statusCode: ${res.statusCode}`)

  res.on('data', d => {
    process.stdout.write(d)
  })
})

req.on('error', error => {
  console.error(error)
})

req.write(data)
req.end()

```
{% endtab %}

{% tab title="Other Languages" %}
You can reference different standard implementations of the signature in different languages from w3c-ccg [https://github.com/w3c-ccg/http-signatures/issues/1](https://github.com/w3c-ccg/http-signatures/issues/1)
{% endtab %}
{% endtabs %}



