resource "octopusdeploy_project" "this" {
  for_each = var.projects

  space_id         = var.space_id
  name             = each.key
  description      = try(each.value.description, null)
  is_disabled      = try(each.value.is_disabled, false)
  project_group_id = local.project_group_ids[each.key]

  lifecycle_id = try(
    each.value.lifecycle_id,
    local.effective_lifecycle_id
  )

  dynamic "git_persistence_settings" {
    for_each = try(each.value.git, null) == null ? [] : [each.value.git]
    content {
      default_branch = git_persistence_settings.value.default_branch
      base_path      = git_persistence_settings.value.base_path
      url            = git_persistence_settings.value.url
      credentials_id = git_persistence_settings.value.credentials_id
    }
  }
}
