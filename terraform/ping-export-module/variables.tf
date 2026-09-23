variable "pingone_environment_id" {
  type        = string
  description = "The PingOne environment ID to configure DaVinci resources in"

  validation {
    condition     = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.pingone_environment_id))
    error_message = "The PingOne Environment ID must be a valid PingOne resource ID (UUID format)."
  }
}

# Pingone_davinci_connector_instance Variables

variable "davinci_connection_PingOne_0020_Protect_clientId" {
  type        = string
  description = "clientId property for pingcli__PingOne-0020-Protect connector"
}
variable "davinci_connection_PingOne_0020_Protect_clientSecret" {
  type        = string
  description = "clientSecret property for pingcli__PingOne-0020-Protect connector"
  sensitive   = true
}
variable "davinci_connection_PingOne_0020_Protect_envId" {
  type        = string
  description = "envId property for pingcli__PingOne-0020-Protect connector"
}
variable "davinci_connection_PingOne_0020_Protect_region" {
  type        = string
  description = "region property for pingcli__PingOne-0020-Protect connector"
}
variable "davinci_connection_PingOne_clientId" {
  type        = string
  description = "clientId property for pingcli__PingOne connector"
}
variable "davinci_connection_PingOne_clientSecret" {
  type        = string
  description = "clientSecret property for pingcli__PingOne connector"
  sensitive   = true
}
variable "davinci_connection_PingOne_envId" {
  type        = string
  description = "envId property for pingcli__PingOne connector"
}
variable "davinci_connection_PingOne_region" {
  type        = string
  description = "region property for pingcli__PingOne connector"
}
