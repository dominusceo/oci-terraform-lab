provider "oci" {
  #version = ">= 3.27.0"
  region       = "${var.oci_region}"
  tenancy_ocid = var.tenancy_ocid
  user_ocid    = var.user_ocid
  fingerprint  = var.fingerprint
  private_key  = var.private_key
  private_key_path = "${var.private_key}"
}
