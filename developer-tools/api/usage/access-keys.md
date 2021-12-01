# Access Keys

Access keys are used to authenticate you with our API. You can create a new key or delete an existing key at any time. You can also temporarily disable a key.

## Creating an Access Key

{% hint style="warning" %}
**If you lose or forget your secret key, you cannot retrieve it.** You can create a new access key and disable/delete the other. There is a limit of 2 access keys.
{% endhint %}

```text
mutation {
  createAccessKey {
    key
    secret
  }
}
```

Response Example

```text
{
  "data": {
    "createAccessKey": {
      "key": "YX62XXXXXXXXXX6YB",
      "secret": "XXXXXXXXXXXXXX"
    }
  }
}
```

## Disable/Enable an Access Key

This request will disable/enable an existing access key. Arguments must pass the access key id \(not the secret\) and enabled as a boolean

```text
mutation {
    updateAccessKey(key:"YX62XXXXXXXXXX6YB", enabled: false) {
        key
        enabled
    }
}
```

Response Example

```text
{
  "data": {
    "updateAccessKey": {
      "key": "YX62XXXXXXXXXX6YB",
      "enabled": false
    }
  }
}
```

## Delete an Access Key

This mutation will delete the access key permanently.

{% hint style="danger" %}
Any API or CLI requests using this access key will start failing authentication when this is completed.
{% endhint %}

```text
mutation {
  deleteAccessKey (key: "YXXXXXXXXXXXX6YB") 
}
```

Response Example

```text
{
  "data": {
    "deleteAccessKey": true
  }
}
```

