# create an initial administrator policy
resource "vault_policy" "admin" {
  name   = "admin"
  policy = file("files/policies/admin.hcl")
}

# enable the OIDC backend
resource "vault_jwt_auth_backend" "default" {
  description        = var.oidc_description
  path               = var.oidc_path
  type               = "oidc"
  oidc_discovery_url = var.oidc_discovery_url
  oidc_client_id     = var.oidc_client_id
  oidc_client_secret = var.oidc_client_secret
  default_role       = "default"
  tune {
    listing_visibility = var.hide_oidc_mount ? "hidden" : "unauth"
    max_lease_ttl      = "12h"
    default_lease_ttl  = "8h"
    token_type         = "default-service"
  }
}

# deault group with default policy, additional policies determined by group membership
resource "vault_jwt_auth_backend_role" "default" {
  backend               = vault_jwt_auth_backend.default.path
  role_name             = "default"
  token_policies        = ["default"]
  user_claim            = "sub"
  groups_claim          = "groups"
  role_type             = "oidc"
  allowed_redirect_uris = ["http://localhost:8250/oidc/callback", "https://${var.vault_hostname}:8200/ui/vault/auth/${var.oidc_path}/oidc/callback"]
  oidc_scopes           = ["https://graph.microsoft.com/.default"]
}

# 
resource "vault_identity_group" "vault_admins" {
  name     = var.admins_group_name
  type     = "external"
  metadata = var.admins_group_metadata
  policies = [vault_policy.admin.name]
}

resource "vault_identity_group_alias" "default" {
  name           = var.oidc_group_alias_name
  mount_accessor = vault_jwt_auth_backend.default.accessor
  canonical_id   = vault_identity_group.vault_admins.id
}
