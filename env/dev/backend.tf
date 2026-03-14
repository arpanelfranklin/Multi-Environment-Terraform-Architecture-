# terraform {
#   backend "s3" {
#     bucket = "dev-s3-bucket"
#     key = "terraform.tfstate"
#     region = "us-east-2"
#     dynamodb_table = "dev-dynamodb-table"
#     use_lockfile = true
#   }
# }