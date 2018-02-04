# access_key
variable "access_key"{
    default = ""
}

# secret_key
variable "secret_key"{
    default = ""
}

variable "region"{
    default = "eu-central-1"
}

variable "az" {
  default = "eu-central-1a"
}

variable "datacenter" {
  default = "Germany"
}


variable "sg-name"{
    default = "webserver-sg"
}
