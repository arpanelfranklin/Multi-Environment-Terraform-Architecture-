terraform {
  backend "s3" {
    name = "${var.env}-s3-bucket"
    key = "terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "${var.env}-dynamodb-table"
  }
}