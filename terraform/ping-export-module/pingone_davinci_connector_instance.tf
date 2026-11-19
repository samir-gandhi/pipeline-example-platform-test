
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
resource "pingone_davinci_connector_instance" "form" {
  environment_id = pingone_environment.brand.id
  name           = "Form"

  connector = {
    id = "pingOneFormsConnector"
  }
}

resource "pingone_davinci_connector_instance" "authentication" {
  environment_id = pingone_environment.brand.id
  name           = "Authentication"

  connector = {
    id = "authenticationUseCaseConnector"
  }
}
