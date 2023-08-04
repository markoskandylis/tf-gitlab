locals {
  groups = {
    "Group1" = [
      "Project1",
      "Project2",
      "Project6",
    ],
    "Group2" = [
      "Project5",
      "Project7"
    ]
    "Group3" = [
      "Project3",
      "Project8",
      "Project9",
    ]
  }

  projects = flatten([
    for group, projects in local.groups : [
      for project in projects : {
        group = group
        project = project
      }
    ]
  ])
}



resource "gitlab_group" "this" {
  for_each    = local.groups
  name        = each.key
  path        = each.key
  description = "An example group"
}

resource "gitlab_project" "this" {
  for_each          = { for project in local.projects : "${project.group}.${project.project}" => project }
  name              = each.value.project
  description       = "An example project"
  namespace_id      = gitlab_group.this[each.value.group].id
}

