# Default region where will be created infrastructure
region = "us-east-2"
# Default user that will push infrastructure to AWS
profile = "student" 
# Environment
env = "dev"


# -----------
# VPC
# -----------
# Default VPC CIDR
cidr_vpc = "172.31.0.0/16" 
# Default public subnets for VPC
public_subnet = ["172.31.1.0/24", "172.31.2.0/24"]
# Default private subnets for VPC
private_subnet = ["172.31.11.0/24", "172.31.12.0/24"]
# Default CIDR for routing traffic
default_cidr = "0.0.0.0/0"


# -----------
# SG
# -----------
# Port for Application (ALB)
app_port = 80
# Open ports to CIDR (for bastion)
sg_port_cidr = {
    "80" = ["0.0.0.0/0"]
}


# ----------
# ECR
# ----------
# Name of container for App
app_name  = "password-generator"
# Container image tag
image_tag = "latest"
registry_url = "564667093156.dkr.ecr.us-east-2.amazonaws.com/test"


# ----------
# Codebuild
# ----------
# Work in /home/student
working_dir = ""
# Github credentials that stored in Parameter Store
github_credential = ""
# Owner of github account
github_owner = ""
# Default github url repository
github_url = "https://github.com/OlesYudin/Terraform-CodeBuild"
# Default path to buildspec.yml
buildspec = "configuration/buildspec.yml"
# Default branch for commiting
github_branch = "main"