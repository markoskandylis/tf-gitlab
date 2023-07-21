//Creating Group for Gitlab
resource "gitlab_group" "my_group" {
  name        = "FirstGroup1"
  path        = "accounts"
  description = "An example group"
}

# Create a project in the example group
resource "gitlab_project" "tenant_a" {
  name         = "accountA1"
  description  = "An example project"
  namespace_id = gitlab_group.my_group.id
}

resource "gitlab_project" "tenant_b" {
  name         = "accountB1"
  description  = "An example project"
  namespace_id = gitlab_group.my_group.id
}

resource "gitlab_project" "tenant_c" {
  name         = "accountC1"
  description  = "An example project"
  namespace_id = gitlab_group.my_group.id
}

resource "gitlab_project" "tenant_d" {
  name         = "accountD1"
  description  = "An example project"
  namespace_id = gitlab_group.my_group.id
}

