locals {
  effective_lifecycle_name      = coalesce(var.lifecycle_name, "${var.project_name} Lifecycle")
  effective_library_varset_name = coalesce(var.library_variable_set_name, "${var.project_name} Library Variables")

  project_group_id = one([
    for g in data.octopusdeploy_project_groups.groups.project_groups :
    g.id if g.name == var.project_group_name
  ])
}
