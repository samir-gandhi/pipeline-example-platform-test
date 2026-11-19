

# Browser-callable origins (scheme + host) of the app's redirect URIs.
locals {
  app_origins = [for uri in var.oidc_redirect_uris :
    regex("^(https?://[^/]+)", uri)[0]
  ]
}

resource "pingone_application" "baseline_reference_customer_portal" {
  environment_id         = pingone_environment.brand.id
  name                   = "baseline-reference Customer Portal"
  description            = "Brand login experience delivered via the shared DaVinci baseline flows."
  enabled                = true
  hidden_from_app_portal = false

  oidc_options = {
    type                                               = "WEB_APP"
    grant_types                                        = ["AUTHORIZATION_CODE"]
    response_types                                     = ["CODE"]
    token_endpoint_auth_method                         = "CLIENT_SECRET_BASIC"
    additional_refresh_token_replay_protection_enabled = true
    allow_wildcard_in_redirect_uris                    = false
    device_polling_interval                            = 5
    device_timeout                                     = 600
    idp_signoff                                        = false
    include_x5t                                        = false
    op_session_check_enabled                           = false
    par_requirement                                    = "OPTIONAL"
    par_timeout                                        = 60
    pkce_enforcement                                   = "OPTIONAL"
    post_logout_redirect_uris                          = var.oidc_post_logout_redirect_uris
    redirect_uris                                      = var.oidc_redirect_uris
    refresh_token_duration                             = 2592000
    refresh_token_rolling_duration                     = 15552000
    request_scopes_for_multiple_resources_enabled      = false
    require_signed_request_object                      = false
    signing = {
      key_rotation_policy_id = pingone_key_rotation_policy.brand.id
    }
    support_unsigned_request_object = false
    # The authorize redirect and dashboard token exchange are browser calls
    # from the app's origin; allow them explicitly.
    cors_settings = {
      behavior = "ALLOW_SPECIFIC_ORIGINS"
      origins  = local.app_origins
    }
  }
}

