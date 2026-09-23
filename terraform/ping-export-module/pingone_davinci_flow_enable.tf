
resource "pingone_davinci_flow_enable" "pingcli__FEATURE-003A--0020-PingOne-0020-Account-0020-Recovery-0020-by-0020-Email" {
  environment_id = var.pingone_environment_id
  flow_id        = pingone_davinci_flow.pingcli__FEATURE-003A--0020-PingOne-0020-Account-0020-Recovery-0020-by-0020-Email.id
  enabled        = true
}


resource "pingone_davinci_flow_enable" "pingcli__PingOne-0020-DaVinci-0020-API-0020-Protect-0020-Example" {
  environment_id = var.pingone_environment_id
  flow_id        = pingone_davinci_flow.pingcli__PingOne-0020-DaVinci-0020-API-0020-Protect-0020-Example.id
  enabled        = true
}