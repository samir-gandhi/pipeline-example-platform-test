# Brand-specific branding theme. This is the child-unique configuration:
# every brand gets its own look, applied as the population default and
# injected into the shared flows via DaVinci variables.
resource "pingone_branding_theme" "brand" {
  environment_id     = var.environment_id
  name               = var.branding.name
  template           = var.branding.template
  body_text_color    = var.branding.body_text_color
  button_color       = var.branding.button_color
  button_text_color  = var.branding.button_text_color
  link_text_color    = var.branding.link_text_color
  heading_text_color = var.branding.heading_text_color
  card_color         = var.branding.card_color
  background_color   = var.branding.background_color
}

# Images: PingOne branding themes upload logo/background via the API's
# image endpoints. The Terraform provider manages them through separate
# resources; URL-based flow injection uses the DaVinci variables below.
resource "pingone_davinci_variable" "company_logo" {
  environment_id = var.environment_id
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
  environment_id = var.environment_id
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
