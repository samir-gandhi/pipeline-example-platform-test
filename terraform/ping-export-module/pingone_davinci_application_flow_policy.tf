
resource "pingone_davinci_application_flow_policy" "pingone___sign_on_and_registration" {
  environment_id         = pingone_environment.brand.id
  davinci_application_id = pingone_davinci_application.pingone_sso_connection.id
  name                   = "PingOne - Sign On and Registration"
  status                 = "enabled"

  trigger = {
    type = "AUTHENTICATION"
  }

  flow_distributions = [
    {
      id      = pingone_davinci_flow.pingone_session_main_flow.id
      version = -1
      weight  = 100
    }
  ]
}