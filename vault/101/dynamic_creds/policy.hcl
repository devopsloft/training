path "database/creds/" {
  capabilities = ["read"]
}

path "database/creds/" {
  capabilities = ["read"]
}

path "database/creds/dev-" {
  capabilities = ["deny"]
}

path "database/roles/ops-" {
  capabilities = ["update"]
  allowed_parameters {
    default_ttl = ["*"]
    max_ttl = ["*"]
  }
}