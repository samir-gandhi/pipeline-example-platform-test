##########################################################################
# connectors.tf - DaVinci connector instances for the passwordless
# solution. Adapted from davinci-oidc_sdk-ciam_passwordless_solution-pkg;
# the PingOne-family connectors are wired to the pipeline's existing
# worker application credentials.
##########################################################################

resource "pingone_davinci_connector_instance" "challenge" {
  environment_id = var.environment_id
  name           = "Challenge"

  connector = {
    id = "challengeConnector"
  }
}

resource "pingone_davinci_connector_instance" "flow_connector" {
  environment_id = var.environment_id
  name           = "Flow Connector"

  connector = {
    id = "flowConnector"
  }
}

resource "pingone_davinci_connector_instance" "functions" {
  environment_id = var.environment_id
  name           = "Functions"

  connector = {
    id = "functionsConnector"
  }
}

resource "pingone_davinci_connector_instance" "node" {
  environment_id = var.environment_id
  name           = "Node"

  connector = {
    id = "nodeConnector"
  }
}

resource "pingone_davinci_connector_instance" "pingone_authentication" {
  environment_id = var.environment_id
  name           = "PingOne Authentication"

  connector = {
    id = "pingOneAuthenticationConnector"
  }
}

resource "pingone_davinci_connector_instance" "pingone_mfa" {
  environment_id = var.environment_id
  name           = "PingOne MFA"

  connector = {
    id = "pingOneMfaConnector"
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

resource "pingone_davinci_connector_instance" "pingone_notifications" {
  environment_id = var.environment_id
  name           = "PingOne Notifications"

  connector = {
    id = "notificationsConnector"
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

resource "pingone_davinci_connector_instance" "string_manipulation" {
  environment_id = var.environment_id
  name           = "String Manipulation"

  connector = {
    id = "stringsConnector"
  }
}

resource "pingone_davinci_connector_instance" "variables" {
  environment_id = var.environment_id
  name           = "Variables"

  connector = {
    id = "variablesConnector"
  }
}
