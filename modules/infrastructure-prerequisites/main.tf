terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "0.50.0"
    }
  }

  required_version = "~> 1.6.3"
}

provider "tfe" {
  token = var.tfc_api_token
}

resource "tfe_organization" "main" {
  name  = var.organization_name
  email = var.organization_email
  cost_estimation_enabled = true
  allow_force_delete_workspaces = false
}

resource "tfe_workspace" "remote_operations" {
  name  = var.remote_operations_workspace
  organization = var.organization_name
  description = "This workspace is bootstrapped via GH workflow (bootstrap-terraform-cloud.yaml). It enables us to perform remote operations on TFC and synchronize its resources."
  execution_mode = "remote"
}

