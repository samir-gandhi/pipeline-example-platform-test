# Seed package for the DaVinci API Protect registration/authentication demo.
# Adapted from pingidentity/ping-integration-example-packages
# (davinci_api-pingone_protect-reg-authn-pkg): one Protect-enabled flow,
# connector instances, the DaVinci application and flow policy, and the
# OIDC SDK sample app wired to the pipeline-managed environment.

module "feature-pkg" {
  source = "./feature-pkg"

  environment_id = pingone_environment.target_environment.id
  region_code    = var.pingone_client_region_code
  app_url        = "https://127.0.0.1:8080"

  # Root-managed resources reused by the package.
  oidc_sdk_resource_id = pingone_resource.oidc_sdk.id
  revoke_scope_id      = pingone_resource_scope.revoke.id
  pingone_connector_id = module.ping-export.connector_instance_ids.pingOne
  http_connector_id    = module.ping-export.connector_instance_ids.Http
  openid_scope_ids = [
    pingone_resource_scope_openid.profile_scope.id,
    pingone_resource_scope_openid.phone_scope.id,
    pingone_resource_scope_openid.email_scope.id,
  ]
}
