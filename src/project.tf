resource "octopusdeploy_project" "this" {
  space_id = var.space_id
  name = var.project_name
  description = var.project_description
  is_disabled = var.is_disabled
  lifecycle_id = local.effective_lifecycle_id
  project_group_id = local.project_group_id

  dynamic "git_persistence_settings" {
    for_each = var.git_persistence_settings == null ? [] : [var.git_persistence_settings]
    content {
      default_branch = git_persistence_settings.value.default_branch
      base_path = git_persistence_settings.value.base_path
      url = git_persistence_settings.value.url
      credentials_id = git_persistence_settings.value.credentials_id
    }
  }
}
