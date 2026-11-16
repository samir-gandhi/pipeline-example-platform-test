output "environment_id" {
  description = "The brand environment ID (echoed for downstream use)."
  value       = var.environment_id
}

output "branding_theme_id" {
  description = "The brand's PingOne branding theme ID."
  value       = pingone_branding_theme.brand.id
}

output "oidc_app_id" {
  description = "The OIDC application delivering the login experience."
  value       = pingone_application.oidc_app.id
}

output "oidc_app_redirect_uris" {
  description = "Redirect URIs configured on the OIDC app."
  value       = try(pingone_application.oidc_app.oidc_options.redirect_uris, null)
}
