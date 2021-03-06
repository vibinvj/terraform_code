sgname = "devsg"
ipblock = ["0.0.0.0/0", "10.0.1.0/24"]
ins-tag = {
  name = "devinc"
  env = "dev"
  version = 1.0
}
devami = "ami-04ad2567c9e3d7893"
pub_subnet = "10.0.1.0/24"
pub_sub_2 = "10.0.3.0/24"
pub_sub_3 = "10.0.4.0/24"
ins_type = "t2.small"
sg-tag = {
  name = "devsg"
  env = "dev"
}
pub-sub-tag = {
  name = "pub-sub"
  env = "dev"
}
devvpc = "10.0.0.0/16"
vpc-tag = {
  name = "devvpc"
  env = "dev"
}
pri_subnet = "10.0.2.0/24"
pri_sub_tag = {
  name = "pri_sub"
  env = "dev"
}
devigw = {
  name = "devigw"
  env = "dev"
}
routetag = {
  name = "routedev"
  env = "dev"
}
pub_pri_Ip = "10.0.1.10"
pri_pri_Ip = "10.0.2.10"
vol_size = 1
az_zone = "us-east-1a"
eksname = "devcluster"
eksversion = "1.21"
ekstag = {
  name = "eks"
  env = "dev"
}
