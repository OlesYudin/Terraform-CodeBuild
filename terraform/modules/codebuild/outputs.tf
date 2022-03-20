# Ouput url of s3 bucket for tf_state
output "s3_url_codebuild_cache" {
  value = aws_s3_bucket.codebuild_cache.bucket_regional_domain_name
}
