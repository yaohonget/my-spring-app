resource "aws_instance" "tf-ec2-01" {
  ami           = var.amazon_linux_ami
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.tf_subnet01.id
  key_name      = aws_key_pair.tf-keypair.key_name
  vpc_security_group_ids = [aws_security_group.tf_security_group.id]

  root_block_device {
    volume_size = 10
  }

  tags = {
    Name = "tf-ec2-01"
  }
}

resource "aws_instance" "tf-ec2-02" {
  ami           = var.ubuntu_ami
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.tf_subnet02.id 
  key_name      = aws_key_pair.tf-keypair.key_name
  vpc_security_group_ids = [aws_security_group.tf_security_group.id]

  root_block_device {
    volume_size = 10
  }

  tags = {
    Name = "tf-ec2-02"
  }
}