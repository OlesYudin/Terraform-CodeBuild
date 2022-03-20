# Output VPC CIDR
output "vpc_ip" {
  value = aws_vpc.vpc.cidr_block
}
# # Output Public Elastic IP
# output "eip_public_ip" {
#   value = aws_eip.nat_eip.public_ip
# }
# Output DNS name of ALB
output "alb_dns" {
  value = aws_lb.alb.dns_name
}
# Ouput url of s3 bucket for tf_state
output "s3_url_tf_state" {
  value = aws_s3_bucket.terraform_state.bucket_regional_domain_name
}
