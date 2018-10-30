data "extip" "external_ip" {}

output "external_ip" {
  value = "${data.extip.external_ip.ipaddress}"
}

resource "null_resource" "cluster" {
  provisioner "local-exec" {
    command = "echo CowaBanga"
  }
}
