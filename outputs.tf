output "application" {
  value = {
    client_id = azuread_application.main.client_id
    object_id = azuread_application.main.object_id
  }
  description = <<DESCRIPTION
Details of the Azure AD Application created by the module.

- **client_id**: The unique identifier (Client ID) assigned to the Entra ID Application. This ID is used to authenticate the application when interacting with Azure services.
- **object_id**: The unique identifier (Object ID) of the Entra ID Application within the Entra ID Tenant Directory. This ID is used for managing the application within Entra ID.
DESCRIPTION
}
output "service_principal" {
  value = {
    client_id = azuread_service_principal.main.client_id
    object_id = azuread_service_principal.main.object_id
  }
  description = <<DESCRIPTION
Details of the Entra ID Service Principal associated with the application.

- **client_id**: The unique identifier (Client ID) assigned to the Entra ID Service Principal. This ID is used by the Service Principal to authenticate with Azure services.
- **object_id**: The unique identifier (Object ID) of the Entra ID Service Principal within Entra ID Tenant Directory. This ID is used for managing the Service Principal within Entra ID.
DESCRIPTION
}
