
resource "pingone_davinci_connector_instance" "pingcli__Annotation" {
  environment_id = var.pingone_environment_id
  name           = "Annotation"

  connector = {
    id = "annotationConnector"
  }
}


resource "pingone_davinci_connector_instance" "pingcli__Code-0020-Snippet" {
  environment_id = var.pingone_environment_id
  name           = "Code Snippet"

  connector = {
    id = "codeSnippetConnector"
  }
}


resource "pingone_davinci_connector_instance" "pingcli__Cookie" {
  environment_id = var.pingone_environment_id
  name           = "Cookie"

  connector = {
    id = "cookieConnector"
  }
}


resource "pingone_davinci_connector_instance" "pingcli__Error-0020-Message" {
  environment_id = var.pingone_environment_id
  name           = "Error Message"

  connector = {
    id = "errorConnector"
  }
}


resource "pingone_davinci_connector_instance" "pingcli__Http" {
  environment_id = var.pingone_environment_id
  name           = "Http"

  connector = {
    id = "httpConnector"
  }
}


resource "pingone_davinci_connector_instance" "pingcli__PingOne" {
  environment_id = var.pingone_environment_id
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
      "value" : var.davinci_connection_PingOne_envId
    },
    "region" : {
      "type" : "string",
      "value" : var.davinci_connection_PingOne_region
    }
  })
}


resource "pingone_davinci_connector_instance" "pingcli__PingOne-0020-Protect" {
  environment_id = var.pingone_environment_id
  name           = "PingOne Protect"

  connector = {
    id = "pingOneRiskConnector"
  }
  properties = jsonencode({
    "clientId" : {
      "type" : "string",
      "value" : var.davinci_connection_PingOne_0020_Protect_clientId
    },
    "clientSecret" : {
      "type" : "string",
      "value" : var.davinci_connection_PingOne_0020_Protect_clientSecret
    },
    "envId" : {
      "type" : "string",
      "value" : var.davinci_connection_PingOne_0020_Protect_envId
    },
    "region" : {
      "type" : "string",
      "value" : var.davinci_connection_PingOne_0020_Protect_region
    }
  })
}


resource "pingone_davinci_connector_instance" "pingcli__Variables" {
  environment_id = var.pingone_environment_id
  name           = "Variables"

  connector = {
    id = "variablesConnector"
  }
}