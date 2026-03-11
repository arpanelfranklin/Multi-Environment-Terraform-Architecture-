variable "env" {
  description = "enviornment of dev"
  default = "dev"
  type = string
}
# vpc module variables
variable "cidr" {
  default = "10.0.0.0/16"
  type =string
}
variable "azs" {
  default = ["us-east-2a", "us-east-2b"]
  type = list(string)
}

variable "private-subent" {
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  type = list(string)
}
variable "public-subnet" {
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  type = list(string)
}
variable "intra-subnet" {
  default = ["10.0.5.0/24","10.0.6.0/24"]
  type = list(string)
}
variable "nat-gateway" {
  default = false
  type = bool
}


# ec2 module variables
variable "vpc-id" {
  description = "vpc id"
  default = module.vpc.vpc-id
  type = string
}
variable "subnets-id" {
  description = "subnets id of vpc"
  default = module.vpc.public-subnet-id
  type = string
}
variable "ingress-rules" {
  description = "this is the ingress rule"
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
      cidr_blocks = ["${module.ec2.instance-private-ip}/32"] # Secure SSH access
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
variable "instance-count" {
  default = 1
  type = number
}
variable "ami" {
  default = "ami-06e3c045d79fd65d9"
  type = string 
}
variable "instance-type" {
  default = "t3.medium"
  type = string
}
variable "instance-volume-size" {
  default = 25
  type = number
}
variable "instance-volume-type" {
  default = "gp3"
  type = string
}
## dynamoDB variable
variable "billing-mode" {
  default = "PAY_PER_REQUEST"
  type = string
}