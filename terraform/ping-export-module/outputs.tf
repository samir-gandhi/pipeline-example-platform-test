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
  value       = pingone_application.oidc_app.id
}

output "key_rotation_policy_id" {
  description = "Signing key rotation policy for the brand environment."
  value       = pingone_key_rotation_policy.brand.id
}

output "oidc_api_key" {
  description = "DaVinci SSO Connection app API key (sample-app runtime config)."
  value       = pingone_davinci_application.sso_connection.api_key.value
}
