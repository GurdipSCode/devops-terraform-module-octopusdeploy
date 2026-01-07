variable "space_id" { type = string }
variable "project_name" { type = string }
variable "project_group_name" { type = string }
variable "project_description" { type = string default = null }
variable "is_disabled" { type = bool default = false }

variable "lifecycle_id" { type = string default = null }
variable "create_lifecycle" { type = bool default = true }
variable "lifecycle_name" { type = string default = null }
variable "lifecycle_description" { type = string default = null }
variable "lifecycle_phases" {
  type = list(object({
    name = string
    environment_ids = list(string)
    optional_deployment_targets = optional(bool, false)
    minimum_environments_before_promotion = optional(number, 1)
  }))
  default = []
}

variable "create_library_variable_set" { type = bool default = true }
variable "library_variable_set_name" { type = string default = null }
variable "library_variable_set_description" { type = string default = null }

variable "enable_project_variables" { type = bool default = true }
variable "project_variables" { type = any default = [] }

variable "enable_channels" { type = bool default = true }
variable "channels" { type = any default = [] }

variable "enable_deployment_process" { type = bool default = true }
variable "deployment_process_steps" { type = any default = [] }

variable "enable_runbooks" { type = bool default = true }
variable "runbooks" { type = any default = [] }

variable "projects" {
  description = "Octopus projects to create"
  type = map(object({
    description      = optional(string)
    is_disabled      = optional(bool, false)
    project_group    = string

    lifecycle_id     = optional(string)

    git = optional(object({
      default_branch = string
      base_path      = string
      url            = string
      credentials_id = string
    }))
  }))
}

variable "git_persistence_settings" {
  type = object({
    default_branch = string
    base_path = string
    url = string
    credentials_id = string
  })
  default = null
}
