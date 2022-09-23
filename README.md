---

# Welcome to OCI-INLAB laboratory (Performing Terraform infrastructure demo)
This repository contains Terraform code to deploy an IaC basic architecture
if you are looking for more advanced excersises, maybe will be useful you
can check the Oracle Architecture Center [here]().

## Prerequisites to execute terraform to prepare the OCI-INLAB
On your must have the following points covered in order to perform the OCI-INLAB:
* You must have a Oracle Cloud Infrastructure (OCI) subscription (Free Account or paid Account), and with the subscription you must have a user account with enough privileges to deploy infrastructure with Terraform.
* Define API Keys for each user (cloud account assigned) to perform terraform deployments, also it's going to be needed the OCIDs information from:
  - Tenancy OCID
  - User OCID
  - Compartment OCID
  - Availability Domain name
  - Region Name
  - SSH pair key   
* The correct Terraform binary file for your operating system. We recommend using Terraform >= 0.12.20 or greater.
* SSH client
* Developer repository install and enablement for OL8:
```
$sudo dnf -y install oraclelinux-developer-release-el8
```
```
$sudo yum-config-manager --enable ol8_developer
```
* OCI client [(Consider configure previusly oci-cli to corroborate interaction with OCI Cloud)](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/cliconcepts.htm)
```
$sudo dnf install python36-oci-cli
```
* Install git utility
```
$sudo yum install git
```
	
## Considerations
Consider the lab can be performed on cloud shell console, or if you would ike to perform it on Linux client, the following are options:

* **Oracle Cloud Development Kit**: You can use Resource Manager to preinstall the Oracle Cloud Development Kit on a compute instance in your compartment. The Oracle Cloud Development Kit includes Terraform and the OCI Terraform provider, and preconfigures the required authorization.

* **Oracle Linux Cloud Developer image**: The Terraform provider is pre-installed on the Oracle Linux Cloud Developer platform image. For more information, see Oracle Linux Cloud Developer.
	
# Install binary by running the following yum command from an Oracle Linux machine
## Enabling apropiate repositories

* Cosider enable the appropiate repositories:
  - For OL7:
``` 
$sudo yum-config-manager --enable ol7_developer
```
  - For OL8:
```
$sudo yum-config-manager --enable ol8_developer

```
* Installing terraform package:
```
$sudo yum install terraform
```
* Install terraform provider by running the following yum command from an Oracle Linux machine:
```
$sudo yum install terraform-provider-oci
```	
* Test the Terraform Installation opening a terminal window and run the following command to test your installation:
```
$terraform -v
```

### OCI Console & Cloud Shell
The terraform lab can be performed using any Linux distro as client, or you can use the OCI Cloud Shell, so you'll need
access to the OCI Console and [Cloud Shell](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/cloudshellintro.htm) for any reason related with the execution of this lab.

## Clone the repository from Github
Clone the git project from the client that you are going to perform the lab:
```
$git clone https://github.com/dominusceo/oci-terraform-lab.git
```

## Terraform Variables
The **tfVariables.sh** script contains default global variables to be defined in Terraform client.

### New subitem
This is an example documentation with git  [GIT](https://wazuh.com/)
