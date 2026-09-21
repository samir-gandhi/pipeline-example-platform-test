##########################################################################
# pingone_app.tf - OIDC SDK sample application, auth policy assignment,
# and resource grants. Adapted from davinci-oidc_sdk-ciam_passwordless_solution-pkg.
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
  flow_policy_id = pingone_davinci_application_flow_policy.registration_flow_policy.id

  priority = 1

  depends_on = [pingone_davinci_application_flow_policy.registration_flow_policy]
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
