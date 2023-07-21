//Creating Group for Gitlab
resource "gitlab_group" "modules" {
  name        = "Modules1"
  path        = "tf-modules"
  description = "An example group"
}

# Create a project in the example group
resource "gitlab_project" "module_a" {
  name         = "moduleA1"
  description  = "An example project"
  namespace_id = gitlab_group.modules.id
}

resource "gitlab_project" "module_b" {
  name         = "ModuleB1"
  description  = "An example project"
  namespace_id = gitlab_group.modules.id
}

resource "gitlab_project" "module_c" {
  name         = "ModuleC1"
  description  = "An example project"
  namespace_id = gitlab_group.modules.id
}

resource "gitlab_project" "tenant" {
  name         = "accountD1"
  description  = "An example project"
  namespace_id = gitlab_group.my_group.id
}

