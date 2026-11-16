# The openid/profile/email scopes are predefined in every PingOne
# environment. They cannot be created or modified (API rejects description
# updates on predefined scopes). Import per environment after provisioning:
#   terraform import 'pingone_resource_scope_openid.scopes["openid"]' <environment_id>/<scope_id>
# The OIDC app's openid grant uses the built-in scopes by name; no explicit
# grant resource is needed for OPENID_CONNECT-type apps (implicit access to
# predefined scopes via the flow's consent model).
