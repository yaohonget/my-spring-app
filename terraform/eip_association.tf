# 关联 EIP 到 tf-ec2-01 实例
resource "aws_eip_association" "tf_eip_association_01" {
  instance_id   = aws_instance.tf-ec2-01.id
  allocation_id = aws_eip.tf_eip_01.id
}

# 关联 EIP 到 tf-ec2-02 实例
resource "aws_eip_association" "tf_eip_association_02" {
  instance_id   = aws_instance.tf-ec2-02.id
  allocation_id = aws_eip.tf_eip_02.id
}