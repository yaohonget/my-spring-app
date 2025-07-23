resource "aws_eks_node_group" "node_group1" {
  cluster_name    = aws_eks_cluster.tf-eks.name
  node_group_name = "node_group1"
  ami_type        = "AL2023_x86_64_STANDARD"
  capacity_type   = "ON_DEMAND"
  disk_size       = 20
  instance_types   = ["t3.medium"]
  node_role_arn   = aws_iam_role.eks-nodegroup-role.arn
  subnet_ids = [
      aws_subnet.tf_eks_subnet1.id,
      aws_subnet.tf_eks_subnet2.id
    ]

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-nodegroup-role-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-nodegroup-role-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-nodegroup-role-AmazonEC2ContainerRegistryReadOnly,
  ]

  remote_access {
    ec2_ssh_key = aws_key_pair.tf-keypair.key_name
    source_security_group_ids = [
	   aws_security_group.tf_security_group.id
    ]
  } 
}