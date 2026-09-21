
resource "pingone_davinci_application" "pingcli__DaVinci-0020-API-0020-Protect-0020-Sample-0020-Application" {
  environment_id = var.pingone_environment_id
  name           = "DaVinci API Protect Sample Application"

  api_key = {
    enabled = true
  }

  oauth = {
    grant_types   = ["authorizationCode"]
    redirect_uris = ["https://127.0.0.1:8080/dashboard.html"]
    scopes        = ["openid", "profile"]
  }
}