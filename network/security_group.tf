# security group

resource "yandex_vpc_security_group" "kubernetes_security_group" {
  name        = "kubernetes-security-group"
  description = "kubernetes security group"
  network_id  = yandex_vpc_network.apsara_network.id


  dynamic "ingress" {
    for_each = [22, 6443]
    content {
      port           = ingress.value
      protocol       = "TCP"
      v4_cidr_blocks = ["x.x.x.x/32"]
      description    = "access from bastion"
    }
  }

  dynamic "ingress" {
    for_each = [443, 6443]
    content {
      port           = ingress.value
      protocol       = "TCP"
      v4_cidr_blocks = ["x.x.x.x/32"]
      description    = "access from load balancer"
    }
  }

  ingress {
    protocol       = "ANY"
    v4_cidr_blocks = ["10.10.0.0/16"]
    description    = "internal network (node to node)"
  }

  ingress {
    protocol       = "ANY"
    v4_cidr_blocks = ["10.200.0.0/16"] # 
    description    = "calico cni (pod to pod)"
  }

  egress {
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
    description    = "outbound traffic"
  }
}
