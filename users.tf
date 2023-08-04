# resource "gitlab_user" "alex" {
#   name             = "Alex"
#   username         = "alex"
#   password         = "superPassword"
#   email            = "gitlab@user.create"
#   is_admin         = false
#   projects_limit   = 4
#   can_create_group = false
#   is_external      = true
#   reset_password   = false
# }

# // Giving permition to a user to acees a group
# resource "gitlab_group_membership" "test" {
#   group_id     = gitlab_group.my_group.id
#   user_id      = gitlab_user.alex.id
#   access_level = "guest"
#   expires_at   = "2020-12-31"
# }