variable "environment_id" {
  description = "PingOne environment ID this baseline is deployed into (the child brand environment)."
  type        = string

  validation {
    condition     = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.environment_id))
    error_message = "The environment_id must be a PingOne resource ID (UUID)."
  }
}

variable "environment_name" {
  description = "PingOne environment name — used in resource descriptions only."
  type        = string
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

variable "davinci_connection_PingOne_envId" {
  description = "Environment ID scoped into the DaVinci PingOne connector (defaults to environment_id)."
  type        = string
}

variable "davinci_connection_PingOne_region" {
  description = "Region code for the DaVinci PingOne connector (e.g. NA)."
  type        = string
}
