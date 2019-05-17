Lets start up the environment:
```bash
docker-compose up -d vault
docker-comsepo up -d mysql
```

Let's open MySQL
```bash
docker-compose run --rm mysql-cli mysql -uroot -p --host=mysql
```

Let's open a vault CLI
```bash
docker-compose run --rm vault-cli /bin/sh
```

Enable a MySQL mount
```bash
vault secrets enable database
vault write database/config/my-mysql-database \
    plugin_name=mysql-legacy-database-plugin \
    connection_url="{{username}}:{{password}}@tcp(mysql:3306)/" \
    allowed_roles="*" \
    username="root" \
    password="mysql_root_password"
```

now, create a few roles
```bash
vault write database/roles/read-only \
    db_name=my-mysql-database \
    creation_statements="CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT SELECT ON *.* TO '{{name}}'@'%';" \
    default_ttl="1m" \
    max_ttl="1h"
vault write database/roles/read-write \
    db_name=my-mysql-database \
    creation_statements="CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT SELECT,ALTER,INSERT,UPDATE,DELETE ON *.* TO '{{name}}'@'%';" \
    default_ttl="1m" \
    max_ttl="1h"
vault write database/roles/root-like \
    db_name=my-mysql-database \
    creation_statements="CREATE USER '{{name}}'@'%' IDENTIFIED BY '{{password}}';GRANT ALL ON *.* TO '{{name}}'@'%' WITH GRANT OPTION;" \
    default_ttl="1m" \
    max_ttl="1h"
```