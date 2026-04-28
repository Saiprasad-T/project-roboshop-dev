locals {
    pub_ip = "${chomp(data.http.my_public_ip.response_body)}/32"
    bastion = data.aws_ssm_parameter.bastion_sg_id.value
    mongodb = data.aws_ssm_parameter.mongodb_sg_id.value
    redis = data.aws_ssm_parameter.redis_sg_id.value
    mysql = data.aws_ssm_parameter.mysql_sg_id.value
    rabbitmq = data.aws_ssm_parameter.rabbitmq_sg_id.value
    ingress_alb = data.aws_ssm_parameter.ingress_alb_sg_id.value
    eks_control_plane = data.aws_ssm_parameter.eks_control_plane.value
    eks_node = data.aws_ssm_parameter.eks_node.value
}