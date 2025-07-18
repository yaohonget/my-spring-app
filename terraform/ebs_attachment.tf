resource "aws_volume_attachment" "attach_ebs_to_ec2_01" {
  device_name = "/dev/xvdh"                # 设备名称，可根据需求更改
  volume_id   = aws_ebs_volume.ebs_ec2_01.id
  instance_id = aws_instance.tf-ec2-01.id
}

resource "aws_volume_attachment" "attach_ebs_to_ec2_02" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs_ec2_02.id
  instance_id = aws_instance.tf-ec2-02.id
}