resource "local_file" "inventory" {
    filename    = "./host.ini"
    directory_permission = "0700"
    file_permission      = "0600"
    content     = <<EOF
    [frontend]
    ${oci_core_instance.test_instance[0].public_ip}

    [backend]
   ${oci_core_instance.test_instance[0].private_ip}
   EOF
}

resource "local_file" "add_ssh_key" {
    filename = "./add-ssh-key.sh"
    directory_permission = "0700"
    file_permission      = "0600"
    content = <<EOF
    echo "Adding SSH Key to each host:"
    ssh-add ~/.ssh/tf-private.key
    echo "Adding IPs"
    ssh-keyscan -H ${oci_core_instance.test_instance[0].public_ip}>> ~/.ssh/known_hosts
    EOF
}
