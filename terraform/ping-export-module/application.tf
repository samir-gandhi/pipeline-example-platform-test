# The OIDC web application that delivers the shared login experience.
# Redirect URIs are supplied by the caller (child repo) — typically the
# brand's sample-app host plus any test callbacks.
variable "oidc_redirect_uris" {
  description = "Redirect URIs for the brand's OIDC application."
  type        = list(string)
}

variable "oidc_post_logout_redirect_uris" {
  description = "Post-logout redirect URIs for the brand's OIDC application."
  type        = list(string)
  default     = []
}

resource "pingone_application" "oidc_app" {
  environment_id         = pingone_environment.brand.id
  name                   = "${var.branding.name} Customer Portal"
  description            = "Brand login experience delivered via the shared DaVinci baseline flows."
  enabled                = true
  hidden_from_app_portal = false

  oidc_options = {
    type                                               = "WEB_APP"
    grant_types                                        = ["AUTHORIZATION_CODE"]
    response_types                                     = ["CODE"]
    token_endpoint_auth_method                         = "CLIENT_SECRET_BASIC"
    additional_refresh_token_replay_protection_enabled = true
    device_polling_interval                            = 5
    device_timeout                                     = 600
    idp_signoff                                        = false
    par_requirement                                    = "OPTIONAL"
    par_timeout                                        = 60
    pkce_enforcement                                   = "OPTIONAL"
    request_scopes_for_multiple_resources_enabled      = false
    redirect_uris                                      = var.oidc_redirect_uris
    post_logout_redirect_uris                          = var.oidc_post_logout_redirect_uris
    signing = {
      key_rotation_policy_id = pingone_key_rotation_policy.brand.id
    }
  }
}

# OpenID scopes (openid/profile/email) are predefined in every environment;
# the API rejects changing their descriptions. Import them into state
# instead of creating — managed via openid_scopes.tf.

