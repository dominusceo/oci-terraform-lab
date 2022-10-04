---
# LAB-01 - OCI-INLAB laboratory
For this lab, you can take the following architecture as reference, also you should consider 
can check the [Oracle Architecture Center](https://docs.oracle.com/solutions/?q=terraform&cType=reference-architectures&sort=date-desc&lang=en) for more advanced examples of architectures to use through terraform.

![OCI-INLAB-01](../img/lab-01/OCI-INLAB-01.png)

## LAB-01 #1 - VCN, route tables and subnet related creation
Elements to create:
1. Create VCN 
2. Create subnet
3. Internet Gateway creation and route table associated
4. Link the routable created with the subnet created

![OCI-INLAB-A](../img/inlab-01/OCI-INLAB-A.png)

## LAB-01 #2 - Instance creation
1. 2 instances creation
2. Each instance has a different name, Ex: **server-1** y **server-2**

![OCI-INLAB-B](../img/inlab-01/OCI-INLAB-B.png)

## LAB-01 #3 - Security Lists creation
1. Create 3 ingress rules within the security list recently created: 
- TCP 22 port, TCP protocol (SSH Access)
- TCP 8080 port, TCP protocol (Proxy Web – **NOT DEPLOYED**)
- TCP 3620 port, TCP protocol (iSCSI connectivity)

2.  Egress rule creation 
- 0.0.0.0/0 segment (All internet) 
![OCI-INLAB-C](../img/inlab-01/OCI-INLAB-C.png)

## LAB-01 #4 - Adjuntar Block Volume
Attach 2 block volumes to both instances through iSCSI protocol.

![OCI-INLAB-D](../img/inlab-01/OCI-INLAB-D.png)
