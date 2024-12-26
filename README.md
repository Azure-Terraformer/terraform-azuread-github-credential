# Overview

This Terraform module streamlines the setup of secure OpenID Connect (OIDC) authentication between GitHub Actions and Azure by provisioning essential Azure Active Directory (Azure AD) resources. Specifically, it creates an Azure AD Application and its corresponding Service Principal, establishing a dedicated identity for GitHub Actions to interact with Azure services. 

Additionally, the module configures a Federated Identity Credential tailored to specific GitHub entities—such as environments, branches, tags, or pull requests—ensuring that authentication is scoped and managed appropriately. 

By automating the creation and configuration of these Azure AD components, the module enhances security, promotes consistent infrastructure deployments, and integrates seamlessly within the GitHub AT-AT framework, facilitating efficient and secure automation for Terraform and Azure-based projects.

This module follows the [official documentation](https://learn.microsoft.com/en-us/entra/workload-id/workload-identity-federation-create-trust?pivots=identity-wif-apps-methods-azp)
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 3.0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | ~> 3.0.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_application.main](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) | resource |
| [azuread_application_federated_identity_credential.main](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_federated_identity_credential) | resource |
| [azuread_service_principal.main](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_branch_name"></a> [branch\_name](#input\_branch\_name) | The name of the branch (e.g., develop, main).<br>This is required if 'entity\_type' is set to 'branch'. | `string` | `""` | no |
| <a name="input_description"></a> [description](#input\_description) | A brief description of the Entra ID Application. This helps in identifying the purpose of the application within Entra ID. | `string` | `""` | no |
| <a name="input_entity_type"></a> [entity\_type](#input\_entity\_type) | The Entity Type of the Federated Identity Credential. Valid values are:<br>- 'environment': Represents a GitHub Environment (e.g., DEV, PROD).<br>- 'branch': Represents a GitHub branch.<br>- 'tag': Represents a GitHub tag.<br>- 'pr': Represents a GitHub pull request.<br><br>This value determines which additional variables must be set. | `string` | n/a | yes |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | The name of the environment (e.g., DEV, PROD).<br>This is required if 'entity\_type' is set to 'environment'. | `string` | `""` | no |
| <a name="input_github_organization"></a> [github\_organization](#input\_github\_organization) | The name of the GitHub organization.<br>This is used to scope the repository and actions workflows. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The display name for the Entra ID Application. This name identifies the application within Entra ID. | `string` | n/a | yes |
| <a name="input_owners"></a> [owners](#input\_owners) | A list of the owners for the Entra ID Application | `list(string)` | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | The name of the GitHub repository.<br>This repository will be used to store and manage the workflows and codebase. | `string` | n/a | yes |
| <a name="input_tag_name"></a> [tag\_name](#input\_tag\_name) | The name of the Git tag (e.g., v1.0.0).<br>This is required if 'entity\_type' is set to 'tag'. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application"></a> [application](#output\_application) | Details of the Azure AD Application created by the module.<br><br>- **client\_id**: The unique identifier (Client ID) assigned to the Entra ID Application. This ID is used to authenticate the application when interacting with Azure services.<br>- **object\_id**: The unique identifier (Object ID) of the Entra ID Application within the Entra ID Tenant Directory. This ID is used for managing the application within Entra ID. |
| <a name="output_service_principal"></a> [service\_principal](#output\_service\_principal) | Details of the Entra ID Service Principal associated with the application.<br><br>- **client\_id**: The unique identifier (Client ID) assigned to the Entra ID Service Principal. This ID is used by the Service Principal to authenticate with Azure services.<br>- **object\_id**: The unique identifier (Object ID) of the Entra ID Service Principal within Entra ID Tenant Directory. This ID is used for managing the Service Principal within Entra ID. |
<!-- END_TF_DOCS -->