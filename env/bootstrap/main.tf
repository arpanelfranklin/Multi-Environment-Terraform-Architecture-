## creting s3 bucket 
module "s3" {
  source = "../../modules/s3"
  name = "afd-terraform-state-lock"
}
module "dynamodb" {
  source = "../../modules/dynamoDB"
  name = "afd-terraform-state-lock"
  billing-mode = "PAY_PER_REQUEST"
}
resource "aws_s3_bucket_versioning" "enabled" {
  bucket = module.s3.bucket-id
  versioning_configuration {
    status = "Enabled"
  }
}
