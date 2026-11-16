
data "pingone_role" "davinci_admin" {
  name = "DaVinci Admin"
}

data "pingone_role" "identity_data_admin" {
  name = "Identity Data Admin"
}

# PingOne Role Assignments for the DaVinci Terraform Administrators group on
# each provisioned environment: DaVinci Admin covers flows/connectors, the
# platform roles cover population/application/agreement administration when
# working in a provisioned environment with Ping CLI (human device auth).
resource "pingone_group_role_assignment" "terraform_sso_davinci_admin" {
  environment_id       = var.pingone_davinci_admin_environment_id
  group_id             = var.pingone_davinci_terraform_group_id
  role_id              = data.pingone_role.davinci_admin.id
  scope_environment_id = module.baseline.environment_id
}

resource "pingone_group_role_assignment" "terraform_sso_environment_admin" {
  environment_id       = var.pingone_davinci_admin_environment_id
  group_id             = var.pingone_davinci_terraform_group_id
  role_id              = data.pingone_role.environment_admin.id
  scope_environment_id = module.baseline.environment_id
}

resource "pingone_group_role_assignment" "terraform_sso_identity_data_admin" {
  environment_id       = var.pingone_davinci_admin_environment_id
  group_id             = var.pingone_davinci_terraform_group_id
  role_id              = data.pingone_role.identity_data_admin.id
  scope_environment_id = module.baseline.environment_id
}
