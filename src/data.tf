data "octopusdeploy_project_groups" "groups" {
  space_id = var.space_id
}

locals {
  project_group_id = one([
    for g in data.octopusdeploy_project_groups.groups.project_groups :
    g.id if g.name == var.project_group_name
  ])
}
