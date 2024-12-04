output "application_id" {
  value = azuread_application.main.client_id
}
output "service_principal_id" {
  value = azuread_service_principal.main.client_id
}
