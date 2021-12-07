// public instance with attached volume
resource "aws_instance" "glb_ins" {
  ami = var.devami
  instance_type = var.ins_type
  subnet_id = "${aws_subnet.glb_pub_sub.id}"
  availability_zone = var.az_zone
  private_ip = var.pub_pri_Ip
  vpc_security_group_ids = ["${aws_security_group.glb_sg.id}"]
  iam_instance_profile = aws_iam_instance_profile.glb_ins_profile.id
  associate_public_ip_address = true
  key_name = aws_key_pair.glb_keypair.key_name
  #  security_groups = ["${aws_security_group.glb_sg.name}"]
  user_data = "${file("http_config.sh")}"
  tags = var.ins-tag
  depends_on = [aws_vpc.glb_vpc]
}
resource "aws_volume_attachment" "elb_ebs_attach" {
  device_name = "/dev/sdb"
  instance_id = aws_instance.glb_ins.id
  volume_id   = aws_ebs_volume.glb_ebs_vol.id
}

// private Instance
resource "aws_instance" "glb_pri_ins" {
  ami = var.devami
  instance_type = var.ins_type
  subnet_id = "${aws_subnet.glb_pri_sub.id}"
  private_ip = var.pri_pri_Ip
  vpc_security_group_ids = ["${aws_security_group.glb_sg.id}"]
  iam_instance_profile = aws_iam_instance_profile.glb_ins_profile.id
  key_name = aws_key_pair.glb_keypair.key_name
  #security_groups = ["${aws_security_group.gxlb_sg.name}"]
  tags = var.ins-tag
  depends_on = [aws_vpc.glb_vpc, aws_nat_gateway.glb_nat]
}
