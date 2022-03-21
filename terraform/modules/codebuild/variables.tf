# Application
variable "region" {}   # Default region
variable "env" {}      # Environment of application
variable "app_name" {} # Name of container for App
variable "app_port" {} # Port for Application (ALB)

# Gihub variables for codebuild
variable "github_credential" {} # Github credentials that stored in Parameter Store
variable "github_owner" {}      # Owner of github repository
variable "github_url" {}        # Default github url
variable "github_branch" {}     # Default branch for commiting

# Codebuild
variable "buildspec" {}               # Default path to buildspec.yml
variable "registry_url" {}            # ECR Registri URL
variable "task_definition_family" {}  # Name of task definition family
variable "task_definition_cluster" {} # Name of task definition cluster
variable "task_definition_service" {} # Name of task definition service

