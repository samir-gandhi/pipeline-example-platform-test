module "ping-export" {
  source = "./ping-export-module"

  pingone_environment_id = pingone_environment.target_environment.id

  # Pingone_davinci_connector_instance Variables
  davinci_connection_PingOne_clientId     = var.davinci_connection_PingOne_clientId
  davinci_connection_PingOne_clientSecret = var.davinci_connection_PingOne_clientSecret
  davinci_connection_PingOne_envId        = pingone_environment.target_environment.id
  davinci_connection_PingOne_region       = var.davinci_connection_PingOne_region

}
