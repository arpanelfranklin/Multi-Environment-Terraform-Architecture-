resource "aws_dynamodb_table" "infra-dynamo-table" {
  name = "${var.env}-dynamodb-table"
  billing_mode = var.billing-mode
  hash_key = "LockId"

  attribute {
    name = "LockId"
    type = "S"
  }

  tags = {
    name = "${var.env}-dynamodb-table"
    environment = var.env
  }
}