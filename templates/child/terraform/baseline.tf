# Child repo: consume the parent's baseline module remotely, pinned to a tag.
module "baseline" {
  source = "git::https://github.com/samir-gandhi/pipeline-example-platform-test//terraform/ping-export-module?ref=baseline-v0.1.0"

  environment_name = var.pingone_environment_name
  license_id       = var.pingone_license_id
  environment_type = var.pingone_environment_type
  region_code      = var.pingone_client_region_code

  branding = {
    name     = var.pingone_environment_name
    logo_url = "https://demo.pingdevops.com/images/logo.png"
  }

  davinci_connection_PingOne_clientId     = var.pingone_client_id
  davinci_connection_PingOne_clientSecret = var.pingone_client_secret
  davinci_connection_PingOne_region       = var.pingone_client_region_code

  oidc_redirect_uris             = local.app_redirect_uris
  oidc_post_logout_redirect_uris = local.app_post_logout_uris
}
# Module source: public parent repo (git:: tag pin)
