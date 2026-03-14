resource "aws_dynamodb_table" "infra-dynamo-table" {
  name = "${var.name}-dynamodb-table"
  billing_mode = var.billing-mode
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    name = "${var.name}-dynamodb-table"
  }
}