resource "aws_eks_cluster" "glb_eks" {
  name     = var.eksname
  role_arn = "arn:aws:iam::900571061375:role/devcluster"
  version = var.eksversion
  vpc_config {
    subnet_ids = ["${aws_subnet.glb_pub_sub.id}", "${aws_subnet.glb_pub_sub_2.id}", "${aws_subnet.glb_pub_sub_3.id}"]
    endpoint_public_access = true
  }
  tags = var.ekstag
}