terraform {
  required_version = ">= 1.6.0"

  required_providers {
    pingone = {
      source  = "pingidentity/pingone"
      version = ">= 1.19.1, < 2.0.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.4"
    }
  }
  backend "s3" {}
}

provider "pingone" {
  client_id      = var.pingone_client_id
  client_secret  = var.pingone_client_secret
  environment_id = var.pingone_client_environment_id
  region_code    = var.pingone_client_region_code
}
