#Author : Ricardo Carrillo ricardo.d.carrillo@oracle.com
#Goal   : Main file describe the provider configuration, this file uses vars.tf file in order to get values defined to connect to oci
/*
provider "oci" {
  #version = ">= 3.27.0"
  region       = "${var.oci_region}"
  tenancy_ocid = var.tenancy_ocid
  user_ocid    = var.user_ocid
  fingerprint  = var.fingerprint
  private_key  = var.private_key
  private_key_path = "${var.private_key}"
  config_file_profile = "DEFAULT"
}
*/
