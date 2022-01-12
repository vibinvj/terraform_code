resource "aws_eks_cluster" "glb_eks" {
  name     = var.eksname
  role_arn = "arn:aws:iam::900571061375:role/devcluster"
  version = var.eksversion
  vpc_config {
    subnet_ids = ["${aws_subnet.glb_pub_sub.id}", "${aws_subnet.glb_pub_sub_2.id}", "${aws_subnet.glb_pub_sub_3.id}"]
    endpoint_public_access = true
  }
  tags = var.ekstag
  depends_on = [aws_vpc.glb_vpc]
}
resource "aws_eks_node_group" "glb_eks_node" {
  cluster_name  = aws_eks_cluster.glb_eks.name
  node_role_arn = "arn:aws:iam::900571061375:role/eks_node"
  subnet_ids    = ["${aws_subnet.glb_pub_sub.id}", "${aws_subnet.glb_pub_sub_2.id}", "${aws_subnet.glb_pub_sub_3.id}"]
  instance_types = [var.ins_type]
#ami_type = "ami-04ad2567c9e3d7893"
  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 1
  }
  depends_on = [aws_eks_cluster.glb_eks]
}
