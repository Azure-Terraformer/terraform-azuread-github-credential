resource "azuread_application" "main" {

  display_name = "${var.github_organization}-${var.repository_name}-identity"

}

resource "azuread_service_principal" "main" {

  client_id                    = azuread_application.main.client_id
  app_role_assignment_required = false
  owners                       = var.owners

}

locals {
  subjects = {
    "environment" = "repo:${var.github_organization}/${var.repository_name}:environment:${var.environment_name}"
    "branch"      = "repo:${var.github_organization}/${var.repository_name}:ref:refs/heads/${var.branch_name}"
    "pr"          = "repo:${var.github_organization}/${var.repository_name}:pull_request"
    "tag"         = "repo:${var.github_organization}/${var.repository_name}:ref:refs/tags/${var.tag_name}"
  }
}

resource "azuread_application_federated_identity_credential" "main" {

  application_id = azuread_application.main.id
  display_name   = "${var.github_organization}-${var.repository_name}-${var.environment_name}-identity"
  description    = "Deployments for ${var.github_organization}-${var.repository_name}-${var.environment_name}"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://token.actions.githubusercontent.com"
  subject        = local.subjects[var.tag_name]

}
