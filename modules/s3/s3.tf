resource "aws_s3_bucket" "infra-bucket" {
  bucket = "${var.env}-s3-bucket"
  tags = {
    name = "${var.env}-s3-bucket"
    environment = var.env
  }
}