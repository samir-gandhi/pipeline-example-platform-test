
resource "pingone_application_attribute_mapping" "sub_portal" {
  environment_id = pingone_environment.brand.id
  application_id = pingone_application.baseline_reference_customer_portal.id
  name           = "sub"
  value          = "$${user.id}"
  required       = true
}


