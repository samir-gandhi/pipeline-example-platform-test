# Flow-level branding plumbing: the shared flows render {{global.variables.companyLogo}}
# and {{global.variables.companyName}}. Values come from the caller's branding object —
# the PingOne branding THEME itself stays at the caller's root (environment-specific).
resource "pingone_davinci_variable" "company_logo" {
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

resource "pingone_davinci_variable" "company_name" {
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
