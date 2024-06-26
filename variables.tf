variable "oidc_description" {
  description = "Sets the auth method description in Vault."
  default     = "OIDC authentication"
  type        = string
}

variable "oidc_path" {
  description = "Sets the mount path in Vault."
  default     = "oidc"
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant ID."
  type        = string
}

variable "oidc_client_id" {
  description = "This is the application ID of your registered application in Azure."
  type        = string
}

variable "oidc_client_secret" {
  description = "This is the value of the secret created in Certificates & secrets."
  type        = string
}

variable "hide_oidc_mount" {
  description = "When true hides OIDC mount from unathenticated users."
  default     = false
  type        = bool
}

variable "admins_group_name" {
  description = "Name of the identity group (case-insensitive) to create in Vault"
  default     = "vault-admins"
  type        = string
}

variable "admins_group_metadata" {
  description = "Map of additional metadata to associate with the group."
  default = {
    description = "Vault administrators"
  }
  type = map(string)
}

variable "oidc_group_alias_name" {
  description = "This value must be the Object ID of the Azure AD group."
  type        = string
}

variable "vault_hostname" {
  description = "Vault hostname, e.g. 'vault.example.com'"
  type        = string
}
