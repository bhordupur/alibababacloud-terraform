variable "access_key"{
    default = ""
}

variable "secret_key"{
    default = ""
}

variable "region"{
    default = "eu-central-1"
}

variable "az" {
  default = "eu-central-1a"
}

variable "slb_name" {
  default = "layer7-slb"
}

variable "internet_charge_type" {
  default = "paybytraffic"
}

variable "internet" {
  default = true
}