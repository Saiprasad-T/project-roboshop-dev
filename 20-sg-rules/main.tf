#bastion to internet

resource "aws_security_group_rule" "bastion_internet" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [local.pub_ip]  #src
  security_group_id = local.bastion #destination 
}
#======================================================

#mongodb to bastion
resource "aws_security_group_rule" "mongodb_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion
  security_group_id = local.mongodb
}

resource "aws_security_group_rule" "mongodb_bastion_db" {
  type                     = "ingress"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  source_security_group_id = local.bastion
  security_group_id        = local.mongodb
}

resource "aws_security_group_rule" "redis_bastion_db" {
  type                     = "ingress"
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
  source_security_group_id = local.bastion
  security_group_id        = local.redis
}

resource "aws_security_group_rule" "rabbitmq_bastion_db" {
  type                     = "ingress"
  from_port                = 5672
  to_port                  = 5672
  protocol                 = "tcp"
  source_security_group_id = local.bastion
  security_group_id        = local.rabbitmq
}

resource "aws_security_group_rule" "mysql_bastion_db" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = local.bastion
  security_group_id        = local.mysql
}
#redis to bastion
resource "aws_security_group_rule" "redis_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion
  security_group_id = local.redis
}
#==============================================================
#mysql to bastion
resource "aws_security_group_rule" "mysql_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion
  security_group_id = local.mysql
}
#rabbitmq to bastion
resource "aws_security_group_rule" "rabbitmq_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion
  security_group_id = local.rabbitmq
}

resource "aws_security_group_rule" "ingress_alb_internet" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
 /*  source_security_group_id = local.backend_alb */
 cidr_blocks       = ["0.0.0.0/0"] 
  security_group_id = local.ingress_alb
}

resource "aws_security_group_rule" "eks_control_plane_bastion" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  source_security_group_id = local.bastion
  security_group_id = local.eks_control_plane
}

resource "aws_security_group_rule" "eks_node_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = local.bastion
  security_group_id = local.eks_node
}

resource "aws_security_group_rule" "eks_node_eks_control_plane" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  source_security_group_id = local.eks_node
  security_group_id = local.eks_control_plane
}

resource "aws_security_group_rule" "eks_control_plane_eks_node" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  source_security_group_id = local.eks_control_plane
  security_group_id = local.eks_node
}

resource "aws_security_group_rule" "eks_node_eks_node" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  source_security_group_id = local.eks_node
  security_group_id = local.eks_node
}

#instaed of providing access to all the things im using this

resource "aws_security_group_rule" "ingress_alb_eks_node" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id = local.ingress_alb
  security_group_id = local.eks_node
}

resource "aws_security_group_rule" "mongodb_eks_node" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  source_security_group_id = local.eks_node
  security_group_id = local.mongodb
}

resource "aws_security_group_rule" "redis_eks_node" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  source_security_group_id = local.eks_node
  security_group_id = local.redis
}

resource "aws_security_group_rule" "mysql_eks_node" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = local.eks_node
  security_group_id = local.mysql
}

resource "aws_security_group_rule" "rabbitmq_eks_node" {
  type              = "ingress"
  from_port         = 5672
  to_port           = 5672
  protocol          = "tcp"
  source_security_group_id = local.eks_node
  security_group_id = local.rabbitmq
}