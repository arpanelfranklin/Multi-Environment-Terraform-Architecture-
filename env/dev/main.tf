module "vpc" {
  source = "../../modules/vpc"
  env = var.env
  azs = var.azs
  cidr = var.cidr
  private-subnets = var.private-subent 
  public-subnets = var.public-subnet
  intra-subnets = var.intra-subnet
}
module "ec2" {
  source = "../../modules/ec2"
  env = var.env
  vpc-id = var.vpc-id
  subnets-id = var.subnets-id
  ami = var.ami
  instance-count = var.instance-count
  instance-type = var.instance-type
  instance-volume-size = var.instance-volume-size
  instance-volume-type = var.instance-volume-type
}
module "s3" {
  source = "../../modules/s3"
  env = var.env
}
module "dynamoDB" {
  source = "../../modules/dynamoDB"
  billing-mode = var.billing-mode
  env = var.env
}