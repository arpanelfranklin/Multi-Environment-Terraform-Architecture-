resource "aws_s3_bucket" "infra-bucket" {
  bucket = "${var.env}-s3-bucket-afd"
  region = "us-east-2"
  tags = {
    name = "${var.env}-s3-bucket-afd"
    environment = var.env
  }
}