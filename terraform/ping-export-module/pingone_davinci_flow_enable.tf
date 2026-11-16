
resource "pingone_davinci_flow_enable" "pingone_session_main_flow" {
  environment_id = pingone_environment.brand.id
  flow_id        = pingone_davinci_flow.pingone_session_main_flow.id
  enabled        = true
}


resource "pingone_davinci_flow_enable" "pingone_sign_on_with_registration__password_reset_and_recovery" {
  environment_id = pingone_environment.brand.id
  flow_id        = pingone_davinci_flow.pingone_sign_on_with_registration__password_reset_and_recovery.id
  enabled        = true
}