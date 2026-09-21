##########################################################################
# variables.tf - Inputs for the feature package.
##########################################################################

variable "environment_id" {
  type        = string
  description = "Target PingOne environment ID created by the pipeline"
}

variable "region_code" {
  type        = string
  description = "PingOne region code for the target environment (NA, EU, CA, AP, AU)"
  default     = "NA"
}

variable "app_url" {
  type        = string
  description = "Sample application URL for OIDC redirects"
  default     = "https://127.0.0.1:8080"
}

locals {
  redirect_uris = ["${var.app_url}/dashboard.html"]
}

variable "openid_scope_ids" {
  type        = list(string)
  description = "OIDC scope IDs (profile, phone, email) managed by the root module"
}

variable "oidc_sdk_resource_id" {
  type        = string
  description = "OIDC SDK custom resource ID managed by the root module"
}

variable "revoke_scope_id" {
  type        = string
  description = "Revoke scope ID on the OIDC SDK resource, managed by the root module"
}

variable "pingone_connector_id" {
  type        = string
  description = "PingOne connector instance ID from the export module"
}

variable "http_connector_id" {
  type        = string
  description = "Http connector instance ID from the export module"
}

