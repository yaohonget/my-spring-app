# 为 tf-ec2-01 创建 EIP
resource "aws_eip" "tf_eip_01" {
  vpc = true
  tags = {
    Name = "tf-eip-01"
  }
}

# 为 tf-ec2-02 创建 EIP
resource "aws_eip" "tf_eip_02" {
  vpc = true
  tags = {
    Name = "tf-eip-02"
  }
}