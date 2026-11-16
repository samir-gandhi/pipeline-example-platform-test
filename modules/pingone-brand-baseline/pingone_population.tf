
resource "pingone_population" "local_users" {
  environment_id     = var.environment_id
  name               = "Local Users"
  description        = "Automatically created population."
  preferred_language = "en"

  password_policy = {
    id = data.pingone_password_policy.standard.id
  }

  theme = {
    id = pingone_branding_theme.brand.id
  }
}