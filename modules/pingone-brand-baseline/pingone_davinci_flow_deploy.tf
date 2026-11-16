
resource "pingone_davinci_flow_deploy" "session_main" {
  environment_id = var.environment_id
  flow_id        = pingone_davinci_flow.session_main.id

  deploy_trigger_values = {
    deployed_version = pingone_davinci_flow.session_main.current_version
  }
}


resource "pingone_davinci_flow_deploy" "sign_on_registration" {
  environment_id = var.environment_id
  flow_id        = pingone_davinci_flow.sign_on_registration.id

  deploy_trigger_values = {
    deployed_version = pingone_davinci_flow.sign_on_registration.current_version
  }
}