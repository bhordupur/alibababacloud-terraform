
output "engine"{
    value = "${alicloud_db_instance.rds_instance.engine}"
}

output "engine_version"{
    value = "${alicloud_db_instance.rds_instance.engine_version}"
}

output "db_instance_class" {
    value = "${alicloud_db_instance.rds_instance.instance_type}"
}

output "port" {
  value = "${alicloud_db_instance.rds_instance.port}"
}

output "allocate_public_connection" {
     value = "${alicloud_db_instance.rds_instance.allocate_public_connection}"
 }

output "security_ips" {
  value = "${alicloud_db_instance.rds_instance.security_ips}"
}
