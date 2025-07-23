resource "aws_security_group" "eks_allow_all" {
  name        = "eks_allow_all"
  description = "Security group that allows all inbound and outbound traffic"
  vpc_id      = aws_vpc.tf_vpc.id


  // 允许所有入站流量
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  // -1 表示所有协议
    cidr_blocks = ["0.0.0.0/0"]  // 允许来自所有 IP 的流量
  }

  // 允许所有出站流量
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  // -1 表示所有协议
    cidr_blocks = ["0.0.0.0/0"]  // 允许流量发送到所有 IP
  }
}