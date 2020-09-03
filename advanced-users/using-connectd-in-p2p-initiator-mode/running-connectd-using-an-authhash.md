---
description: Optional mode which does not require you to use your password
---

# Running connectd using an authhash

## Running connectd with service\_authhash

Most of the parameters are the same as with a username and password except for the service\_authhash and ip restriction settings indicated below:

```bash
connectd -p 
    eW91cm5hbWVAZXhhbXBsZS5jb20= \
    16509BA77F1AF0FBAA7BBB3B2B992ED90308CAB9 \  # service_authhash
    80:00:00:00:00:00:00:F1 \
    T3000 \
    2 \
    127.0.0.1 \
    0.0.0.0 \        # 0.0.0.0 allows all or enter an IP to restrict to
    10 \
    0 \
    0
```

To get the service\_authhash for your account from remote.it you need to use the login API:

{% page-ref page="../../api-reference/authentication.md" %}

The authhash for your account is returned in the "service\_authhash" key, for example:

```text
"service_authhash":"5F6996FBC8D434E92C11667F2088E97B59392CF4"
```

### 

