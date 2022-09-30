---
# LAB-01 - OCI-INLAB laboratory - 
For this lab, you can take the following architecture as reference, also you should consider 
can check the [Oracle Architecture Center](https://docs.oracle.com/solutions/?q=terraform&cType=reference-architectures&sort=date-desc&lang=en) for more advanced examples of architectures to use through terraform.

![Image_tile](../img/OCI-INLAB-01.png)

## LAB-01 #1 - VCN, route tables and subnet related creation
Elements to create:
1. Create VCN 
2. Create subnet
3. Internet Gateway creation and route table associated
4. Link the routable created with the subnet created

![Image title](img/OCI-INLAB-A.png)

## LAB-01 #2 - Creación de Instancias
1. Creación de 2 instancias 
2. Cada instancia tiene un nombre diferente. Ex: server-1 y server-2

![Image title](img/OCI-INLAB-B.png)

## LAB-01 #3 - Crear Security Lists
1. Crear tres reglas de ingreso en la lista de Seguridad
- Pto. TCP 22 (Acceso SSH)
- Pto. TCP 8080 (Ejemplo proxy Web – NO IMPLEMENTADO)
- Pto. TCP 3620 (Conectividad iSCSI)

2. Una regla de egreso general para la salida
- Segmento 0.0.0.0/0 (Todo internet) 
![Image title](img/OCI-INLAB-C.png)

## LAB-01 #4 - Adjuntar Block Volume
Adjuntar los 2 block volumes a las 2 instancias mediante protocolo iSCSI.

![Image title](img/OCI-INLAB-D.png)
