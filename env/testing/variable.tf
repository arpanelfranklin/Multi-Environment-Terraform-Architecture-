variable "env" {
  default = "test"
  type = string
}
#VPC
variable "cidr" {
  default = "10.20.0.0/16"
  type = string
}
variable "azs" {
  default = ["us-east-2a", "us-east-2b"]
  type = list(string)
}
variable "nat-gateway" {
  default = true
  type = bool
}
variable "public-subent" {
  default = ["10.20.101.0/24", "10.20.102.0/24", "10.20.103.0/24"]
  type = list(string)
}
variable "private-subnet" {
  default = ["10.20.1.0/24", "10.20.2.0/24", "10.20.3.0/24"]
  type = list(string)
}
variable "intra-subnet" {
  default = ["10.20.5.0/24","10.20.6.0/24","10.20.7.0/24"]
  type = list(string)
}

##VPC variable
variable "billing-mode" {
  default = "PAY_PER_REQUEST"
  type = string
}

##Ec2 variable
# variable "vpc-id" {
#   default = module.vpc.vpc-id
#   type = string
# }
# variable "subnets-id" {
#   default = module.vpc.subnets-id
#   type = string
# }
variable "ami" {
  default = "ami-06e3c045d79fd65d9"
  type = string
}
variable "instance-count" {
  default = 1
  type = number
}
variable "instance-type" {
  default = "t3.micro"
  type = string
}
variable "instance-volume-size" {
  default = 15
  type = number
}
variable "instance-volume-type" {
  default = "gp3"
  type = string
}
