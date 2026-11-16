
resource "pingone_davinci_variable" "clientid_flowinstance" {
  environment_id = pingone_environment.brand.id
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
  environment_id = pingone_environment.brand.id
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


resource "pingone_davinci_variable" "companylogo_flowinstance" {
  environment_id = pingone_environment.brand.id
  name           = "companyLogo"
  context        = "flowInstance"
  data_type      = "string"
  mutable        = true
  display_name   = "Url for company's logo image"
  min            = 0
  max            = 2000

  value = {
    string = var.branding.logo_url
  }
}


resource "pingone_davinci_variable" "companyname_flowinstance" {
  environment_id = pingone_environment.brand.id
  name           = "companyName"
  context        = "flowInstance"
  data_type      = "string"
  mutable        = true
  min            = 0
  max            = 2000

  value = {
    string = var.branding.name
  }
}


resource "pingone_davinci_variable" "environmentid_flowinstance" {
  environment_id = pingone_environment.brand.id
  name           = "EnvironmentID"
  context        = "flowInstance"
  data_type      = "string"
  mutable        = true
  display_name   = "EnvironmentID of User Accounts Environment {{global.variables.EnvironmentID}}"
  min            = 0
  max            = 2000

  value = {
    string = pingone_environment.brand.id
  }
}