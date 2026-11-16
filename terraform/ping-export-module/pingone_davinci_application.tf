
resource "pingone_davinci_application" "pingone_sso_connection" {
  environment_id = pingone_environment.brand.id
  name           = "PingOne SSO Connection"

  api_key = {
    enabled = true
  }

  oauth = {
    grant_types   = ["authorizationCode"]
    redirect_uris = ["https://auth.pingone.eu/cf069241-3860-4e6b-9450-ac2d7950184c/rp/callback/openid_connect"]
    scopes        = ["openid", "profile"]
  }
}