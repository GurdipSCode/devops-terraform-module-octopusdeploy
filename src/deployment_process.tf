resource "octopusdeploy_process" "deployment" {
  count    = var.enable_deployment_process ? 1 : 0
  space_id = var.space_id
  owner_id = octopusdeploy_project.this.id
  type     = "Deployment"

  dynamic "step" {
    for_each = var.deployment_process_steps
    content {
      name = step.value.name

      dynamic "action" {
        for_each = step.value.actions
        content {
          name        = action.value.name
          action_type = action.value.action_type
          properties  = try(action.value.properties, {})
        }
      }
    }
  }
}
