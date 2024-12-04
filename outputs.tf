output "application" {
  value = {
    client_id = azuread_application.main.client_id
    object_id = azuread_application.main.object_id
  }
}
output "service_principal" {
  value = {
    client_id = azuread_service_principal.main.client_id
    object_id = azuread_service_principal.main.object_id
  }
}
