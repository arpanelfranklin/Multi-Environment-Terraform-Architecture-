terraform {
  backend "s3" {
    bucket = "afd-terraform-state-lock-s3-bucket-afd"
    key = "prod/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "afd-terraform-state-lock-dynamodb-table"
    use_lockfile = true
  }
}