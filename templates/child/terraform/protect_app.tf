##########################################################################
# Protect solution plumbing
# Application-side resources from davinci_api-pingone_protect-reg-authn-pkg:
# a package worker application (drives the PingOne-family connector
# instances and management API reads), the OIDC SDK sample application
# with its auth policy assignment and resource grants, and the generated
# sample-app/global.js runtime config.
##########################################################################

data "pingone_role" "environment_admin" {
  name = "Environment Admin"
}

resource "pingone_application" "protect_worker" {
  environment_id = module.baseline.environment_id
  name           = "Passwordless Solution Worker"
  enabled        = true

  oidc_options = {
    type                       = "WORKER"
    grant_types                = ["CLIENT_CREDENTIALS"]
    token_endpoint_auth_method = "CLIENT_SECRET_BASIC"
  }
}

resource "pingone_application_secret" "protect_worker_app" {
  environment_id = module.baseline.environment_id
  application_id = pingone_application.protect_worker.id
}

resource "pingone_application_role_assignment" "protect_worker_identity_data_admin" {
  environment_id = module.baseline.environment_id
  application_id = pingone_application.protect_worker.id
  role_id        = data.pingone_role.identity_data_admin.id

  scope_environment_id = module.baseline.environment_id
}

resource "pingone_application_role_assignment" "protect_worker_environment_admin" {
  environment_id = module.baseline.environment_id
  application_id = pingone_application.protect_worker.id
  role_id        = data.pingone_role.environment_admin.id

  scope_environment_id = module.baseline.environment_id
}





# Generated sample-app runtime config (gitignored; contains the client secret).
resource "local_file" "env_config" {
  filename = "${path.module}/../sample-app/global.js"
  content  = "window._env_ = {\n  pingOneDomain: \"${lower(var.pingone_client_region_code)}\",\n  pingOneEnvId: \"${module.baseline.environment_id}\",\n  oidcClientId: \"${module.baseline.oidc_client_id}\",\n  oidcClientSecret: \"${module.baseline.portal_client_secret}\",\n  redirectUri: \"${local.sample_app_host != null ? "https://${local.sample_app_host}/index.html" : "https://127.0.0.1:8080/index.html"}\",\n  flowPolicyId: \"${module.baseline.flow_policy_id}\",\n};"
}
