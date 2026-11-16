
resource "pingone_application_flow_policy_assignment" "d27f5b2b_12bc_4dc4_b03d_262653a9198d" {
  environment_id = pingone_environment.brand.id
  application_id = pingone_application.baseline_reference_customer_portal.id
  flow_policy_id = pingone_davinci_application_flow_policy.pingone___sign_on_and_registration.id
  priority       = 1
}