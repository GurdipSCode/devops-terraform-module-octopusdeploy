resource "octopusdeploy_lifecycle" "this" {
  count = (var.lifecycle_id == null && var.create_lifecycle) ? 1 : 0
  space_id = var.space_id
  name = local.effective_lifecycle_name
  description = var.lifecycle_description

  dynamic "phase" {
    for_each = var.lifecycle_phases
    content {
      name = phase.value.name
      environment_ids = phase.value.environment_ids
      optional_deployment_targets = phase.value.optional_deployment_targets
      minimum_environments_before_promotion = phase.value.minimum_environments_before_promotion
    }
  }
}

locals {
  effective_lifecycle_id = coalesce(
    var.lifecycle_id,
    try(octopusdeploy_lifecycle.this[0].id, null)
  )
}
