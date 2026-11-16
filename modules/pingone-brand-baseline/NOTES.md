# pingone-brand-baseline module — build notes

## What it provisions (per brand environment)
42 resources: 9 forms, 2 DaVinci flows (Sign On+Registration, Session Main) + deploy/enable,
DaVinci SSO Connection app + Sign On flow policy + policy assignment to the brand's OIDC app,
9 connector instances, 5 DaVinci variables (ClientID/Secret/EnvironmentID + companyLogo/Name
= branding injection), population (theme-wired), branding theme, OIDC web app, key rotation policy.

## Non-obvious constraints discovered in smoke test (env brand-acme-smoke)
- openid/profile/email scopes: PREDEFINED per env; API rejects description changes → do NOT
  create/import; OIDC apps get them implicitly.
- Password policies Basic/Standard/Passphrase: PREDEFINED → data-source lookup, never create
  (UNIQUENESS_VIOLATION).
- pingone_key_rotation_policy requires: name, algorithm RSA (not ES256!), key_length
  2048/3072/4096/7680, signature_algorithm SHA256withRSA, usage_type, subject_dn.
- DaVinci form fields need BOTH camelCase (DaVinci JSON) AND snake_case (provider) attrs:
  title_enabled, input_type, polling_appearance, idp_id/idp_name/idp_type on SOCIAL_LOGIN_BUTTON
  (idp_type must be enum: FACEBOOK/APPLE/GOOGLE/LINKEDIN...; needs a real social IdP in env —
  dropped the LinkedIn buttons for the smoke; re-add when a brand wants social login).
- AGREEMENT form field needs a real agreement document id (agreement.id) — dropped the
  dynamic-agreement field; re-add with pingone_agreement resource when ToS demo needed.
- TEXT fields with user.* keys must have required=true (provider validation).

## Smoke test result
brand-acme-smoke environment (env id 86b283f3-...) fully provisioned: 38 resources in state,
flows deployed (v1) and enabled, zero errors on final apply.
