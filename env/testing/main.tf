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

## S3 
module "s3" {
  source = "../../modules/s3"
  env = var.env
}
## DynamoDB
module "dynamoDB" {
  source = "../../modules/dynamoDB"
  env = var.env
  billing-mode = var.billing-mode
}

## Ec2
module "ec2"{
    source = "../../modules/ec2"
    env = var.env
    instance-count = var.instance-count
    instance-type = var.instance-type
    instance-volume-size = var.instance-volume-size
    instance-volume-type = var.instance-volume-type
    vpc-id = var.vpc-id
    subnets-id = var.subnets-id
    ami = var.ami
}