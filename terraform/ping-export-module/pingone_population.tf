
resource "pingone_population" "local_users" {
  environment_id     = pingone_environment.brand.id
  name               = "Local Users"
  description        = "Automatically created population."
  preferred_language = "en"

  password_policy = {
    id = data.pingone_password_policy.standard.id
  }

}