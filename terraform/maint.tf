terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.70.0"
    }
  }
  backend "s3" {
    bucket = "tfstate-demo-tfstate-s3-dev"
    key    = "tfstate/terraform.tfstate"
    region = "us-east-2"
    # dynamodb_table = "demo-dynamodb-lock-dev"
    encrypt = true
  }
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

  # Data from another modules
  registry_url = module.ecr.registry_url # URL of repository
}

module "ecr" {
  source = "./modules/ecr"

  # Default variables for ECR module
  region   = var.region
  app_name = var.app_name
}

module "codebuild" {
  source = "./modules/codebuild"

  # Default variables for Codebuild module
  # Application
  region   = var.region
  env      = var.env
  app_name = var.app_name
  app_port = var.app_port
  # Github
  github_credential = var.github_credential
  github_owner      = var.github_owner
  github_url        = var.github_url
  github_branch     = var.github_branch
  buildspec         = var.buildspec # Default path for buildspec.path
  # Envitonment variables for codebuild
  account_id              = module.ecr.account_id                  # AWS account id
  registry_url            = module.ecr.registry_url                # ECR registy URL
  task_definition_family  = module.cluster.task_definition_family  # Name of task definition 
  task_definition_cluster = module.cluster.task_definition_cluster # Name of ECS cluster
  task_definition_service = module.cluster.task_definition_service # Name of ECS service
}
