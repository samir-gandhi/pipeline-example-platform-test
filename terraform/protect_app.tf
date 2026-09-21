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
  environment_id = pingone_environment.target_environment.id
  name           = "Passwordless Solution Worker"
  enabled        = true

  oidc_options = {
    type                       = "WORKER"
    grant_types                = ["CLIENT_CREDENTIALS"]
    token_endpoint_auth_method = "CLIENT_SECRET_BASIC"
  }
}

resource "pingone_application_secret" "protect_worker_app" {
  environment_id = pingone_environment.target_environment.id
  application_id = pingone_application.protect_worker.id
}

resource "pingone_application_role_assignment" "protect_worker_identity_data_admin" {
  environment_id = pingone_environment.target_environment.id
  application_id = pingone_application.protect_worker.id
  role_id        = data.pingone_role.identity_data_admin.id

  scope_environment_id = pingone_environment.target_environment.id
}

resource "pingone_application_role_assignment" "protect_worker_environment_admin" {
  environment_id = pingone_environment.target_environment.id
  application_id = pingone_application.protect_worker.id
  role_id        = data.pingone_role.environment_admin.id

  scope_environment_id = pingone_environment.target_environment.id
}

resource "pingone_application" "oidc_sdk_sample_app" {
  environment_id = pingone_environment.target_environment.id
  enabled        = true
  name           = "Sample App"
  description    = "A custom sample OIDC application to demonstrate PingOne integration."

  oidc_options = {
    type                       = "SINGLE_PAGE_APP"
    grant_types                = ["AUTHORIZATION_CODE", "IMPLICIT", "REFRESH_TOKEN"]
    response_types             = ["CODE", "TOKEN", "ID_TOKEN"]
    pkce_enforcement           = "S256_REQUIRED"
    token_endpoint_auth_method = "NONE"
    redirect_uris              = ["https://127.0.0.1:8080/dashboard.html"]
    post_logout_redirect_uris  = ["https://127.0.0.1:8080"]
  }
}

resource "pingone_application_flow_policy_assignment" "login_flow" {
  environment_id = pingone_environment.target_environment.id
  application_id = pingone_application.oidc_sdk_sample_app.id
  flow_policy_id = module.ping-export.pingone_davinci_application_flow_policy__pingcli__DaVinci-0020-API-0020-Protect-0020-Sample-0020-Policy__id

  priority = 1

  depends_on = [module.ping-export]
}

resource "pingone_application_resource_grant" "oidc_sdk_sample_app_openid" {
  environment_id = pingone_environment.target_environment.id
  application_id = pingone_application.oidc_sdk_sample_app.id
  resource_type  = "OPENID_CONNECT"

  scopes = [
    pingone_resource_scope_openid.profile_scope.id,
    pingone_resource_scope_openid.phone_scope.id,
    pingone_resource_scope_openid.email_scope.id,
  ]
}

resource "pingone_application_resource_grant" "oidc_sdk_sample_app_revoke_scope" {
  environment_id     = pingone_environment.target_environment.id
  application_id     = pingone_application.oidc_sdk_sample_app.id
  resource_type      = "CUSTOM"
  custom_resource_id = pingone_resource.oidc_sdk.id

  scopes = [pingone_resource_scope.revoke.id]
}

# Generated sample-app runtime config (gitignored; contains the API key).
resource "local_file" "env_config" {
  content  = "window._env_ = {\n  pingOneDomain: \"com\",\n  pingOneEnvId: \"${pingone_environment.target_environment.id}\",\n  companyId: \"${pingone_environment.target_environment.id}\",\n  apiKey: \"${module.ping-export.pingone_davinci_application__pingcli__DaVinci-0020-API-0020-Protect-0020-Sample-0020-Application__api_key__value}\",\n  policyId: \"${module.ping-export.pingone_davinci_application_flow_policy__pingcli__DaVinci-0020-API-0020-Protect-0020-Sample-0020-Policy__id}\"\n};"
  filename = "${path.module}/../sample-app/global.js"
}
