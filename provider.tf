# Configure the GitLab Provider
terraform {
  required_providers {
    gitlab = {
      source = "gitlabhq/gitlab"
      version = "16.1.1"
    }
  }
}

provider "gitlab" {
    base_url = 
  token = 
}