
resource "pingone_davinci_flow_deploy" "pingcli__PingOne-0020-Account-0020-Recovery-0020-by-0020-Email" {
  environment_id = var.pingone_environment_id
  flow_id        = pingone_davinci_flow.pingcli__PingOne-0020-Account-0020-Recovery-0020-by-0020-Email.id

  deploy_trigger_values = {
    deployed_version = pingone_davinci_flow.pingcli__PingOne-0020-Account-0020-Recovery-0020-by-0020-Email.current_version
  }
}


resource "pingone_davinci_flow_deploy" "pingcli__PingOne-0020-DaVinci-0020-API-0020-Protect-0020-Example" {
  environment_id = var.pingone_environment_id
  flow_id        = pingone_davinci_flow.pingcli__PingOne-0020-DaVinci-0020-API-0020-Protect-0020-Example.id

  deploy_trigger_values = {
    deployed_version = pingone_davinci_flow.pingcli__PingOne-0020-DaVinci-0020-API-0020-Protect-0020-Example.current_version
  }
}