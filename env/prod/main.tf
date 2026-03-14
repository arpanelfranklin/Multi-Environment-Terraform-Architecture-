## local variable
locals {
  vpc-id = module.vpc.vpc-id
  subnets-id = module.vpc.public-subnet-id
}
module "vpc" {
  source = "../../modules/vpc"
  env = var.env
  cidr = var.cidr
  public-subnets = var.private-subent
  private-subnets = var.private-subent
  azs = var.azs
  intra-subnets = var.intra-subnet
}
module "s3" {
  source = "../../modules/s3"
  env = var.env
}
module "ec2" {
  source = "../../modules/ec2"
  env = var.env
  subnets-id = local.subnets-id
  vpc-id = local.vpc-id
  ami = var.ami
  instance-count = var.instance-count
  instance-type = var.instance-type
  instance-volume-size = var.instance-volume-size
  instance-volume-type = var.instance-volume-type
  public-subnet-id = module.vpc.public-subnet-id

}
module "dynamoDB" {
  source = "../../modules/dynamoDB"
  env = var.env
  billing-mode = var.billing-mode
  
}