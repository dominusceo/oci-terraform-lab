# Welcome
This repository contains Terraform code to deploy an IaC basic architecture
if you are looking for more advanced excersises, maybe will be useful you
can check the Oracle Architecture Center [here]().

## Prerequisites to execute the OCI-INLAB (Using terraform)
On your management workstation or linux client, you will need the following:
* An Oracle Cloud Infrastructure (OCI) account that has user credentials sufficient to execute a Terraform plan.
* Required keys and OCIDs 
* The correct Terraform binary file for your operating system. We recommend using Terraform >= 0.12.20 or greater.
* SSH client
* Git
	
##Considerations
Consider the lab can be performed on cloud shell console, or if you would ike to perform it on Linux client, the following are options:

* Oracle Cloud Development Kit: You can use Resource Manager to preinstall the Oracle Cloud Development Kit on a compute instance in your compartment. The Oracle Cloud Development Kit includes Terraform and the OCI Terraform provider, and preconfigures the required authorization.

* Oracle Linux Cloud Developer image: The Terraform provider is pre-installed on the Oracle Linux Cloud Developer platform image. For more information, see Oracle Linux Cloud Developer.
	
#Install binary by running the following yum command from an Oracle Linux machine
## Enabling terraform and packages related with Yum

Enable repositories:
* For OL7:
``` 
sudo yum-config-manager --enable ol7_developer
```
* For OL8:
```
sudo yum-config-manager --enable ol8_developer

```
Installing terraform package
```
sudo yum install terraform
```
* Install terraform provider by running the following yum command from an Oracle Linux machine:
```
sudo yum install terraform-provider-oci
```	
* Test the Terraform Installation opening a terminal window and run the following command to test your installation:
```
terraform -v
```
### OCI Console & Cloud Shell
The terraform lab can be performed using any Linux distro as client, or you can use the OCI Cloud Shell, so you'll need
access to the OCI Console and [Cloud Shell](https://docs.cloud.oracle.com/en-us/iaas/Content/API/Concepts/cloudshellintro.htm) for any reason related with the execution of this lab.

### API keys
To utilize Stripe, you will need to have access to a pair of [Stripe Publishable & Secret keys](https://stripe.com/docs/keys).
These are stored in an OCI Vault and then used by the application server upon bootstrapping.

## Clone the repository from Github

```
git clone https://github.com/dominusceo/oci-terraform-lab.git
```


## Terraform Variables
The **tfVariables.sh** script contains default global variables to be defined in Terraform client.
### New subitem
This is an example documentation with git  [GIT](https://wazuh.com/)
