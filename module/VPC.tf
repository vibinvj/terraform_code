resource "aws_vpc" "glb_vpc" {
  cidr_block = var.devvpc
  tags = var.vpc-tag
}
resource "aws_subnet" "glb_pub_sub" {
  cidr_block = var.pub_subnet
  vpc_id     = aws_vpc.glb_vpc.id
  tags = var.pub-sub-tag
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  depends_on = [aws_vpc.glb_vpc]
}
resource "aws_subnet" "glb_pub_sub_2" {
  cidr_block = var.pub_sub_2
  vpc_id     = aws_vpc.glb_vpc.id
  tags = var.pub-sub-tag
  availability_zone = "us-east-1c"
  map_public_ip_on_launch = true
  depends_on = [aws_vpc.glb_vpc]
}
resource "aws_subnet" "glb_pub_sub_3" {
  cidr_block = var.pub_sub_3
  vpc_id     = aws_vpc.glb_vpc.id
  tags = var.pub-sub-tag
  map_public_ip_on_launch = true
  availability_zone = "us-east-1d"
  depends_on = [aws_vpc.glb_vpc]
}

#resource "aws_subnet" "glb_pri_sub" {
#  cidr_block = var.pri_subnet
#  vpc_id     = aws_vpc.glb_vpc.id
#  tags = var.pri_sub_tag
#  availability_zone = "us-east-1b"
#  depends_on = [aws_vpc.glb_vpc]
#}

resource "aws_internet_gateway" "glb_igw" {
  vpc_id = aws_vpc.glb_vpc.id
  tags = var.devigw
  depends_on = [aws_vpc.glb_vpc]
}
resource "aws_route_table" "glb_route" {
  vpc_id = aws_vpc.glb_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.glb_igw.id
  }
  tags = var.routetag
  depends_on = [aws_vpc.glb_vpc]
}
resource "aws_route_table_association" "glb_RT_attach" {
  route_table_id = aws_route_table.glb_route.id
  subnet_id = aws_subnet.glb_pub_sub.id
}
resource "aws_route_table_association" "glb_Rt-attach1" {
  route_table_id = aws_route_table.glb_route.id
  subnet_id = aws_subnet.glb_pub_sub_2.id
}

resource "aws_route_table_association" "glb_rt-attach2" {
  route_table_id = aws_route_table.glb_route.id
  subnet_id = aws_subnet.glb_pub_sub_3.id
}

#resource "aws_route_table" "glb_pri_route" {
#  vpc_id = aws_vpc.glb_vpc.id
#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = aws_nat_gateway.glb_nat.id
#  }
#  depends_on = [aws_vpc.glb_vpc]
#}
#resource "aws_route_table_association" "glb_pri_RT_attach" {
#  route_table_id = aws_route_table.glb_pri_route.id
#  subnet_id = aws_subnet.glb_pri_sub.id
#  depends_on = [aws_route_table.glb_pri_route]
#}
#resource "aws_eip" "glb_eip" {
#  vpc = true
#}
#resource "aws_nat_gateway" "glb_nat" {
#  allocation_id = aws_eip.glb_eip.id
#  subnet_id = aws_subnet.glb_pub_sub.id
#  depends_on = [aws_vpc.glb_vpc]
#}

resource "aws_security_group" "glb_sg" {
  name = var.sgname
  vpc_id = aws_vpc.glb_vpc.id
  ingress {
    from_port = 22
    protocol  = "TCP"
    to_port   = 22
    cidr_blocks = var.ipblock
  }
  ingress {
    from_port = 80
    protocol  = "TCP"
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    protocol  = "TCP"
    to_port   = 443
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = var.sg-tag
}
resource "aws_key_pair" "glb_keypair" {
  key_name   = "testvibin-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDTIvWNXuX50Q2VGQ0gV1/aWIGwySU9/bVvnewYnbHCI0ZANBo8MwAaAhWm4tmcQWl/SheHZDuJ8xHI/bf69x2DVQDP4Bqsrbxvm9kFUo+I0nXpJh3xKlk5pRf8VXX2u9V7vEpmynXYQMWI2PsiyTNYMqC33lgN0HLHUwLdwGcTGbUOeRdXkz5QA0EdO4Qfp2/xNTW4h2iwth+8ChTSVv8xbUcS96vpDyJnc+1ZHXL84aOQN7AESGbeup9dlJw2ydNfzuhz21JeEAlg2Jp7pB+96L55FB0sozw8AfddsSWUvCtASk6tSbCDTjQ5Z3brOXf12rR05/nz6qZqtvXMBW5M+/eql+ZQFusvTvDOAlVfQPfAdkMhEcoOdDRPsUNknkvzyu34UVjT3hAQdAYgDuaMAdcJLigVTwirFqGKHGAl/JTAOjBXzDzi9EFr+QumyvwY34+3aJkY7V6XCldYf73BW4z33HHpJ1XIjgIaBe0linZozdHRR0WhTMlez2ixiE8= HAI@DESKTOP-2KAJDDS"
}