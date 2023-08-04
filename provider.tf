# Configure the GitLab Provider
terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "16.1.1"
    }
  }
}

provider "gitlab" {
  base_url = "http://gitlab-loadbalancer-194776154.eu-west-2.elb.amazonaws.com"
  token    = "glpat-uhD21AYxx3JeWiWiEynz"
}
