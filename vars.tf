variable "compartment" {
  type    = string
  default = "ocid1.compartment.oc1..aaaaaaaa7mw745uen2b3me65exun4vjclyfzduouyaz7fvzd3fjs3ltr54rq"
  description = "Oracle Cloud Compartment"
}


variable "tenancy_ocid" {
  type    = string
  default = "ocid1.tenancy.oc1..aaaaaaaa2rk54ibdfxxemyrgkfsna3mzj5s2kihdoyz4riglujpsxymghrgq"
  description = "Oracle Cloud Identifier tenancy"
}

variable "user_ocid" {
  type    = string
  default = "ocid1.user.oc1..aaaaaaaad5wkqrqw25rtgvltdblv5yhnvxg3c3ugzvurm6bp63yvppnbgx5q"
  description = "Oracle Cloud Identifier user"
}

variable "fingerprint" {
  type    = string
  default = "3e:48:9e:44:b4:23:3c:41:8e:94:03:d5:4a:83:73:5b"
  description = "Oracle Cloud Fingerprint for the key pair"
}

variable "private_key" {
  type    = string
  default = "/home/ricardo.carrillo/.ssh/oci_api_private.pem"
}

variable "oci_region" {
  type = string
  default     = "us-sanjose-1"
  description = "Oracle Cloud region"
}

variable "ad_list"{
   type        = list
   default     = ["CjTI:US-SANJOSE-1-AD-1"]
   description = "Availability Domain in us-sanjose-1 region"
}
