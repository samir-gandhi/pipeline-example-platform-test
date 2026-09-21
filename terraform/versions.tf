terraform {
  required_version = ">= 1.6.0"
  required_providers {
    pingone = {
      source  = "pingidentity/pingone"
      version = ">= 1.19.1, < 2.0.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.4"
    }
  }
  backend "s3" {}
}