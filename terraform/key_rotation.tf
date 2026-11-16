resource "pingone_key_rotation_policy" "target" {
  environment_id      = module.baseline.environment_id
  name                = "default"
  algorithm           = "RSA"
  key_length          = 3072
  signature_algorithm = "SHA256withRSA"
  usage_type          = "SIGNING"
  subject_dn          = "CN=${var.pingone_environment_name}"
}
