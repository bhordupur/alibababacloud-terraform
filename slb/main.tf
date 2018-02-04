#provider and credentials 
provider "alicloud" {
	
	access_key = "${var.access_key}"
  	secret_key = "${var.secret_key}"
  	region     = "${var.region}"
}


# create a vSwitch called vsw
resource "alicloud_vswitch" "vsw" {
  name              = "slb-vsw"
  description		= "switch for slb"
  vpc_id            = "${alicloud_vpc.vpc.id}"
  cidr_block        = "192.168.1.0/24"
  availability_zone = "${var.az}"
  depends_on        = ["alicloud_vpc.vpc"]
} 

#create a VPC called  custom-vpc
resource "alicloud_vpc" "vpc" {
  name       = "custom-vpc"
  cidr_block = "192.168.0.0/16"
}

resource "alicloud_slb" "instance" {
  name = "${var.slb_name}"
  internet_charge_type = "${var.internet_charge_type}"
  internet = "${var.internet}"
  listener = 
  [
    /* {
      "instance_port" = "443"
      "lb_port" = "443"
      "lb_protocol" = "https"
      "healthy_threshold" = 2
      "unhealthy_threshold" = 2
      "health_check_timeout" = 5
      "health_check_interval" = 2
      "health_check_timeout" = 5
      "health_check_connect_port" = 443
      "bandwidth" = "1000"
      #MUST HAVE CERT ID
      #ssl_certificate_id = ""
    }, */

    {
        "instance_port" = "80"
        "lb_port" = "80"
        "lb_protocol" = "http"
        "health_check" = "on"
        "health_check_domain" = "$_ip"
        "health_check_uri" = "/"
        "health_check_connect_port" = 80
        "healthy_threshold" = 3
        "unhealthy_threshold" = 3
        "health_check_timeout" = 5
        "health_check_interval" = 2
        "health_check_http_code" = "http_2xx,http_3xx"
        "bandwidth" = "1000"
      }]
    vswitch_id = "${alicloud_vswitch.vsw.id}"

}


/**
*** SLB Attchment to the back-end instances
**/

#resource "alicloud_slb_attachment" "default" {
#  slb_id    = "${alicloud_slb.instance.id}"
  #TODO HERE
  #instances = ["${alicloud_instance.web_server.id}"] # attach back end instances to the SLB
#}