resource "aws_eks_cluster" "tf-eks" {
  name     = "tf-eks"
  version  = var.eks_version  # 指定 EKS 版本
  role_arn = aws_iam_role.eks-cluster.arn

  vpc_config {
    subnet_ids = [
	  aws_subnet.tf_eks_subnet1.id, 
	  aws_subnet.tf_eks_subnet2.id
	]
    security_group_ids      = [aws_security_group.eks_allow_all.id]    # 引用之前创建的安全组
    endpoint_public_access  = true     # 公有访问
    endpoint_private_access = true     # 私有访问
    public_access_cidrs = ["0.0.0.0/0"] # 允许从任何地方访问
  }
#  # 启用日志
#  enabled_cluster_log_types = [
#           "api",
#           "audit",
#           "authenticator",
#           "controllerManager",
#           "scheduler",
#  ]

  depends_on = [
    aws_iam_role_policy_attachment.eks-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks-cluster-AmazonEKSVPCResourceController,
  ]
}