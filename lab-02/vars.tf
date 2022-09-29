variable "compartment" {
  type    = string
  default = "ocid1.compartment.oc1..aaaaaaaa7mw745uen2b3me65exun4vjclyfzduouyaz7fvzd3fjs3ltr54rq"
  description = "Oracle Cloud Compute Compartment where the infra will be deployed"
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
  default = "~/.ssh/oci_api_private.pem"
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

variable "instance_shape" {
  #default = "VM.Standard2.1"
  default = "VM.Standard.E2.1.Micro"
}

variable "ad-domain" {
  type	  = string
  default = "CjTI:US-SANJOSE-1-AD-1"
  description = "Availability domain in san jose"
}

// Data related with the internal user
variable "user-data" {
  default = <<EOF
#!/bin/bash -x
echo '################### webserver userdata begins #####################'
touch ~/userdata.$(date +%s).start

# echo '########## yum update all ###############'
# yum update -y

echo '########## basic webserver ##############'
yum install -y httpd openssl wget mod_ssl
systemctl enable  httpd.service
systemctl start  httpd.service
echo '<html><head></head><body><pre><code>' > /var/www/html/index.html
echo '<b>' $(hostname) '</b>'  >> /var/www/html/index.html
echo '' >> /var/www/html/index.html
#cat /etc/os-release >> /var/www/html/index.html
sudo mkdir -p /var/www/html/img
sudo wget  https://docs.oracle.com/en-us/iaas/Content/Resources/Images/loadBalancer3adRegional.png -O /var/www/html/img/loadbalancer-reg.png
sudo chown -R apache:apache  /var/www/html/
echo '<img src="img/loadbalancer-reg.png" alt="Load Balancer Regional">'>> /var/www/html/index.html
echo '</code></pre></body></html>' >> /var/www/html/index.html

echo '-----BEGIN CERTIFICATE-----
MIID+TCCAuECFEsKbkkbI5Y8t+bfPkDNAWawvptFMA0GCSqGSIb3DQEBCwUAMIG3
MQswCQYDVQQGEwJNWDEZMBcGA1UECAwQQ2l1ZGFkIGRlIE1leGljbzEZMBcGA1UE
BwwQQ2l1ZGFkIGRlIE1leGljbzEeMBwGA1UECgwVT3JhY2xlIExBRCBUZWNoIENs
b3VkMRswGQYDVQQLDBJFeGFtcGxlIE9yYWNsZSBJbmMxFjAUBgNVBAMMDSouZXhh
bXBsZS5jb20xHTAbBgkqhkiG9w0BCQEWDmNhQGV4YW1wbGUuY29tMCAXDTIyMDky
NzAxMDE1NFoYDzIxNTkwODIwMDEwMTU0WjCBtzELMAkGA1UEBhMCTVgxGTAXBgNV
BAgMEENpdWRhZCBkZSBNZXhpY28xGTAXBgNVBAcMEENpdWRhZCBkZSBNZXhpY28x
HjAcBgNVBAoMFU9yYWNsZSBMQUQgVGVjaCBDbG91ZDEbMBkGA1UECwwSRXhhbXBs
ZSBPcmFjbGUgSW5jMRYwFAYDVQQDDA0qLmV4YW1wbGUuY29tMR0wGwYJKoZIhvcN
AQkBFg5jYUBleGFtcGxlLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
ggEBAKbSpKB2iQMG3ncfqbaznqsyFt8IX4Kem9gduBRxkSfK/7UTsbydB0zT3uQz
p6Bhm/YLHfZpWcEqntSxbUcSk0ShHQ7d4vqgi1SpCQ6DjExJrhxKHrZFH3E6/YcZ
WQ6202JGrRF+RUOyzokCQxCz2PvOS2mPmES5fbNNUoQjlrf9NTyCU8MjqVsx9lui
KULSn5lQbV61X/vWGR/UqggoD9m1c2mCfSQICMc8MrhkuPBSS7pkKBJKpBFOzjVr
eSOf9WFflEZ0j4fxmlxfgr2+jhAlFmknW0OCC3v0soIfsD3h9aL5G5fjmpaKMHu8
Z0myjmVQcokrp/Mnkq1naucNH90CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAvMpN
txbq5auhD2Czb7ql5xn0wJYrxGvOYMZPyGw089p/fDPnk994CHfC5yCsW3a2+Fk3
A0eCvOvnuZVBaq9FWzU2bI0m1sqd5svjsNBVuWdhjMjnJi9X1900lRE863cTjJNi
XQKgU9tLzBeyeZaRncg5MYpLwpTAJPwQA/UOquTQURojtzK4iYyvumt4g86+uutS
eYZGk8QPE3LZp2ustRswbZyHB+my8BkrUPzQCRhaNmyDkDl8/JoAunjoSlAayYGG
q1MEoD1zhLG4YqdU/95N7xvI91HCaz/k6oUWArg6seBX41EXvIicyoEwl6N6F60I
3+Hat+b3kscmpY/Vug==
-----END CERTIFICATE-----' > /etc/pki/tls/certs/loadbalancer.crt
echo '-----BEGIN CERTIFICATE-----
MIID9zCCAt8CFE2z29WarqHey1Ri6WhbxAjdm925MA0GCSqGSIb3DQEBCwUAMIG3
MQswCQYDVQQGEwJNWDEZMBcGA1UECAwQQ2l1ZGFkIGRlIE1leGljbzEZMBcGA1UE
BwwQQ2l1ZGFkIGRlIE1leGljbzEeMBwGA1UECgwVT3JhY2xlIExBRCBUZWNoIENs
b3VkMRswGQYDVQQLDBJFeGFtcGxlIE9yYWNsZSBJbmMxFjAUBgNVBAMMDSouZXhh
bXBsZS5jb20xHTAbBgkqhkiG9w0BCQEWDmNhQGV4YW1wbGUuY29tMB4XDTIyMDky
NzAxMDA1MloXDTIyMTAyNzAxMDA1MlowgbcxCzAJBgNVBAYTAk1YMRkwFwYDVQQI
DBBDaXVkYWQgZGUgTWV4aWNvMRkwFwYDVQQHDBBDaXVkYWQgZGUgTWV4aWNvMR4w
HAYDVQQKDBVPcmFjbGUgTEFEIFRlY2ggQ2xvdWQxGzAZBgNVBAsMEkV4YW1wbGUg
T3JhY2xlIEluYzEWMBQGA1UEAwwNKi5leGFtcGxlLmNvbTEdMBsGCSqGSIb3DQEJ
ARYOY2FAZXhhbXBsZS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
AQC9ynE9oyXIL8FokZutCK0NjYezpZYpYGD7X6s0uhLgViNEJQmO4iVf8e7wGV4D
EX9nHICk5LR43xg3911xOz9JAw9IWovDd1VO0Y4+O/HENpfb1V65ivPYuxm5uUmM
m2Kr6eFza2qAe3dDEjK0cSm8R2ee76uBcBjZ55UDhm+Nrk+RBDRwVgc+2ddlU3Ws
2imVO12Q+Y2iot+Quy+i7zmvBhxWVJeYVY3ysctxHe1dHAp+DQl0UoHYp2Y6MsL5
JeyTz1gTFQIC1m9GiOaXnO6ksDTjKPZKgHcNlHj6jHPqXBRQSxO1pyqn6YMmPBg7
NXB65YxR3oi+kMbAd9r+Jt/DAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAkcwKjW
0xeu1AaWQJgO9ITpt777lqAXwR25yiR7kAeRkP/g1MGKTvhUFNW7HGpVo6XUN/ZK
itvKC3b64APZ3Eh6kcap2Hr6YxSHMIQPf0CP7Fd0ZLzJlPmwkAq/5oYCamveBU6P
XcXNWkvEGVtaVFuofHMRjUxAMiZzopWiVi7NyVE2+SCd3gfRBvwraNvj2g4PFZl9
zU9rtq0KzPkx7oJPv+uAV0tNDEL5WXhgVUwVdL27/sJc0xGZOhLk88OXwgXF3MFd
IM5fll02Z6w4wp3P4MGX7gJmzw1XypoQo2uxdwdbrVkPqM6UL/Vx40sqA9Cq1cTh
Ms8y9hmNQJ6IRXQ=
-----END CERTIFICATE-----' > /etc/pki/CA/certs/ca.crt

echo '-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAptKkoHaJAwbedx+ptrOeqzIW3whfgp6b2B24FHGRJ8r/tROx
vJ0HTNPe5DOnoGGb9gsd9mlZwSqe1LFtRxKTRKEdDt3i+qCLVKkJDoOMTEmuHEoe
tkUfcTr9hxlZDrbTYkatEX5FQ7LOiQJDELPY+85LaY+YRLl9s01ShCOWt/01PIJT
wyOpWzH2W6IpQtKfmVBtXrVf+9YZH9SqCCgP2bVzaYJ9JAgIxzwyuGS48FJLumQo
EkqkEU7ONWt5I5/1YV+URnSPh/GaXF+Cvb6OECUWaSdbQ4ILe/Sygh+wPeH1ovkb
l+Oaloowe7xnSbKOZVByiSun8yeSrWdq5w0f3QIDAQABAoIBACBx00bKBvepvFaa
t90qre9JvJz/+eNjiZfMn+KJ+9srZfQHsoemWqcchbsIOM++bCC8JMWp06T37xAa
udAa0r2EQCyGBwELfE2o2nQSLZUgt1YVLEfyxZy2BlziFyn/cLkqWbqPPlVeT0Di
SbzT3Z2Lj6smHE0xbjsTDLtaWJPLwLkyElEcDbrL3BXwd18F0tEIIW2T94i9l/F1
voZj/ZDbLhqgyi3euhFKRCn4NsGnvT4uqtVR6hALdbIbn9Hv1c5uNlA33xg1EcFu
uaixalYryLoCkt8yMFrO5vkx+eLV5jWP02XSDnd1qHCl7b0RpQ26ll7IKvmFXiAh
m2Gt9YECgYEA2EKkVPxbVFtAWUIekXa4JurX8WYVXVV6xE4Ddg0xi24NSTG+ra2B
bcCav/iBOmq8Z7u8tTY+e81kYl/ZHoe+p4tStl7fsLhH8Di5mfM8VtphpchRPPET
6vaLVcBzkpUTpHFoK3HGsAZeL69gU76L5bfqYRd9iPd01A6yKulAI1ECgYEAxXpa
czQ8pVyffVRkMbyngnc39n5xEfCwEz3rZNLdDPrOTn6lYsqVEV1j1tjd0NTpBfrM
tJ4CxSC8ohylJ5o9dTyu0K4irq/D0M/3JnZ+I0tU/v40TFIWZ+wjyw9XS+DOdPSM
TKBHfXj92bUN0YZsZAAI1TPZOk3/otUu5JR9WM0CgYEAkeh8qV5OXF7ozpAewbQg
0RkXsyZV+c/ncbTU/vwt1k3dJuoqJVHwBlWx0x3eSsSi8zYmPvknNS5BsWHLwp6B
ktccajEeqUPcPYZ4KxeCOXND+K9rqDtbXecT4Tpkf5yXURa22sD79d2GBJRF4Jqq
FsZ8mx9XMmcK6twzd2JCRNECgYEAtcB8yxdC0fdDmzg210gI7B0J1sZdDuP1SmBs
7GjepnmXs8sAMMK/HDJWF4GV9gRfS++exIXBiuksdA/lOWPOOL7XLp12skx27xLZ
J/9a7OUCn4YbYDsVACTodJX0BJQtsJr7HfNOmP7otJzc0QDldcxKVN/ZiL4NEDMh
a6P3EekCgYA7wlpktnRsbOmgwvvyuRhf8GR6T1LKVkpABQkwJZkwoNggRx36KM4j
ZhTxC6K9Fz+ucT4iDGCQj1TmVriM0F2Gj+zeN6llEanjyaTR5gyvAg00X/+bkuYo
ageq1Uy158FwyvJgvC93WuXmdwivv2SMX9KZp0i7sikBEgoqKUM9hg==
-----END RSA PRIVATE KEY-----' > /etc/pki/tls/private/loadbalancer.key


echo '
<VirtualHost *:443>
    DocumentRoot /var/www/html
    ServerName apps.example.com
    SSLEngine on
    SSLCertificateFile /etc/pki/tls/certs/loadbalancer.crt
    SSLCertificateKeyFile /etc/pki/tls/private/loadbalancer.key
    SSLCertificateChainFile /etc/pki/CA/certs/ca.crt
</VirtualHost>' >> /etc/httpd/conf.d/apps-example-com.conf

firewall-offline-cmd --add-service=http --add-service=https
systemctl enable  firewalld
systemctl restart firewalld
systemctl restart httpd

touch ~/opc/userdata.$(date +%s).finish
echo '################### webserver userdata ends #######################'
EOF
}

variable "instance_image_ocid" {
  type = map(string)
  default = {
    # See https://docs.us-phoenix-1.oraclecloud.com/images/
    # Oracle-provided image "Oracle-Linux-7.5-2018.10.16-0"
    us-phoenix-1   = "ocid1.image.oc1.phx.aaaaaaaaoqj42sokaoh42l76wsyhn3k2beuntrh5maj3gmgmzeyr55zzrwwa"
    us-ashburn-1   = "ocid1.image.oc1.iad.aaaaaaaageeenzyuxgia726xur4ztaoxbxyjlxogdhreu3ngfj2gji3bayda"
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaitzn6tdyjer7jl34h2ujz74jwy5nkbukbh55ekp6oyzwrtfa4zma"
    uk-london-1    = "ocid1.image.oc1.uk-london-1.aaaaaaaa32voyikkkzfxyo4xbdmadc2dmvorfxxgdhpnk6dw64fa3l4jh7wa"
  }
}
## Certificates variables
# LB-specific variables
variable "lb_options" {
  type              = object({
    display_name    = string,
    compartment_id  = string,
    shape           = string,
    subnet_ids      = list(string),
    private         = bool,
    nsg_ids         = list(string),
    defined_tags    = map(string),
    freeform_tags   = map(string)
  })
  description       = "Parameters for customizing the LB."
  default           = {
    display_name    = null
    compartment_id  = null
    shape           = null
    subnet_ids      = null
    private         = null
    nsg_ids         = null
    defined_tags    = null
    freeform_tags   = null
  }
}

# Certificates-specific variables
variable "certificates" {
  type                  = map(object({
    ca_certificate      = string,
    passphrase          = string,
    private_key         = string,
    public_certificate  = string,
  }))
  description           = "Parameters for Certificates."
  default               = {}
}

# Backend-sets-specific variables
variable "backend_sets" {
  type                  = map(object({
    policy              = string,
    health_check_name   = string,
    enable_persistency  = bool,
    cookie_name         = string,
    disable_fallback    = bool,
    enable_ssl          = bool,
    certificate_name    = string,
    verify_depth        = number,
    verify_peer_certificate = bool,
    backends            = map(object({
      ip                = string,
      port              = number,
      backup            = bool,
      drain             = bool,
      offline           = bool,
      weight            = number
    }))
  }))
  description           = "Parameters for Backend Sets."
  default               = {}
}

# Health Check variables
variable "health_checks" {
  type                  = map(object({
    protocol            = string,
    interval_ms         = number,
    port                = number,
    response_body_regex = string,
    retries             = number,
    return_code         = number,
    timeout_in_millis   = number,
    url_path            = string
  }))
  description           = "Parameters for health checks (used by Backend Sets)."
  default               = {}
}

# Path Route Set-specific variables
variable "path_route_sets" {
  type                  = map(list(object({
    backend_set_name    = string,
    path                = string,
    # valid values: EXACT_MATCH, FORCE_LONGEST_PREFIX_MATCH, PREFIX_MATCH, SUFFIX_MATCH
    match_type          = string
  })))
  description           = "Parameters for Path Route Sets."
  default               = {}
}

# Rule Set-specific variables
variable "rule_sets" {
  type                  = map(list(object({
    action              = string,
    header              = string,
    prefix              = string,
    suffix              = string,
    value               = string
  })))
  description           = "Parameters for Rule Sets."
  default               = {}
}

# Listener-specific variables
variable "listeners" {
  type                  = map(object({
    default_backend_set_name = string,
    port                = number,
    protocol            = string,
    idle_timeout        = number,
    hostnames           = list(string),
    path_route_set_name = string,
    rule_set_names      = list(string),
    enable_ssl          = bool,
    certificate_name    = string,
    verify_depth        = number,
    verify_peer_certificate = bool
  }))
  description           = "Parameters for Listeners."
  default               = {}
}
