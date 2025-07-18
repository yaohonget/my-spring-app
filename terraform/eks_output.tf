# 输出 EKS 集群的名称
output "eks_cluster_name" {
  value = aws_eks_cluster.tf-eks.name
  description = "The name of the EKS cluster"
}

# 输出 EKS 集群的 ARN（Amazon Resource Name）
output "eks_cluster_arn" {
  value = aws_eks_cluster.tf-eks.arn
  description = "The ARN of the EKS cluster"
}

# 输出 EKS 集群的 API 服务器端点
output "eks_cluster_endpoint" {
  value = aws_eks_cluster.tf-eks.endpoint
  description = "The endpoint of the EKS cluster"
}

# 输出 EKS 集群的当前状态
output "eks_cluster_status" {
  value = aws_eks_cluster.tf-eks.status
  description = "The status of the EKS cluster"
}

# 输出与 EKS 集群关联的 VPC ID
output "eks_cluster_vpc_id" {
  value = aws_eks_cluster.tf-eks.vpc_config[0].vpc_id
  description = "The VPC ID associated with the EKS cluster"
}

# 输出与 EKS 集群关联的安全组 ID
output "eks_cluster_security_group_ids" {
  value = aws_eks_cluster.tf-eks.vpc_config[0].cluster_security_group_id
  description = "The security group IDs associated with the EKS cluster"
}

# 输出用于访问 EKS 集群的 kubeconfig 配置
output "kubeconfig" {
  value = <<EOT
apiVersion: v1
clusters:
- cluster:
    server: ${aws_eks_cluster.tf-eks.endpoint}
    certificate-authority-data: ${aws_eks_cluster.tf-eks.certificate_authority[0].data}
  name: ${aws_eks_cluster.tf-eks.name}
contexts:
- context:
    cluster: ${aws_eks_cluster.tf-eks.name}
    user: ${aws_eks_cluster.tf-eks.name}
  name: ${aws_eks_cluster.tf-eks.name}
current-context: ${aws_eks_cluster.tf-eks.name}
kind: Config
preferences: {}
users:
- name: ${aws_eks_cluster.tf-eks.name}
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1beta1
      command: aws
      args:
        - eks
        - get-token
        - --cluster-name
        - ${aws_eks_cluster.tf-eks.name}
EOT
  description = "Kubeconfig for accessing the EKS cluster"
}