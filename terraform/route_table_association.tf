resource "aws_route_table_association" "tf_route_table_association_01" {
	subnet_id = aws_subnet.tf_subnet01.id
	route_table_id = aws_route_table.tf_route_table.id
}

resource "aws_route_table_association" "tf_route_table_association_02" {
	subnet_id = aws_subnet.tf_subnet02.id
	route_table_id = aws_route_table.tf_route_table.id
}