locals {
  groups = {
    Group1 = {
      group_name = "group 1"
      group_path = "group-1"
      projects = toset([
        "Project1",
        "Project2",
        "Project3",
      ]),
    },
    Group2 = {
      group_name = "group 2"
      group_path = "group-2"
      projects = toset([
        "Project4",
        "Project5",
        "Project6",
      ]),
    }
  }

  projects = flatten([
      for v in values(local.groups) : [
        for p in v.projects : [
          {
            group_name = v.group_name
            group_path = v.group_path
            project    = p
          }
        ]
      ]
    ])
}



resource "gitlab_group" "this" {
  for_each    = { for p in local.groups : "${p.group_path}" => p }
  name        = each.value.group_name
  path        = each.value.group_path
  description = "An example group"
}

resource "gitlab_project" "this" {
  for_each          = { for p in local.projects : "${p.group_path}-${p.project}" => p }
  name              = each.value.project
  description       = "An example project"
  namespace_id      = gitlab_group.this[each.value.group_path].id
}

output "local" {
  value = local.projects
}