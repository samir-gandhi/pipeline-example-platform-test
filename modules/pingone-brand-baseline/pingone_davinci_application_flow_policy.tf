
resource "pingone_davinci_application_flow_policy" "sign_on_registration" {
  environment_id         = var.environment_id
  davinci_application_id = pingone_davinci_application.sso_connection.id
  name                   = "PingOne - Sign On and Registration"
  status                 = "enabled"

  trigger = {
    type = "AUTHENTICATION"
  }

  flow_distributions = [
    {
      id      = pingone_davinci_flow.session_main.id
      version = -1
      weight  = 100
    }
  ]
}