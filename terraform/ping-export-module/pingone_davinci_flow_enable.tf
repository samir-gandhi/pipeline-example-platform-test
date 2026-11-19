resource "pingone_davinci_flow_enable" "irco_starter_kit" {
  environment_id = pingone_environment.brand.id
  flow_id        = pingone_davinci_flow.irco_starter_kit.id
  enabled        = true
}
