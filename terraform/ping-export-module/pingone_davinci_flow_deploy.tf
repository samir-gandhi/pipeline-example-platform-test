resource "pingone_davinci_flow_deploy" "irco_starter_kit" {
  environment_id = pingone_environment.brand.id
  flow_id        = pingone_davinci_flow.irco_starter_kit.id

  deploy_trigger_values = {
    deployed_version = pingone_davinci_flow.irco_starter_kit.current_version
  }
}
