##########################################################################
# pingone_davinci_application.tf
# Declarations for PingOne DaVinci Application.
# {@link https://registry.terraform.io/providers/pingidentity/pingone/latest/docs/resources/davinci_application}
# {@link https://docs.pingidentity.com/davinci/applications/davinci_applications.html}
##########################################################################

resource "pingone_davinci_application" "registration_flow_app" {
  environment_id = var.environment_id
  name           = "DaVinci API Protect Sample Application"

  api_key = {
    enabled = true
  }

  oauth = {
    grant_types   = ["authorizationCode"]
    redirect_uris = local.redirect_uris
    scopes        = ["openid", "profile"]
  }
}