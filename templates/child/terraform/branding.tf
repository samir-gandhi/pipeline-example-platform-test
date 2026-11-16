# Child branding theme — environment-specific, excluded from exports.
# Generic starter palette; each business can restyle its own theme here.
resource "pingone_branding_theme" "brand" {
  environment_id     = module.baseline.environment_id
  name               = "__BUSINESS__"
  template           = "focus"
  body_text_color    = "#1a1a2e"
  button_color       = "#2563eb"
  button_text_color  = "#ffffff"
  link_text_color    = "#2563eb"
  heading_text_color = "#1a1a2e"
  card_color         = "#ffffff"
  background_color   = "#f5f5f7"
}
