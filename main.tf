
locals {
  subjects = {
    "environment" = "repo:${var.github_organization}/${var.repository_name}:environment:${var.environment_name}"
    "branch"      = "repo:${var.github_organization}/${var.repository_name}:ref:refs/heads/${var.branch_name}"
    "pr"          = "repo:${var.github_organization}/${var.repository_name}:pull_request"
    "tag"         = "repo:${var.github_organization}/${var.repository_name}:ref:refs/tags/${var.tag_name}"
  }
}

resource "azuread_application_federated_identity_credential" "identity" {

  application_id = azuread_application.identity[each.key].id
  display_name   = "${var.github_organization}-${var.repository_name}-${var.environment_name}-identity-${random_string.main.result}"
  description    = "Deployments for ${var.github_organization}-${var.repository_name}-${var.environment_name}"
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://token.actions.githubusercontent.com"
  subject        = local.subjects[var.tag_name]

}
