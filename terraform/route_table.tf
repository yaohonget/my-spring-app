resource "aws_route_table" "tf_route_table" {
	vpc_id = aws_vpc.tf_vpc.id
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.tf_igw.id
	}
	tags = {
		Name = "tf-route-table"
	}
}