---
# LAB-03 - Oracle Cloud Infrastructure Ansible Collection

Oracle Cloud Infrastructure Ansible Collection provides an easy way to provision and manage resources in Oracle Cloud using Ansible.

> **This collection replaces the [legacy modules](https://github.com/oracle/oci-ansible-modules). Refer to the [Migration Guide](https://github.com/oracle/oci-ansible-collections/blob/master/MigrationGuide.md) for best migration practices.**

Ansible [released Collections](https://www.ansible.com/blog/getting-started-with-ansible-collections) as part of the Ansible 2.9 release.
Ansible recommends Collections as the recommended method of packaging and releasing modules. 
With the creation of Oracle Cloud Ansible Collection, we are providing two user benefits:
 * **Faster Availability** - Oracle Cloud Ansible Modules will now be available to users at a faster pace on Ansible Galaxy. 
 * **Wider Coverage** - Support for the majority of the Oracle Cloud services.

We have also added a new [User Guide](https://github.com/oracle/oci-ansible-collections/blob/master/UserGuide.md) to highlight new features and best practices for using the new modules.

### Migration from Legacy Modules

We recommend migrating from the [legacy modules](https://github.com/oracle/oci-ansible-modules) since they will be deprecated in the near future.
Please expect a few breaking changes while migrating from legacy modules to the new collection modules.
We recommend you to refer to the [Migration Guide](https://github.com/oracle/oci-ansible-collections/blob/master/MigrationGuide.md) for breaking changes.
Also, the new modules are renamed to use the service name as a prefix.

#### Currently Supported Services 
We support almost all the of [OCI Cloud services](https://docs.cloud.oracle.com/en-us/iaas/Content/services.htm) with very few exceptions.
For the complete list of supported services, please check the [modules list](https://oci-ansible-collection.readthedocs.io/en/latest/collections/oracle/oci/index.html).

## Installation

### Pre-requisites
**python>=3.6**
#### Oracle Linux 7

```
sudo yum-config-manager --enable ol7_developer
sudo yum-config-manager --enable ol7_developer_EPEL
sudo yum install oci-ansible-collection
```
#### Oracle Linux 8

```
sudo yum-config-manager --enable ol8_developer
sudo yum-config-manager --enable ol8_developer_EPEL
sudo yum install oci-ansible-collection
```

#### Linux/macOS

```
curl -L https://raw.githubusercontent.com/oracle/oci-ansible-collection/master/scripts/install.sh | bash -s -- --verbose
```
#### For more info about installation and troubleshooting check the [Installation Guide](https://github.com/oracle/oci-ansible-collections/blob/master/InstallationGuide.md).

## Samples and Solutions

The project includes a catalog of Oracle Cloud Infrastructure Ansible module samples that illustrate using the modules 
to carry out common infrastructure provisioning and configuration tasks.
* The samples are organized in groups associated with Oracle Cloud Infrastructure services under [the samples directory on GitHub](https://github.com/oracle/oci-ansible-collections/tree/master/samples).
Begin by reviewing the Readme.md file that you will find in each sample's root directory.
* The solutions are available under [the solutions directory on GitHub](https://github.com/oracle/oci-ansible-collections/tree/master/solutions)

## Documentation
Module HTML documentation is available on [readthedocs.io](https://oci-ansible-collection.readthedocs.io/en/latest/collections/oracle/oci/index.html).

To view the module documentation, use this command:
  ``` bash
ansible-doc oracle.oci.[module_name]
  ```
General documentation can be found [here](https://docs.cloud.oracle.com/iaas/Content/API/SDKDocs/ansible.htm).
