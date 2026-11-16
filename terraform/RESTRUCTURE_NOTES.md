# INGR restructure: root module mirror shape

Target terraform/ layout (parent and every child identical):

  terraform/
    providers.tf               (auth + region from localsecrets)
    environment.tf             (pingone_environment, key rotation policy)
    branding.tf                (pingone_branding_theme - environment-specific)
    baseline.tf                (module "baseline" -> git:://parent//modules/pingone-brand-baseline?ref=<tag>)
    ping-export-module.tf      (module "ping-export" -> ./ping-export-module, continuous export target)
    ping-export-module/        (exported resources land here; branding excluded via --exclude-resources)
    sample_app.tf              (AWS hosting - optional per env)
    extras.tf                  (agreement, notification templates, language - env-specific polish)

## What moves into the baseline module (already there)
- DaVinci flows (Sign On+Registration, Session Main) + deploy/enable + forms
- DaVinci SSO Connection app + flow policy + assignment to the brand OIDC app
- connector instances, DaVinci variables (companyLogo/Name = branding inject)
- population (theme-wired), OIDC web app, key rotation policy

## What stays per-environment (root)
- pingone_environment itself (Q1: child repos create their own env)
- branding theme (the whole point of the demo)
- AWS sample-app hosting, agreement, notification templates, language

## Export flow
pingcli-terraformer export --exclude-resources pingone_branding_theme \
  -> writes ping-export-module/ (flows, forms, connectors, apps)
root module picks it up; branding stays hand-managed at root.
