variable "web_port" {
    type = "string",
    default = "8080"
}

variable "environment" {}

variable instance_type {}

variable min_size {
    type = "number"
}

variable max_size {
    type = "number"
}