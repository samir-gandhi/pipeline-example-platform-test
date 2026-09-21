##########################################################################
# pingone_app.tf - OIDC SDK sample application, auth policy assignment,
# and resource grants. Adapted from davinci_api-pingone_protect-reg-authn-pkg.
# Reuses the OIDC SDK custom resource and scopes managed by the root module.
##########################################################################

resource "pingone_application" "oidc_sdk_sample_app" {
  environment_id = var.environment_id
  enabled        = true
  name           = "Sample App"
  description    = "A custom sample OIDC application to demonstrate PingOne integration."

  oidc_options = {
    type                       = "SINGLE_PAGE_APP"
    grant_types                = ["AUTHORIZATION_CODE", "IMPLICIT", "REFRESH_TOKEN"]
    response_types             = ["CODE", "TOKEN", "ID_TOKEN"]
    pkce_enforcement           = "S256_REQUIRED"
    token_endpoint_auth_method = "NONE"
    redirect_uris              = local.redirect_uris
    post_logout_redirect_uris  = [var.app_url]
  }
}

resource "pingone_application_flow_policy_assignment" "login_flow" {
  environment_id = var.environment_id
  application_id = pingone_application.oidc_sdk_sample_app.id
  flow_policy_id = var.dv_flow_policy_id

  priority = 1

  depends_on = []
}

resource "pingone_application_resource_grant" "oidc_sdk_sample_app_openid" {
  environment_id = var.environment_id
  application_id = pingone_application.oidc_sdk_sample_app.id
  resource_type  = "OPENID_CONNECT"

  scopes = var.openid_scope_ids
}

resource "pingone_application_resource_grant" "oidc_sdk_sample_app_revoke_scope" {
  environment_id     = var.environment_id
  application_id     = pingone_application.oidc_sdk_sample_app.id
  resource_type      = "CUSTOM"
  custom_resource_id = var.oidc_sdk_resource_id

  scopes = [var.revoke_scope_id]
}

# Sample app runtime config (global.js) consumed by the static pages.
resource "local_file" "env_config" {
  content  = "window._env_ = {\n  pingOneDomain: \"${var.pingone_domain_suffix}\",\n  pingOneEnvId: \"${var.environment_id}\",\n  companyId: \"${var.environment_id}\",\n  apiKey: \"${var.dv_api_key}\",\n  policyId: \"${var.dv_flow_policy_id}\"\n};"
  filename = "${path.module}/../../sample-app/global.js"
}
