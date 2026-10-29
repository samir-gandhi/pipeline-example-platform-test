# variable "pingone_environment_id" {
#   type        = string
#   description = "The PingOne environment ID to configure DaVinci resources in"
# 
#   validation {
#     condition     = can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.pingone_environment_id))
#     error_message = "The PingOne Environment ID must be a valid PingOne resource ID (UUID format)."
#   }
# }

# Pingone_davinci_variable Variables

variable "davinci_variable_sampleCompanyVar_value" {
  type        = string
  description = "Value for DaVinci variable sampleCompanyVar"
}

