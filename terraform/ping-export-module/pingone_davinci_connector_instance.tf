resource "pingone_davinci_connector_instance" "annotation" {
  environment_id = pingone_environment.brand.id
  name           = "Annotation"

  connector = {
    id = "annotationConnector"
  }
}



resource "pingone_davinci_connector_instance" "error_message" {
  environment_id = pingone_environment.brand.id
  name           = "Error Message"

  connector = {
    id = "errorConnector"
  }
}



resource "pingone_davinci_connector_instance" "flow_connector" {
  environment_id = pingone_environment.brand.id
  name           = "Flow Connector"

  connector = {
    id = "flowConnector"
  }
}



resource "pingone_davinci_connector_instance" "functions" {
  environment_id = pingone_environment.brand.id
  name           = "Functions"

  connector = {
    id = "functionsConnector"
  }
}



resource "pingone_davinci_connector_instance" "http" {
  environment_id = pingone_environment.brand.id
  name           = "Http"

  connector = {
    id = "httpConnector"
  }
}



resource "pingone_davinci_connector_instance" "pingone" {
  environment_id = pingone_environment.brand.id
  name           = "PingOne"

  connector = {
    id = "pingOneSSOConnector"
  }
  properties = jsonencode({
    "clientId" : {
      "type" : "string",
      "value" : var.davinci_connection_PingOne_clientId
    },
    "clientSecret" : {
      "type" : "string",
      "value" : var.davinci_connection_PingOne_clientSecret
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



resource "pingone_davinci_connector_instance" "pingone_authentication" {
  environment_id = pingone_environment.brand.id
  name           = "PingOne Authentication"

  connector = {
    id = "pingOneAuthenticationConnector"
  }
}



resource "pingone_davinci_connector_instance" "teleport" {
  environment_id = pingone_environment.brand.id
  name           = "Teleport"

  connector = {
    id = "nodeConnector"
  }
}



resource "pingone_davinci_connector_instance" "variables" {
  environment_id = pingone_environment.brand.id
  name           = "Variables"

  connector = {
    id = "variablesConnector"
  }
}