variable "environment_name" {
  description = "PingOne environment name to create (the brand environment)."
  type        = string
}

variable "license_id" {
  description = "PingOne license ID the environment is created under."
  type        = string
}

variable "environment_type" {
  description = "PingOne environment type (SANDBOX or PRODUCTION)."
  type        = string
  default     = "SANDBOX"
}

variable "branding" {
  description = "Brand-specific branding theme, injected into the shared flows."
  type = object({
    name               = string
    template           = optional(string, "focus")
    body_text_color    = optional(string, "#000000")
    button_color       = optional(string, "#000000")
    button_text_color  = optional(string, "#ffffff")
    link_text_color    = optional(string, "#000000")
    heading_text_color = optional(string, "#000000")
    card_color         = optional(string, "#ffffff")
    link_color         = optional(string)
    background_color   = optional(string, "#ffffff")
    logo_url           = string
    background_url     = optional(string)
  })
}





variable "region_code" {
  description = "PingOne region code the DaVinci PingOne connector calls (matches the environment's provider region)."
  type        = string
}

variable "oidc_redirect_uris" {
  description = "Redirect URIs for the brand's OIDC application."
  type        = list(string)
}

variable "oidc_post_logout_redirect_uris" {
  description = "Post-logout redirect URIs for the brand's OIDC application."
  type        = list(string)
}
