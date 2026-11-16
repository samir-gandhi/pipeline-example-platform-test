output "environment_id" {
  description = "The brand environment ID."
  value       = pingone_environment.brand.id
}

output "environment_name" {
  description = "The brand environment name."
  value       = pingone_environment.brand.name
}

output "oidc_app_id" {
  description = "The OIDC application delivering the login experience."
  value       = pingone_application.baseline_reference_customer_portal.id
}

output "key_rotation_policy_id" {
  description = "Signing key rotation policy for the brand environment."
  value       = pingone_key_rotation_policy.brand.id
}

output "oidc_api_key" {
  description = "DaVinci SSO Connection app API key (sample-app runtime config)."
  value       = pingone_davinci_application.pingone_sso_connection.api_key.value
}

output "oidc_client_id" {
  description = "OIDC client ID of the portal application (sample-app redirect flow)."
  value       = pingone_application.baseline_reference_customer_portal.oidc_options.client_id
}

output "portal_client_secret" {
  description = "Client secret of the portal OIDC application (sample-app token exchange)."
  value       = pingone_application_secret.portal_secret.secret
  sensitive   = true
}
