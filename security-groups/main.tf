 

provider "alicloud" {
	
	access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}


# create A security group called webserver-sg

resource "alicloud_security_group" "group" {
  name        = "${var.sg-name}"
  description = "security group for webservers"
  vpc_id      = "${alicloud_vpc.vpc.id}"
}

#open incoming port 80
resource "alicloud_security_group_rule" "http-in" {
  type = "ingress"
  ip_protocol = "tcp"
  nic_type = "internet"
  policy = "accept"
  port_range = "80/80"
  priority = 1
  security_group_id = "${alicloud_security_group.group.id}"
  cidr_ip = "0.0.0.0/0" #from anywhere
}

#open incoming port 22
resource "alicloud_security_group_rule" "ssh-in" {
  type = "ingress"
  ip_protocol = "tcp"
  nic_type = "internet"
  policy = "accept"
  port_range = "22/22"
  priority = 1
  security_group_id = "${alicloud_security_group.group.id}"
  cidr_ip = "192.168.1.53/32"  #allowed from bastion host only
}

#open incpming port for 443
resource "alicloud_security_group_rule" "https-in" {
  type = "ingress"
  ip_protocol = "tcp"
  nic_type = "internet"
  policy = "accept"
  port_range = "443/443"
  priority = 1
  security_group_id = "${alicloud_security_group.group.id}"
  cidr_ip = "0.0.0.0/0"
}


#create a VPC called  bolddk-vpc
resource "alicloud_vpc" "vpc" {
  name       = "custom-vpc"
  cidr_block = "192.168.0.0/16"
}

