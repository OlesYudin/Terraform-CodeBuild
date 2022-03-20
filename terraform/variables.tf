# Default for all infrastructure
# Default region where will be created infrastructure
variable "region" {
  description = "Default region"
  type        = string
}
# Default user that will push infrastructure to AWS
variable "profile" {
  description = "Default AWS profile"
  type        = string
}
# Default environments
variable "env" {
  description = "Default environment"
  type        = string
}


# VPC
# Default VPC CIDR
variable "cidr_vpc" {
  description = "CIDR of VPC"
  type        = string
}
# Default public subnets for VPC
variable "public_subnet" {
  description = "Public CIDR-block for subnets"
  type        = list(string)
}
# Default private subnets for VPC
variable "private_subnet" {
  description = "Private CIDR-block for subnets"
  type        = list(string)
}
# Default CIDR for routing traffic
variable "default_cidr" {
  description = "Default CIDR block for IN/OUT traffic"
  type        = string
}


# SG
# Open ports to CIDR
variable "sg_port_cidr" {
  description = "Default open port"
  type        = map(any)
}


# Application
# Name of container for App (Docker)
variable "app_name" {
  description = "Default application name"
  type        = string
}
# Port for Application (ALB)
variable "app_port" {
  description = "Default application port"
  type        = number
}

# Gihub variables for codebuild
# Github credentials that stored in Parameter Store
variable "github_credential" {
  description = "Github credentials (OAuth)"
  type        = string
}
# Owner of github account
variable "github_owner" {
  description = "Owner of Github account"
  type        = string
}
# Default github url repository
variable "github_url" {
  description = "Github url repository"
  type        = string
}
# Default branch for start codebuild if something commit 
variable "github_branch" {
  description = "Github branch for trigger commit"
  type        = string
}

# Codebuild
# Default path to buildspec.yml
variable "buildspec" {
  description = "Buildspec.yml path"
  type        = string
}

# ECR
# Container image tag
variable "image_tag" {
  description = "Image tag for application"
  type        = string
}
# Container repository
variable "registry_url" {
  type = string
}


# Cluster

# Init-build
# Workind directory
variable "working_dir" {
  description = "Directory where will be run docker build"
  type        = string
}
