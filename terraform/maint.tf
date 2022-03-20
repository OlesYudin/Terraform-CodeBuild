terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.70.0"
    }
  }
  # backend "s3" {
  #   bucket = "tfstate-demo-tfstate-s3-dev"
  #   key    = "tfstate/terraform.tfstate"
  #   region = "us-east-2"
  #   # dynamodb_table = "demo-dynamodb-lock-dev"
  #   encrypt = true
  # }
}

provider "aws" {
  region = var.region # instant region
  # profile = var.profile # default user
}

module "cluster" {
  source = "./modules/cluster"

  # Default variables for Cluster module
  # Application
  env       = var.env
  app_name  = var.app_name
  app_port  = var.app_port
  image_tag = var.image_tag
  # Network
  default_cidr   = var.default_cidr
  cidr_vpc       = var.cidr_vpc
  public_subnet  = var.public_subnet
  private_subnet = var.private_subnet
  sg_port_cidr   = var.sg_port_cidr

  registry_url = var.registry_url
}

module "codebuild" {
  source = "./modules/codebuild"

  # Default variables for Codebuild module
  # Application
  env      = var.env
  app_name = var.app_name
  app_port = var.app_port
  # Github
  github_credential = var.github_credential
  github_owner      = var.github_owner
  github_url        = var.github_url
  github_branch     = var.github_branch
  buildspec         = var.buildspec # Default path for buildspec.path
}
