# Overview

This Terraform module streamlines the setup of secure OpenID Connect (OIDC) authentication between GitHub Actions and Azure by provisioning essential Azure Active Directory (Azure AD) resources. Specifically, it creates an Azure AD Application and its corresponding Service Principal, establishing a dedicated identity for GitHub Actions to interact with Azure services. 

Additionally, the module configures a Federated Identity Credential tailored to specific GitHub entities—such as environments, branches, tags, or pull requests—ensuring that authentication is scoped and managed appropriately. 

By automating the creation and configuration of these Azure AD components, the module enhances security, promotes consistent infrastructure deployments, and integrates seamlessly within the GitHub AT-AT framework, facilitating efficient and secure automation for Terraform and Azure-based projects.

https://learn.microsoft.com/en-us/entra/workload-id/workload-identity-federation-create-trust?pivots=identity-wif-apps-methods-azp