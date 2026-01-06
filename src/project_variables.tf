resource "octopusdeploy_variable" "project_vars" {
  for_each = var.enable_project_variables ? {
    for v in var.project_variables : v.name => v
  } : {}

  owner_id = octopusdeploy_project.this.id
  name = each.value.name
  type = each.value.type
  value = try(each.value.value, null)
  sensitive_value = try(each.value.sensitive_value, null)
  is_sensitive = try(each.value.is_sensitive, false)
}
