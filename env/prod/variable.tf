variable "env" {
  default = "prod"
  type = string
}
# vpc variable 
variable "cidr" {
  default = "10.30.0.0/16"
  type = string
}
variable "private-subent" {
  default = ["10.30.1.0/24", "10.30.2.0/24", "10.30.3.0/24"]
  type = list(string)
}
variable "public-subnet" {
  default = ["10.30.101.0/24", "10.30.102.0/24", "10.30.103.0/24"]
  type = list(string)
}
variable "intra-subnet" {
  default = ["10.30.5.0/24","10.30.6.0/24","10.30.7.0/24"]
  type = list(string)
}
variable "nat-gateway" {
  default = true
  type = bool
}
variable "azs" {
  default = ["us-east-2a", "us-east-2b", "us-east-2c"]
  type = list(string)
}

#ec2 vaiable
# variable "vpc-id" {
#   default = module.vpc.vpc-id
#   type = string
# }
# variable "public-subent-id" {
#   default = module.vpc.public-subnet-id
#   type = string
# }
variable "instance-count" {
  default = 3
  type = number
}
variable "instance-type" {
  default = "t3.micro"
  type = string
}
variable "security-group" {
  default = [{
      port        = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] # Public HTTP testing
    },
    {
      port        = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] # Public HTTPS testing
    },
    {
      port        = 22
      protocol    = "tcp"
      # cidr_blocks = ["${module.ec2.instance-private-ip}/32"] # Secure SSH access
    },
    {
      port        = 8080
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] # for Jenkins
    },
    {
      port        = 3000
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] # for backend kubernates service
    }]
}
variable "ami" {
  default = "ami-06e3c045d79fd65d9"
  type = string
}
variable "instance-volume-size" {
  default = 30
  type = number
}
variable "instance-volume-type" {
  default = "gp3"
  type = string
}
# dynamoDB variable
variable "billing-mode" {
  default = "PAY_PER_REQUEST"
  type = string
}