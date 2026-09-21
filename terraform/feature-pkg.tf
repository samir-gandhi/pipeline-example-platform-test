# Seed package for the DaVinci API Registration authentication demo.
# Deployed once to introduce the flow into the target environment; then
# configuration is adopted into the export module via scripts/export_pingone.sh
# and this seed is retired.

module "feature-pkg" {
  source = "./feature-pkg"

  feature_pkg_domain_suffix = "com"
  environment_id            = pingone_environment.target_environment.id

  pingone_connector_id = module.ping-export.connector_instance_ids.pingOne
  http_connector_id    = module.ping-export.connector_instance_ids.Http
}
