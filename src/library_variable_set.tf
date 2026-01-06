resource "octopusdeploy_library_variable_set" "this" {
  count = var.create_library_variable_set ? 1 : 0
  space_id = var.space_id
  name = local.effective_library_varset_name
  description = var.library_variable_set_description
}

resource "octopusdeploy_project_library_variable_sets" "link" {
  count = var.create_library_variable_set ? 1 : 0
  space_id = var.space_id
  project_id = octopusdeploy_project.this.id

  library_variable_set_ids = [
    octopusdeploy_library_variable_set.this[0].id
  ]
}
