resource "random_string" "application_name" {
  length  = 8
  upper   = true
  lower   = true
  numeric = true
  special = false
}

resource "azuread_application" "main" {

  display_name = "app-${random_string.application_name.result}"
  description  = "just a test"

}

resource "azuread_service_principal" "main" {

  client_id                    = azuread_application.main.client_id
  app_role_assignment_required = false
  owners                       = []
  description                  = "just a test"

}

module "credential" {

  source = "../../"

  application_id      = azuread_application.main.id
  name                = "app-${random_string.application_name.result}-dev"
  github_organization = "foo"
  repository_name     = "bar"
  entity_type         = "environment"
  environment_name    = "dev"

}
