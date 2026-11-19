# Shared baseline for every brand environment (the parent's own included).
# Parent calls it locally; child repos call the same module remotely via
# git::https://github.com/<org>/pipeline-example-platform-test//terraform/ping-export-module?ref=<tag|branch>
module "baseline" {
  source = "./ping-export-module"

  environment_name = var.pingone_environment_name
  license_id       = var.pingone_license_id
  environment_type = var.pingone_environment_type

  branding = {
    name     = var.pingone_environment_name
    logo_url = "https://demo.pingdevops.com/images/logo.png"
  }

  region_code = var.pingone_client_region_code

  oidc_redirect_uris             = local.sample_app_host != null ? ["https://${local.sample_app_host}/index.html"] : ["https://127.0.0.1:8080/index.html"]
  oidc_post_logout_redirect_uris = ["https://127.0.0.1:8080/index.html"]
}
