# Password policies are predefined in every PingOne environment (Basic,
# Standard, Passphrase) — the API rejects creating duplicates. Look them up.
data "pingone_password_policy" "standard" {
  environment_id = var.environment_id
  name           = "Standard"
}
