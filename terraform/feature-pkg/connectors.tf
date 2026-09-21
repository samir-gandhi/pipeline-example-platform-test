##########################################################################
# connectors.tf - DaVinci connector instances for the API Protect
# solution. Adapted from davinci_api-pingone_protect-reg-authn-pkg.
# Http and PingOne connector instances are reused from the export
# module; the Protect connector is wired to the package worker app.
##########################################################################

resource "pingone_davinci_connector_instance" "pingone_protect" {
  environment_id = var.environment_id
  name           = "PingOne Protect"

  connector = {
    id = "pingOneRiskConnector"
  }
  properties = jsonencode({
    "clientId" : {
      "type" : "string",
      "value" : pingone_application.pkg_worker_app.oidc_options.client_id
    },
    "clientSecret" : {
      "type" : "string",
      "value" : pingone_application_secret.pkg_worker_app.secret
    },
    "envId" : {
      "type" : "string",
      "value" : var.environment_id
    },
    "region" : {
      "type" : "string",
      "value" : var.region_code
    }
  })
}

resource "pingone_davinci_connector_instance" "variables" {
  environment_id = var.environment_id
  name           = "Variables"

  connector = {
    id = "variablesConnector"
  }
}
