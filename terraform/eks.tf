module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 20.0"
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.29"
  subnet_ids      = module.vpc.public_subnets
  vpc_id          = module.vpc.vpc_id

  cluster_endpoint_public_access = true

  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.medium"]
      desired_size   = 1
      max_size       = 2
      min_size       = 1
    }
  }

  tags = {
    Terraform = "true"
  }
}
