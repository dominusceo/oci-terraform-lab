#Autor: Ricardo Carrillo <ricardo.d.carrillo@oracle.com> 
data "template_file" "init" {
   template = "${file("${var.templates_path}ansible-vars.json.tftpl")}"
   vars = {
       ansible_compartment             = "${var.compartment}"
       ansible_tenancy_ocid            = "${var.tenancy_ocid}"
       ansible_user_ocid               = "${var.user_ocid}"
       ansible_fingerprint             = "${var.fingerprint}"
       ansible_private_key             = "${var.private_key}"
       ansible_oci_region              = "${var.oci_region}"
       ansible_adDomain                = "${var.adDomain}"
       ansible_ansible_user            = "${var.ansible_user}"
       ansible_instanceShape           = "${var.instanceShape}"
       ansible_ansible_ssh_private_key = "${var.ansible_ssh_private_key}"
       ansible_templates_path          = "${var.templates_path}"
       ansible_inventory_path          = "${var.inventory_path}"
       ansible_inventory_file          = "${var.inventory_file}"
       ansible_grpIAMAdmin             = "${var.grpIAMAdmin}"
   } 
}

output "rendered" {
  value = "${data.template_file.init.rendered}"
}
