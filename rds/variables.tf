# access_key
variable "access_key"{
    #default = ""
}

# secret_key
variable "secret_key"{
    #default = ""
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

variable "engine" {
    default = "MySQL"
}
variable "engine_version" {
    default = "5.6"
}

variable "instance_type" {
    default = "mysql.x8.medium.2"
}

variable "instance_storage" {
    default = "250"
}

variable "db_instance_net_type" {
    default = "Intranet"
} 

variable "instance_charge_type"{
    default = "Prepaid"   #Default is Postpaid 
}

variable "rds_name"{
    default="master_rds"
}

variable "db_name" {
   default = "dashboard"
}

variable "master_user_name"{
    default = "power-user"
}

variable "master_user_password" {
    default = "test123!"
}

variable "database_character" {
    default = "utf8"
}