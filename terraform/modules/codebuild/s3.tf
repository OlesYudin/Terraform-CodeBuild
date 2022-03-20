# S3 bucker for codebuild
resource "aws_s3_bucket" "codebuild_cache" {
  bucket = "demo-codebuild-s3-${var.env}"
  acl    = "private"
  # Enable versioning in bucket
  versioning {
    enabled = true
  }
  # S3 policy for delete
  lifecycle_rule {
    id      = "Delete after 3 days"
    enabled = true
    expiration {
      days = 3
    }
  }

  tags = {
    Name        = "Demo-codebuild-s3-${var.env}"
    Environment = var.env
  }
}
