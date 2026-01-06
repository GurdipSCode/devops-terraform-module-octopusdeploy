resource "octopusdeploy_process" "deployment" {
  count = var.enable_deployment_process ? 1 : 0
  space_id = var.space_id
  owner_id = octopusdeploy_project.this.id
  type = "Deployment"
}
