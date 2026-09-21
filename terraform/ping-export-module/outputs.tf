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

output "flow_policy_ids" {
  description = "DaVinci application flow policy IDs from the export"
  value = {
    main = pingone_davinci_application_flow_policy.pingcli__DaVinci-0020-API-0020-Protect-0020-Sample-0020-Policy.id
  }
}

output "davinci_application_ids" {
  description = "DaVinci application IDs from the export"
  value = {
    main = pingone_davinci_application.pingcli__DaVinci-0020-API-0020-Protect-0020-Sample-0020-Application.id
  }
}

output "davinci_application_api_key" {
  description = "DaVinci application API key for the sample app"
  value       = pingone_davinci_application.pingcli__DaVinci-0020-API-0020-Protect-0020-Sample-0020-Application.api_key.value
  sensitive   = true
}

output "flow_ids" {
  description = "DaVinci flow IDs from the export"
  value = {
    main = pingone_davinci_flow.pingcli__PingOne-0020-DaVinci-0020-API-0020-Protect-0020-Example.id
  }
}
