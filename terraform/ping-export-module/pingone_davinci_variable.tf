
resource "pingone_davinci_variable" "pingcli__companyLogo_flowInstance" {
  environment_id = var.pingone_environment_id
  name           = "companyLogo"
  context        = "flowInstance"
  data_type      = "string"
  mutable        = true
  display_name   = "Url for company's logo image"
  min            = 0
  max            = 2000
}


resource "pingone_davinci_variable" "pingcli__companyName_flowInstance" {
  environment_id = var.pingone_environment_id
  name           = "companyName"
  context        = "flowInstance"
  data_type      = "string"
  mutable        = true
  min            = 0
  max            = 2000
}