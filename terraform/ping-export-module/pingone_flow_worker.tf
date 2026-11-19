# The application the flow's PingOne SSO connector nodes authenticate as.
# In the source tenant this was the "Master Environment" app: an OIDC web
# app inside the brand environment whose client credentials the connector
# instances use for user management calls (createUser, checkPassword,
# verifyEmail, ...). The export strips those credentials to empty variables,
# so we recreate the app and wire the connector instance to it here.
resource "pingone_application" "flow_worker" {
  environment_id = pingone_environment.brand.id
  name           = "Master Environment"
  enabled        = true

  oidc_options = {
    type                       = "WORKER"
    grant_types                = ["CLIENT_CREDENTIALS"]
    token_endpoint_auth_method = "CLIENT_SECRET_BASIC"
  }
}

resource "pingone_application_secret" "flow_worker" {
  environment_id = pingone_environment.brand.id
  application_id = pingone_application.flow_worker.id
}

# The connector performs user reads/writes and password checks, which
# require the Identity Data Admin role scoped to this environment.
data "pingone_role" "identity_data_admin" {
  name = "Identity Data Admin"
}

resource "pingone_application_role_assignment" "flow_worker_identity_data_admin" {
  environment_id       = pingone_environment.brand.id
  application_id       = pingone_application.flow_worker.id
  role_id              = data.pingone_role.identity_data_admin.id
  scope_environment_id = pingone_environment.brand.id
}

# The PingOne SSO connector instance the flow's user-management nodes use.
resource "pingone_davinci_connector_instance" "pingone_master" {
  environment_id = pingone_environment.brand.id
  name           = "PingOne Master"

  connector = {
    id = "pingOneSSOConnector"
  }

  properties = jsonencode({
    "clientId" : {
      "type" : "string",
      "value" : pingone_application.flow_worker.oidc_options.client_id
    },
    "clientSecret" : {
      "type" : "string",
      "value" : pingone_application_secret.flow_worker.secret
    },
    "envId" : {
      "type" : "string",
      "value" : pingone_environment.brand.id
    },
    "envRegionInfo" : {
      "value" : null
    },
    "region" : {
      "type" : "string",
      "value" : var.davinci_connection_PingOne_region
    }
  })
}
