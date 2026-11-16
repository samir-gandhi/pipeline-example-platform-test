
resource "pingone_davinci_variable" "clientid_flowinstance" {
  environment_id = var.environment_id
  name           = "ClientID"
  context        = "flowInstance"
  data_type      = "string"
  mutable        = true
  display_name   = "ClientID of User Accounts Environment {{global.variables.ClientID}}"
  min            = 0
  max            = 2000

  value = {
    string = var.davinci_connection_PingOne_clientId
  }
}


resource "pingone_davinci_variable" "clientsecret_flowinstance" {
  environment_id = var.environment_id
  name           = "ClientSecret"
  context        = "flowInstance"
  data_type      = "string"
  mutable        = true
  display_name   = "Client Secret of User Accounts Environment {{global.variables.ClientSecret}}"
  min            = 0
  max            = 2000

  value = {
    string = var.davinci_connection_PingOne_clientSecret
  }
}




resource "pingone_davinci_variable" "environmentid_flowinstance" {
  environment_id = var.environment_id
  name           = "EnvironmentID"
  context        = "flowInstance"
  data_type      = "string"
  mutable        = true
  display_name   = "EnvironmentID of User Accounts Environment {{global.variables.EnvironmentID}}"
  min            = 0
  max            = 2000

  value = {
    string = var.environment_id
  }
}