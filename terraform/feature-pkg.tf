# Seed package for the CIAM Passwordless + Protect solution demo.
# Adapted from pingidentity/ping-integration-example-packages
# (davinci-oidc_sdk-ciam_passwordless_solution-pkg). Deploys 11 DaVinci
# flows, connector instances, variables, and the OIDC SDK sample app
# wired to the pipeline-managed environment.

module "feature-pkg" {
  source = "./feature-pkg"

  environment_id            = pingone_environment.target_environment.id
  feature_pkg_domain_suffix = "com"
  region_code               = var.pingone_client_region_code
  app_url                   = "https://127.0.0.1:8080"

  # Root-managed resources reused by the package.
  agreement_id               = pingone_agreement.agreement.id
  oidc_sdk_resource_id       = pingone_resource.oidc_sdk.id
  revoke_scope_id            = pingone_resource_scope.revoke.id
  pingone_connector_id       = module.ping-export.connector_instance_ids.pingOne
  http_connector_id          = module.ping-export.connector_instance_ids.Http
  annotation_connector_id    = module.ping-export.connector_instance_ids.Annotation
  error_message_connector_id = module.ping-export.connector_instance_ids.ErrorMessage
  openid_scope_ids = [
    pingone_resource_scope_openid.profile_scope.id,
    pingone_resource_scope_openid.phone_scope.id,
    pingone_resource_scope_openid.email_scope.id,
  ]
}
