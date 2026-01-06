locals {
  effective_lifecycle_name      = coalesce(var.lifecycle_name, "${var.project_name} Lifecycle")
  effective_library_varset_name = coalesce(var.library_variable_set_name, "${var.project_name} Library Variables")
}
