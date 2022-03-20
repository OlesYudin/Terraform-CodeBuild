# TFstate s3
resource "aws_s3_bucket" "terraform_state" {
  bucket = "tfstate-demo-tfstate-s3-${var.env}"
  # Enable versioning
  versioning {
    enabled = true
  }
  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
# DynamoDB lock for tfstate
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "demo-dynamodb-lock-${var.env}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
