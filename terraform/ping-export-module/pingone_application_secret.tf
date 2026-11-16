
resource "pingone_application_secret" "portal_secret" {
  environment_id = pingone_environment.brand.id
  application_id = pingone_application.baseline_reference_customer_portal.id
}


