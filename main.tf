resource "azuread_application" "main" {

  display_name = var.name
  description  = var.description

}

resource "azuread_service_principal" "main" {

  client_id                    = azuread_application.main.client_id
  app_role_assignment_required = false
  owners                       = var.owners

}

locals {
  subject_prefix = "repo:${var.github_organization}/${var.repository_name}"
  subjects = {
    "environment" = try("${local.subject_prefix}:environment:${var.environment_name}")
    "branch"      = try("${local.subject_prefix}:ref:refs/heads/${var.branch_name}")
    "pr"          = try("${local.subject_prefix}:pull_request")
    "tag"         = try("${local.subject_prefix}:ref:refs/tags/${var.tag_name}")
  }
}

resource "azuread_application_federated_identity_credential" "main" {

  application_id = azuread_application.main.id
  display_name   = var.name
  description    = "Deployments for ${var.github_organization}-${var.repository_name}-${var.environment_name}"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://token.actions.githubusercontent.com"
  subject        = local.subjects[var.entity_type]

}
