locals {
  groups = {
    Authentication = {
      group_name = "Authentication"
      group_path = "Authentication"
      projects = [ 
        {
          name = "CCDF-RemoteServices"
        },
        {
          name = "Project2"
        },
       {
          name = "Project3"
        },
    ]
    },
    RemoteAccess = {
      group_name = "RemoteAccess"
      group_path = "RemoteAccess"
      projects = [
        {
          name = "CCDF-RemoteServices"
        },
        {
          name = "Project5"
        },
        {
          name = "Project6"
        },
    ]
    }
  }

  projects = flatten([
      for v in values(local.groups) : [
        for p in v.projects : [
          {
            group_name = v.group_name
            group_path = v.group_path
            project_name    = p.name
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
  for_each          = { for p in local.projects : "${p.group_path}-${p.project_name}" => p }
  name              = each.value.project_name
  description       = "An example project"
  namespace_id      = gitlab_group.this[each.value.group_path].id
}

output "local" {
  value = local.projects
}