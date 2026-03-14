module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
   name = "${var.env}-vpc"
   cidr = var.cidr

    # subnets 
   azs = var.azs
   private_subnets = var.private-subnets
   public_subnets = var.public-subnets
   intra_subnets = var.intra-subnets

   # vpc and nat gateway
   enable_vpn_gateway = true
   enable_nat_gateway = var.nat-gateway? true:false

   tags = {
    terraform = true
    environment = var.env
   }

}