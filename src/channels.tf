resource "octopusdeploy_channel" "channels" {
  for_each = var.enable_channels ? {
    for c in var.channels : c.name => c
  } : {}

  space_id = var.space_id
  project_id = octopusdeploy_project.this.id
  name = each.value.name
  is_default = try(each.value.is_default, false)
}
