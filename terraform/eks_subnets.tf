resource "aws_subnet" "tf_eks_subnet1" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = "10.10.81.0/24"
  availability_zone = var.az_1
  map_public_ip_on_launch = true

  tags = {
    Name = "tf_eks_subnet1"
  }
}

resource "aws_subnet" "tf_eks_subnet2" {
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = "10.10.82.0/24"
  availability_zone = var.az_2
  map_public_ip_on_launch = true

  tags = {
    Name = "tf_eks_subnet2"
  }
}


# 将路由表关联到子网tf_eks_subnet1
resource "aws_route_table_association" "tf_eks_subnet1_association" {
  subnet_id      = aws_subnet.tf_eks_subnet1.id 
  route_table_id = aws_route_table.tf_route_table.id
}

# 将路由表关联到子网tf_eks_subnet2
resource "aws_route_table_association" "tf_eks_subnet2_association" {
  subnet_id      = aws_subnet.tf_eks_subnet2.id  
  route_table_id = aws_route_table.tf_route_table.id
}