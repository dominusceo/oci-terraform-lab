variable "compartment" {
  type        = string
  default     = "ocid1.compartment.oc1..aaaaaaaanoui6jllobc2iubjyno2vvvv7flg4rsu37avw532zzygizgche7q"
  description = "Oracle Cloud Compute Compartment where the infra will be deployed"
}


variable "tenancy_ocid" {
  type        = string
  default     = "ocid1.tenancy.oc1..aaaaaaaar6q6nrtbkidcz6xnyl3lkqssk7c6nslpnu2mdjywtbppvz5txz2a"
  description = "Oracle Cloud Identifier tenancy"
}

variable "user_ocid" {
  type        = string
  default     = "ocid1.user.oc1..aaaaaaaavhq2vh6b2fh2yim2jmh6bjb3kkd2x7prhhfkz7swomle644azkcq"
  description = "Oracle Cloud Identifier user"
}

variable "fingerprint" {
  type        = string
  default     = "3e:48:9e:44:b4:23:3c:41:8e:94:03:d5:4a:83:73:5b"
  description = "Oracle Cloud Fingerprint for the key pair"
}

variable "private_key" {
  type    = string
  default = "/home/ricardo.carrillo/.ssh/oci_api_private.pem"
}

variable "oci_region" {
  type        = string
  default     = "us-sanjose-1"
  description = "Oracle Cloud region"
}

variable "ad_list" {
  type        = list(any)
  default     = ["CjTI:US-SANJOSE-1-AD-1"]
  description = "Availability Domain in us-sanjose-1 region"
}

variable "adDomain" {
  type        = string
  default     = "HRGE:US-SANJOSE-1-AD-1"
  description = "Availability domain in San Jose"
}
