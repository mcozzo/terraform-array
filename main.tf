resource "null_resource" "dynamic_self" {
  for_each = var.servers

  provisioner "local-exec" {
    command = "echo ${each.value["name"]}"
  }
}

#locals {
#servers = {
#  "server1" = {
#    name = "server1",
#    ip   = "1.2.3.4"
#  },
#  "server2" = {
#    name = "server1",
#    ip   = "1.2.3.4"
#  }
#}
#}

#variable "servers" {
#  default = [
#    {
#      name = "server1"
#      ip   = "1.2.3.4"
#    },
#    {
#      name = "server2"
#      ip   = "1.2.3.4"
#    }
#  ]
#}
#
