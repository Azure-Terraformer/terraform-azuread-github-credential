mock_provider "azuread" {}

run "setup" {
  module {
    source = "./testing/setup"
  }
  providers = {
    azuread = azuread
  }
}

run "environment" {
  module {
    source = "./examples/environment"
  }

  providers = {
    azuread = azuread
  }

  assert {
    condition     = length(module.credential.service_principal.object_id) > 0
    error_message = "Must have an object ID"
  }
}
