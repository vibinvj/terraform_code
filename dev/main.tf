
module "dev_env" {
  source = "../module"
  devami = var.devami
  ins_type = var.ins_type
  pub_pri_Ip = var.pub_pri_Ip
  ins-tag = var.ins-tag
  vol_size = var.vol_size
  az_zone = var.az_zone
  devigw = var.devigw
  devvpc = var.devvpc
  pri_pri_Ip = var.pri_pri_Ip
  pri_sub_tag = var.pri_sub_tag
  pri_subnet = var.pri_subnet
  pub-sub-tag = var.pub-sub-tag
  pub_sub_2 = var.pub_sub_2
  pub_sub_3 = var.pub_sub_3
  pub_subnet = var.pub_subnet
  routetag = var.routetag
  sg-tag = var.sg-tag
  vpc-tag = var.vpc-tag
}