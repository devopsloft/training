Lets get into a CLI container
```bash
docker-compose run --rm vault-file-cli /bin/sh
```

Check vault status:
```bash
vault status
```

Initialize vault (only in non-dev mode)
```bash
vault operator init
```
save the tokens!!

Now let's look at the status again
```bash
vault status
```

We can see that vault is sealed, let's unseal it
```bash
vault operator unseal
```

let's see what auth methods we have?
```bash
vault secrets list
```

Seems we need to authenticate, so, lets take the root token
(Not advised for production use)

Lets create a kv mount
```bash
vault secrets enable -version=2 kv
vault secrets list
```

We can also mount on a different path
```bash
vault secrets enable -path=/kv_new kv
vault secrets list
```

create 2 secrets:
```bash
vault kv put /kv/sample secret=data
vault kv put /kv_new/sample secret=data
```

Now, lets read them
```bash
vault kv get /kv/sample
vault kv get /kv_new/sample

vault kv get -format=json /kv/sample
vault kv get -format=json /kv_new/sample
```