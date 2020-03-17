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

variable "servers" {
  type = map(string)
  default = [
    {
      server1 = "server1",
      server2 = "server2"
    }
  ]
}

resource "null_resource" "dynamic_self" {
  for_each = toset(var.servers)

  provisioner "local-exec" {
    command = "echo ${each.value}"
    #command = "echo ${var.servers[1].name}"
  }
}


locals {
  servers = [
    {
      name = "bob"
      ip   = "1.2.3.4"
    },
    {
      name = "Steve"
      ip   = "5.6.7.8"
    }
  ]
}



variable "dynamic_self_sg" {
  default = [
    {
      type      = "ingress"
      from_port = 22
      to_port   = 22
      protocol  = "tcp"
    },
    {
      type      = "ingress"
      from_port = 80
      to_port   = 80
      protocol  = "tcp"
    }
  ]
}

#resource "null_resource" "dynamic_self" {
#  for_each = var.dynamic_self_sg
#
#  provisioner "local-exec" {
#    command = "echo ${each.value}"
#  }
#}

#locals {
#  dynamic_self_sg = {
#    ssh = {
#      type      = "ingress"
#      from_port = 22
#      to_port   = 22
#      protocol  = "tcp"
#    }
#    http = {
#      type      = "ingress"
#      from_port = 80
#      to_port   = 80
#      protocol  = "tcp"
#    },
#  }
#}
#
#resource "null_resource" "dynamic_self" {
#  for_each = local.dynamic_self_sg
#
#  provisioner "local-exec" {
#    command = "echo ${each.value}"
#  }
#}

#resource "null_resource" "dynamic_self" {
#  for_each = var.servers
#
#  provisioner "local-exec" {
#    command = "echo ${each.value["name"]}"
#  }
#}

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
