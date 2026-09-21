##########################################################################
# variables.tf - Inputs for the feature package.
##########################################################################

variable "environment_id" {
  type        = string
  description = "Target PingOne environment ID created by the pipeline"
}

variable "feature_pkg_domain_suffix" {
  type        = string
  description = "PingOne auth domain suffix for OIDC redirect URIs (e.g. com for NA)"
  default     = "com"
}

variable "region_code" {
  type        = string
  description = "PingOne region code for the target environment (NA, EU, CA, AP, AU)"
  default     = "NA"
}

variable "agreement_id" {
  type        = string
  description = "ID of the Terms of Service agreement managed by the root module"
}

variable "app_url" {
  type        = string
  description = "Sample application URL for OIDC redirects"
  default     = "https://127.0.0.1:8080"
}

locals {
  redirect_uris = ["${var.app_url}/dashboard.html"]

  # Risk policy: the environment ships with a Fallback Risk Policy; read its ID
  # with a worker token for the PingOne Protect variables.
  access_token = jsondecode(data.http.get_token.response_body).access_token
  policy_id    = jsondecode(data.http.get_risk_policy_id.response_body)._embedded.riskPolicySets[0].id
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

variable "annotation_connector_id" {
  type        = string
  description = "Annotation connector instance ID from the export module"
}

variable "error_message_connector_id" {
  type        = string
  description = "Error Message connector instance ID from the export module"
}
