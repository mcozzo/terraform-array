# terraform-array

## Because shit's broken

* https://github.com/hashicorp/terraform/issues/2114
* https://www.terraform.io/docs/configuration/resources.html

## What I want to work:
```
variable "servers" {
  default = [
    {
      name = "server1"
      ip   = "1.2.3.4"
    },
    {
      name = "server2"
      ip   = "1.2.3.4"
    }
  ]
}

resource "null_resource" "dynamic_self" {
  for_each = var.servers

  provisioner "local-exec" {
    command = "echo ${each[name].value}"
    command = "echo ${each[ip].value}"
  }
}
```
