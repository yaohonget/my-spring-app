variable "aws_region" {
	default = "us-east-1"
}

variable "az_1" {
	description = "Availability Zone for the first subnet"
	type = string
	default = "us-east-1a"
}

variable "az_2" {
	description = "Availability Zone for the second subnet"
	type = string
	default = "us-east-1c"
}

variable "amazon_linux_ami" {
  description = "AMI ID for Amazon Linux"
  type        = string
  default     = "ami-0150ccaf51ab55a51"  # 替换为你的Amazon Linux AMI ID
}

variable "ubuntu_ami" {
  description = "AMI ID for Ubuntu"
  type        = string
  default     = "ami-020cba7c55df1f615"  # 替换为你的Ubuntu 24.04 AMI ID
}

variable "eks_version" {
	description = "EKS Version"
  type        = string
  default     = "1.33"
}