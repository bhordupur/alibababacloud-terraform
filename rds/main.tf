
provider "alicloud" {
	
	access_key = "${var.access_key}"
  	secret_key = "${var.secret_key}"
  	region     = "${var.region}"
}

#create a VPC called  custom-vpc
resource "alicloud_vpc" "vpc" {
  name       = "custom-vpc"
  description = "Our Custom VPC"
  cidr_block = "192.168.0.0/16"
}

# create a vSwitch called custom-vsw
resource "alicloud_vswitch" "custom-rds-vsw" {
  name              = "custom-rds-vsw"
  description		= "Custom vSwitch for RDS"
  vpc_id            = "${alicloud_vpc.vpc.id}"
  cidr_block        = "192.168.1.0/24"
  availability_zone = "${var.az}"
  depends_on        = ["alicloud_vpc.vpc"]
}


resource "alicloud_db_instance" "rds_instance" {
    engine = "${var.engine}"
    instance_name = "${var.rds_name}"
    engine_version = "${var.engine_version}"
    instance_type = "${var.instance_type}"
    instance_storage = "${var.instance_storage}"
    instance_charge_type = "${var.instance_charge_type}"
    #alicloud_db_connection = "${var.db_instance_net_type}" #default is intranet
    #master_user_name = "${var.master_user_name}"
    #alicloud_db_account = "${var.master_user_password}"
    #alicloud_db_backup_policy = "7"   # Default is 7 days but can be set to 730 days
    instance_network_type = "VPC" #default is classic network
    allocate_public_connection = "false" #default intranet
    security_ips = ["192.168.0.0/16"]
    vswitch_id = "${alicloud_vswitch.custom-rds-vsw.id}"
  
}



