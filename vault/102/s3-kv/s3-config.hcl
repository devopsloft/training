ui = true

storage "s3" {
  bucket = "devopsloft"
  region = "eu-west-1"
}

listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = 1
}
