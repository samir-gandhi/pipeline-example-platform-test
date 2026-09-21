##########################################################################
# application.tf - DaVinci application, flow policy, deploy and enable.
# Adapted from pingidentity/ping-integration-example-packages
# (davinci_widget-reg-authn-pkg).
##########################################################################

resource "pingone_davinci_application" "registration_flow_app" {
  environment_id = var.environment_id
  name           = "DaVinci Registration Sample Application"

  api_key = {
    enabled = true
  }

  oauth = {
    grant_types = ["authorizationCode"]
    # Redirect back to this environment's PingOne OIDC endpoint; the region
    # suffix is a module input so the package promotes across environments.
    redirect_uris = ["https://auth.pingone.${var.feature_pkg_domain_suffix}/rp/callback/openid_connect"]
    scopes        = ["openid", "profile"]
  }
}

resource "pingone_davinci_application_flow_policy" "registration_flow_app_policy" {
  environment_id         = var.environment_id
  davinci_application_id = pingone_davinci_application.registration_flow_app.id
  name                   = "DaVinci Registration Sample Policy"
  status                 = "enabled"

  flow_distributions = [
    {
      id      = pingone_davinci_flow.pingone_davinci_registration_example.id
      version = -1
      weight  = 100
    }
  ]
}

resource "pingone_davinci_flow_deploy" "pingone_davinci_registration_example" {
  environment_id = var.environment_id
  flow_id        = pingone_davinci_flow.pingone_davinci_registration_example.id

  deploy_trigger_values = {
    deployed_version = pingone_davinci_flow.pingone_davinci_registration_example.current_version
  }
}

resource "pingone_davinci_flow_enable" "pingone_davinci_registration_example" {
  environment_id = var.environment_id
  flow_id        = pingone_davinci_flow.pingone_davinci_registration_example.id
  enabled        = true
}
