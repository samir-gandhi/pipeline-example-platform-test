##########################################################################
# worker.tf - Worker application for the passwordless solution.
# The package provisions its own worker app in the target environment to
# drive the PingOne-family connector instances and management API reads,
# matching the upstream package design.
##########################################################################

resource "pingone_application" "pkg_worker_app" {
  environment_id = var.environment_id
  name           = "Passwordless Solution Worker"
  enabled        = true

  oidc_options = {
    type                       = "WORKER"
    grant_types                = ["CLIENT_CREDENTIALS"]
    token_endpoint_auth_method = "CLIENT_SECRET_BASIC"
  }
}

resource "pingone_application_secret" "pkg_worker_app" {
  environment_id = var.environment_id
  application_id = pingone_application.pkg_worker_app.id
}

data "pingone_role" "identity_data_admin" {
  name = "Identity Data Admin"
}

resource "pingone_application_role_assignment" "pkg_worker_identity_data_admin" {
  environment_id = var.environment_id
  application_id = pingone_application.pkg_worker_app.id
  role_id        = data.pingone_role.identity_data_admin.id

  scope_environment_id = var.environment_id
}

resource "pingone_application_role_assignment" "pkg_worker_environment_admin" {
  environment_id = var.environment_id
  application_id = pingone_application.pkg_worker_app.id
  role_id        = data.pingone_role.environment_admin.id

  scope_environment_id = var.environment_id
}

data "pingone_role" "environment_admin" {
  name = "Environment Admin"
}
