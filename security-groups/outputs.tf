/*

Output the desired resources which are created above

*/


output "security_group" {
  value = "${alicloud_security_group.group.name}"
}

output "vpc_cidr_block_id"{
  value = "${alicloud_vpc.vpc.id}"
}

output "vpc_cidr_block"{
  value = "${alicloud_vpc.vpc.cidr_block}"
}

output "allowed_ssh_host"{
  value = "${alicloud_security_group_rule.ssh-in.cidr_ip}"
}

output "sg_group_name"{
  value = "${alicloud_security_group.group.name}"
}

output "rule_id" {
  value = "${alicloud_security_group_rule.http-in.id}"
}

output "rule_type" {
  value = "${alicloud_security_group_rule.http-in.type}"
}

output "port_range" {
  value = "${alicloud_security_group_rule.https-in.port_range}"
}

output "ip_protocol" {
  value = "${alicloud_security_group_rule.ssh-in.ip_protocol}"
}
