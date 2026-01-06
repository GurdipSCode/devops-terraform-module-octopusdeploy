resource "octopusdeploy_runbook" "runbooks" {
  for_each = var.enable_runbooks ? {
    for r in var.runbooks : r.name => r
  } : {}

  space_id = var.space_id
  project_id = octopusdeploy_project.this.id
  name = each.value.name
}
