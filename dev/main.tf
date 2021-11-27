module "network-provision" {
  source = "../module/network"
  sgname = var.sgname
  ipblock = var.ipblock
  pub_sub = var.pub_subnet
  sg-tag = var.sg-tag
  pub_sub_tag = var.pub-sub-tag
}
module "instance-provision" {
  source = "../module/instance"
  ins-tag = var.ins-tag
  devami = var.devami
  ins_type = var.ins_type
}