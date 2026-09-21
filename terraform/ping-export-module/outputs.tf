output "connector_instance_ids" {
  description = "DaVinci connector instance IDs from the export, keyed by connector id"
  value = {
    pingOne      = pingone_davinci_connector_instance.pingcli__PingOne.id
    Http         = pingone_davinci_connector_instance.pingcli__Http.id
    Annotation   = pingone_davinci_connector_instance.pingcli__Annotation.id
    ErrorMessage = pingone_davinci_connector_instance.pingcli__Error-0020-Message.id
    Cookie       = pingone_davinci_connector_instance.pingcli__Cookie.id
  }
}
