#Autor: Ricardo David Carrillo Sanchez
#Goal: Generate self-signed certificates
openssl genrsa -out ca.key 2048
openssl req -config EXAMPLE.cnf  -new -key ca.key -out ca.csr
openssl x509 -req -in ca.csr -signkey ca.key -out ca.crt
openssl genrsa -out loadbalancer.key 2048
openssl req -config EXAMPLE.cnf -new -key loadbalancer.key -out loadbalancer.csr
openssl x509 -req -in loadbalancer.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out loadbalancer.crt -days 50000
openssl x509 -in loadbalancer.crt -text
