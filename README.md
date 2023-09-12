<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >= 3.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | >= 3.20.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_identity_group.vault_admins](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group) | resource |
| [vault_identity_group_alias.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group_alias) | resource |
| [vault_jwt_auth_backend.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/jwt_auth_backend) | resource |
| [vault_jwt_auth_backend_role.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/jwt_auth_backend_role) | resource |
| [vault_policy.admin](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admins_group_metadata"></a> [admins\_group\_metadata](#input\_admins\_group\_metadata) | Map of additional metadata to associate with the group. | `map(string)` | <pre>{<br>  "description": "Vault administrators"<br>}</pre> | no |
| <a name="input_admins_group_name"></a> [admins\_group\_name](#input\_admins\_group\_name) | Name of the identity group (case-insensitive) to create in Vault | `string` | `"vault-admins"` | no |
| <a name="input_hide_oidc_mount"></a> [hide\_oidc\_mount](#input\_hide\_oidc\_mount) | When true hides OIDC mount from unathenticated users. | `bool` | `false` | no |
| <a name="input_oidc_client_id"></a> [oidc\_client\_id](#input\_oidc\_client\_id) | This is the application ID of your registered application in Azure. | `string` | n/a | yes |
| <a name="input_oidc_client_secret"></a> [oidc\_client\_secret](#input\_oidc\_client\_secret) | This is the value of the secret created in Certificates & secrets. | `string` | n/a | yes |
| <a name="input_oidc_description"></a> [oidc\_description](#input\_oidc\_description) | Sets the auth method description in Vault. | `string` | `"OIDC authentication"` | no |
| <a name="input_oidc_discovery_url"></a> [oidc\_discovery\_url](#input\_oidc\_discovery\_url) | OIDC discovery url, e.g. https://login.microsoftonline.com/your_tenant_id/v2.0. | `string` | n/a | yes |
| <a name="input_oidc_group_alias_name"></a> [oidc\_group\_alias\_name](#input\_oidc\_group\_alias\_name) | This value must be the Object ID of the Azure AD group. | `string` | n/a | yes |
| <a name="input_oidc_path"></a> [oidc\_path](#input\_oidc\_path) | Sets the mount path in Vault. | `string` | `"oidc"` | no |
| <a name="input_vault_hostname"></a> [vault\_hostname](#input\_vault\_hostname) | Vault hostname, e.g. 'vault.example.com' | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->