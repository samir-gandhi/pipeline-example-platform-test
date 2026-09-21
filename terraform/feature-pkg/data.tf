##########################################################################
# data.tf - Data sources for the passwordless solution package.
# Adapted from davinci-oidc_sdk-ciam_passwordless_solution-pkg.
##########################################################################

# Terraform HTTP provider
# {@link https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http}

# Get a worker token for management API reads.
data "http" "get_token" {
  url    = "https://auth.pingone.${var.feature_pkg_domain_suffix}/${var.environment_id}/as/token"
  method = "POST"

  request_headers = {
    Content-Type  = "application/x-www-form-urlencoded",
    Authorization = "Basic ${base64encode("${pingone_application.pkg_worker_app.oidc_options.client_id}:${pingone_application_secret.pkg_worker_app.secret}")}"
  }

  request_body = "grant_type=client_credentials"
}

# Read the environment's risk policy set (Fallback Risk Policy ships by default).
data "http" "get_risk_policy_id" {
  url    = "https://api.pingone.${var.feature_pkg_domain_suffix}/v1/environments/${var.environment_id}/riskPolicySets"
  method = "GET"

  request_headers = {
    Accept        = "application/json",
    Authorization = "Bearer ${local.access_token}",
  }
}
