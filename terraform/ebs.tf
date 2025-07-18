resource "aws_ebs_volume" "ebs_ec2_01" {
  availability_zone = var.az_1  # 使用变量代替硬编码的可用区
  size              = 20
  type              = "gp3"
  tags = {
    Name = "ebs-ec2-01"
  }
}

resource "aws_ebs_volume" "ebs_ec2_02" {
  availability_zone = var.az_2
  size              = 20
  type              = "gp3"
  tags = {
    Name = "ebs-ec2-02"
  }
}