output "vpc-id" {
  value = module.vpc.vpc_id
}
output "public-subnet-id" {
  value = module.vpc.public_subnets[0]
}