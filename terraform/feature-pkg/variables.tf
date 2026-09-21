##########################################################################
# variables.tf - Inputs for the feature package.
##########################################################################

variable "feature_pkg_domain_suffix" {
  type        = string
  description = "PingOne auth domain suffix for OIDC redirect URIs (e.g. com for NA)"
  default     = "com"
}

variable "pingone_connector_id" {
  type        = string
  description = "DaVinci connector instance ID for the PingOne SSO connector (from the export module)"
}

variable "http_connector_id" {
  type        = string
  description = "DaVinci connector instance ID for the Http connector (from the export module)"
}

variable "environment_id" {
  type        = string
  description = "Target PingOne environment ID created by the pipeline"
}
