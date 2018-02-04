output "slb_id" {
  value = "${alicloud_slb.instance.id}"
}

output "slbname" {
  value = "${alicloud_slb.instance.name}"
}

output "address"{
    value = "${alicloud_slb.instance.address}"
}

output "internet"{
    value = "${alicloud_slb.instance.internet}"
}

/*
output "bandwidth"{
    value = "${alicloud_slb.instance.listner.*.bandwidth}"
}

output "instance_port"{
    value = "${alicloud_slb.instance.listner.*.instance_port}"
}

output "lb_port"{
    value = "${alicloud_slb.instance.listner.*.lb_port}"
} 

output "vswitch_id"{
    value = "${alicloud_slb.instance.vswitch_id}"
}*/
