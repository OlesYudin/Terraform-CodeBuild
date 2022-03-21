# ECS and ECR
variable "env" {}       # Environment for ECS
variable "app_name" {}  # App name for ECS
variable "image_tag" {} # Docker image tag
# Container repository
variable "registry_url" {
  description = "URL of repository that will push to ECS"
  type        = string
}

# Network
# CIDR for VPC
variable "cidr_vpc" {}
variable "public_subnet" {}  # CIDR for Public Subnet
variable "private_subnet" {} # CIDR for Private Subnet

# SG
variable "app_port" {}     # Default port for App
variable "sg_port_cidr" {} # Default port for ABastion Host
variable "default_cidr" {} # Default inbound CIDR block
