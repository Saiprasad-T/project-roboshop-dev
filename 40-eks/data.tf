data "aws_ssm_parameter" "vpc_id" {
    name = "/${var.project}/${var.environment}/vpc_id"
}

data "aws_ssm_parameter" "private_subnet_ids" {
    name = "/${var.project}/${var.environment}/private-snet"
}

data "aws_ssm_parameter" "eks_node_sg_id" {
    name = "/${var.project}/${var.environment}/eks-node-sg-id"
}

data "aws_ssm_parameter" "eks_control_plane_sg_id" {
    name = "/${var.project}/${var.environment}/eks-control-plane-sg-id"
}