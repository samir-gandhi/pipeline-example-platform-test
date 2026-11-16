# The brand environment itself. Everything else in this module provisions
# inside it — callers pass only identity info.
resource "pingone_environment" "brand" {
  name        = var.environment_name
  description = "Brand environment provisioned by the GitOps pipeline"
  type        = var.environment_type
  license_id  = var.license_id

  services = [
    { type = "SSO" },
    { type = "MFA" },
    { type = "DaVinci", tags = ["DAVINCI_MINIMAL"] },
  ]
}

resource "pingone_key_rotation_policy" "brand" {
  environment_id      = pingone_environment.brand.id
  name                = "default"
  algorithm           = "RSA"
  key_length          = 3072
  signature_algorithm = "SHA256withRSA"
  usage_type          = "SIGNING"
  subject_dn          = "CN=${var.environment_name}"
}

data "pingone_password_policy" "standard" {
  environment_id = pingone_environment.brand.id
  name           = "Standard"
}
