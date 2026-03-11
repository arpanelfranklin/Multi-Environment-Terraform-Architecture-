variable "env" {
  description = "this is the environment of dev"
  type = string
}

variable "vpc-id" {
  description = "this is the vpc id"
  type = string 
}
variable "subnets-id" {
  description = "this is the subnets id "
  type = string
}
variable "ingress-rules" {
  description = "this is the ingress rules"
  type = list(object({
    port = number 
    protocol = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      port        = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] # http port open for all 
    },
    {
      port        = 53
      protocol    = "udp"
      cidr_blocks = ["10.0.0.0/16"] # for domain name system
    },
    {
      port        = 22
      protocol    = "tcp"
      cidr_blocks = ["203.0.113.5/32"] # for SSH 
    }
  ]
}

variable "instance-count" {
  description = "the count of instance"
  type = number
}
variable "ami" {
  description = "the ami of the system"
  type = string
}
variable "instance-type" {
  description = "this is the instance type"
  type = string
}
variable "instance-volume-size" {
  description = "this is the instance volume size"
  type = number
}
variable "instance-volume-type" {
  description = "this is the instance volume type"
  type = string
}