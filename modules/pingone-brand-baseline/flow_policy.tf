# Assign the shared "Sign On and Registration" flow policy to the brand's
# OIDC application — the single wiring point that turns the shared login
# experience into the brand's login experience.
locals {
  app_by_key = {
    sso_connection = pingone_davinci_application.sso_connection.id
  }
}

resource "pingone_application_flow_policy_assignment" "login_flow" {
  environment_id = var.environment_id
  application_id = pingone_application.oidc_app.id
  flow_policy_id = pingone_davinci_application_flow_policy.sign_on_registration.id
  priority       = 1
}
