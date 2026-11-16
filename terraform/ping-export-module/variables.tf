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

variable "davinci_connection_PingOne_clientId" {
  description = "Worker application client ID the DaVinci PingOne connector uses to call the brand environment's API."
  type        = string
}

variable "davinci_connection_PingOne_clientSecret" {
  description = "Worker application client secret for the DaVinci PingOne connector."
  type        = string
  sensitive   = true
}

variable "davinci_connection_PingOne_region" {
  description = "Region code for the DaVinci PingOne connector (e.g. NA)."
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
