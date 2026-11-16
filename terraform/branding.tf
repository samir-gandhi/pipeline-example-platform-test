# Environment-specific branding — the parent's own theme. Children mirror
# this file with their brand's values. Kept at the root, excluded from
# exports (--exclude-resources pingone_branding_theme) so it stays
# hand-managed.
resource "pingone_branding_theme" "brand" {
  environment_id     = module.baseline.environment_id
  name               = var.pingone_environment_name
  template           = "focus"
  body_text_color    = "#000000"
  button_color       = "#000000"
  button_text_color  = "#ffffff"
  link_text_color    = "#000000"
  heading_text_color = "#000000"
  card_color         = "#ffffff"
  background_color   = "#ffffff"
}
