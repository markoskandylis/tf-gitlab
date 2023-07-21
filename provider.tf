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
    base_url = "http://gitlab-loadbalancer-1002637374.eu-west-2.elb.amazonaws.com/api/v4/" 
  token = "glpat-sdLuZD2Qp2kULMb5pvKw"
}