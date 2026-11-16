
resource "pingone_davinci_flow_enable" "session_main" {
  environment_id = var.environment_id
  flow_id        = pingone_davinci_flow.session_main.id
  enabled        = true
}


resource "pingone_davinci_flow_enable" "sign_on_registration" {
  environment_id = var.environment_id
  flow_id        = pingone_davinci_flow.sign_on_registration.id
  enabled        = true
}