# Seed package for the DaVinci API Protect registration/authentication demo.
# Adapted from pingidentity/ping-integration-example-packages
# (davinci_api-pingone_protect-reg-authn-pkg): one Protect-enabled flow,
# connector instances, the DaVinci application and flow policy, and the
# OIDC SDK sample app wired to the pipeline-managed environment.

module "feature-pkg" {
  source = "./feature-pkg"

  environment_id = pingone_environment.target_environment.id
  app_url        = "https://127.0.0.1:8080"

  # Root-managed resources reused by the package.
  oidc_sdk_resource_id = pingone_resource.oidc_sdk.id
  revoke_scope_id      = pingone_resource_scope.revoke.id
  dv_flow_policy_id    = module.ping-export.flow_policy_ids.main
  dv_api_key           = module.ping-export.davinci_application_api_key
  openid_scope_ids = [
    pingone_resource_scope_openid.profile_scope.id,
    pingone_resource_scope_openid.phone_scope.id,
    pingone_resource_scope_openid.email_scope.id,
  ]
}
