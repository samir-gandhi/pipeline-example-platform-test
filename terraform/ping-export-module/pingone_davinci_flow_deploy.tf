
resource "pingone_davinci_flow_deploy" "pingone_session_main_flow" {
  environment_id = pingone_environment.brand.id
  flow_id        = pingone_davinci_flow.pingone_session_main_flow.id

  deploy_trigger_values = {
    deployed_version = pingone_davinci_flow.pingone_session_main_flow.current_version
  }
}


resource "pingone_davinci_flow_deploy" "pingone_sign_on_with_registration__password_reset_and_recovery" {
  environment_id = pingone_environment.brand.id
  flow_id        = pingone_davinci_flow.pingone_sign_on_with_registration__password_reset_and_recovery.id

  deploy_trigger_values = {
    deployed_version = pingone_davinci_flow.pingone_sign_on_with_registration__password_reset_and_recovery.current_version
  }
}