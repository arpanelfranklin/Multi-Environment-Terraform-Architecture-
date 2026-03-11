variable "env" {
  description = "this is the environment of dev"
  type = string
}

# variable of vpc

variable "cidr" {
  description = "this is the cidr for vpc"
  type = string
}
variable "azs" {
  description = "this is the azs for vpc"
  type= list(string)
}
variable "private-subnets" {
  description = "this is the private subnets for vpc"
  type = list(string)
}
variable "public-subnets" {
  description = "this is the public subnets for vpc"
  type = list(string)
}
variable "intra-subnets" {
  description = "this is the intra subnets for vpc"
  type = list(string)
}
variable "nat-gateway" {
  description = "this is the nat gateway by default false"
  type = bool
  default = false
}