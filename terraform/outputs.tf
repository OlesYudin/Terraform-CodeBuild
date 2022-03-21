# Output VPC CIDR
output "vpc_ip" {
  value = module.cluster.vpc_ip
}
# # Output Public Elastic IP
# output "eip_public_ip" {
#   value = module.cluster.eip_public_ip
# }
# Output DNS name of ALB
output "alb_dns" {
  value = module.cluster.alb_dns
}
# Output AWS account ID
output "account_id" {
  value = module.ecr.account_id
}
# Output registry URL
output "registry_url" {
  value = module.ecr.registry_url
}
# Output URL of S3 Bucket for tf_state
output "s3_url_tf_state" {
  value = module.cluster.s3_url_tf_state
}
# Output URL of S3 Bucket for codebuild cache
output "s3_url_codebuild_cache" {
  value = module.codebuild.s3_url_codebuild_cache
}
