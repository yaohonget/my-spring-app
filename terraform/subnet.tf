resource "aws_subnet" "tf_subnet01" {
	vpc_id = aws_vpc.tf_vpc.id
	cidr_block = "10.10.1.0/24"
	availability_zone = var.az_1
	tags = {
		Name = "tf-subnet01"
	}
}

resource "aws_subnet" "tf_subnet02" {
	vpc_id = aws_vpc.tf_vpc.id
	cidr_block = "10.10.2.0/24"
	availability_zone = var.az_2
	tags = {
		Name = "tf-subnet02"
	}
}