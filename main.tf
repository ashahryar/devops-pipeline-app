# Tell Terraform which cloud provider plugin to download
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure AWS to use the us-west-1 region
provider "aws" {
  region = "us-west-1"
  profile = "devops-pipeline"
}
# Create a private container registry for Docker images
resource "aws_ecr_repository" "app" {
  name                 = "devops-pipeline-app"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  # Automatically scan images for vulnerabilities on push
  image_scanning_configuration {
    scan_on_push = true
  }
}

# Print the registry URL after creation
output "repository_url" {
  value = aws_ecr_repository.app.repository_url
}