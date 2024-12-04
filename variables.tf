variable "github_organization" {
  type        = string
  description = <<DESCRIPTION
The name of the GitHub organization.
This is used to scope the repository and actions workflows.
DESCRIPTION

}

variable "repository_name" {
  type        = string
  description = <<DESCRIPTION
The name of the GitHub repository.
This repository will be used to store and manage the workflows and codebase.
DESCRIPTION

}

variable "entity_type" {
  type        = string
  description = <<DESCRIPTION
The Entity Type of the Federated Identity Credential. Valid values are:
- 'environment': Represents a GitHub Environment (e.g., DEV, PROD).
- 'branch': Represents a GitHub branch.
- 'tag': Represents a GitHub tag.
- 'pr': Represents a GitHub pull request.

This value determines which additional variables must be set.
DESCRIPTION

  validation {
    condition     = contains(local.valid_entity_types, var.entity_type)
    error_message = "The value must be one of the following: ${join(", ", local.valid_entity_types)}."
  }
}

variable "environment_name" {
  type        = string
  default     = null
  description = <<DESCRIPTION
The name of the environment (e.g., DEV, PROD).
This is required if 'entity_type' is set to 'environment'.
DESCRIPTION

  validation {
    condition     = var.entity_type != "environment" || (var.entity_type == "environment" && length(var.environment_name) > 0)
    error_message = "The environment_name variable is required when entity_type is set to 'environment'."
  }

}

variable "branch_name" {
  type        = string
  default     = null
  description = <<DESCRIPTION
The name of the branch (e.g., develop, main).
This is required if 'entity_type' is set to 'branch'.
DESCRIPTION

  validation {
    condition     = var.entity_type != "branch" || (var.entity_type == "branch" && length(var.branch_name) > 0)
    error_message = "The branch_name variable is required when entity_type is set to 'branch'."
  }

}

variable "tag_name" {
  type        = string
  default     = null
  description = <<DESCRIPTION
The name of the Git tag (e.g., v1.0.0).
This is required if 'entity_type' is set to 'tag'.
DESCRIPTION

  validation {
    condition     = var.entity_type != "tag" || (var.entity_type == "tag" && length(var.tag_name) > 0)
    error_message = "The tag_name variable is required when entity_type is set to 'tag'."
  }

}

variable "owners" {
  type        = list(string)
  description = "A list of the owners for the Entra ID Application"
}
