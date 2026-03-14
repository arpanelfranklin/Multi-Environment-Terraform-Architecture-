#local variable
locals{
  vpc-id = module.vpc.vpc-id
  subnets-id = module.vpc.public-subnet-id
}
module "vpc" {
  source = "..//../modules/vpc"
  env = var.env
  cidr = var.cidr
  azs = var.azs
  nat-gateway = var.nat-gateway
  intra-subnets = var.intra-subnet
  public-subnets = var.public-subent
  private-subnets = var.private-subnet
}
## Ec2
module "ec2"{
    source = "../../modules/ec2"
    env = var.env
    instance-count = var.instance-count
    instance-type = var.instance-type
    instance-volume-size = var.instance-volume-size
    instance-volume-type = var.instance-volume-type
    vpc-id = local.vpc-id
    subnets-id = local.subnets-id
    ami = var.ami
    public-subnet-id = module.vpc.public-subnet-id
}