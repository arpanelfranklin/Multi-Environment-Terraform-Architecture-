resource "aws_s3_bucket" "infra-bucket" {
  bucket = "${var.name}-s3-bucket-afd"
  region = "us-east-2"
  tags = {
    name = "${var.name}-s3-bucket-afd"
  }
}