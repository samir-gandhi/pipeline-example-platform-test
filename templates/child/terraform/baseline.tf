# Child repo: consume the parent's baseline module remotely, pinned to a tag.
module "baseline" {
  source = "git::https://github.com/samir-gandhi/pipeline-example-platform-test//terraform/ping-export-module?ref=baseline-v0.2.0"

  environment_name = var.pingone_environment_name
  license_id       = var.pingone_license_id
  environment_type = var.pingone_environment_type

  branding = {
    name     = var.pingone_environment_name
    logo_url = "https://demo.pingdevops.com/images/logo.png"
  }

  region_code = var.pingone_client_region_code

  oidc_redirect_uris             = local.app_redirect_uris
  oidc_post_logout_redirect_uris = local.app_post_logout_uris
}
# Module source: public parent repo (git:: tag pin)
