# INGR restructure: root module mirror shape

Actual terraform/ layout (parent and every child identical):

  terraform/
    providers.tf               (auth + region from localsecrets)
    environment.tf             (role data sources + group role assignments)
    branding.tf                (pingone_branding_theme - environment-specific)
    baseline.tf                (module "baseline" -> ./ping-export-module locally;
                                child repos: git:://parent//terraform/ping-export-module?ref=<tag>)
    ping-export-module/        (THE baseline module: env + all non-env-specific config;
                                continuous export target, branding excluded via --exclude-resources)
    sample_app.tf              (AWS hosting - optional per env)
    protect_app.tf             (worker apps + global.js for sample app)

## In the baseline module (terraform/ping-export-module)
- pingone_environment (brand env: SSO/MFA/DaVinci services) + key rotation policy
- DaVinci flows + deploy/enable + forms (IRCO Starter Kit)
- DaVinci SSO Connection app + flow policy + assignment to the brand OIDC app
- connector instances, DaVinci variables (companyLogo/Name = branding inject)
- population (Standard password policy lookup), OIDC web app, portal secret

## What stays per-environment (root)
- branding theme (the whole point of the demo)
- AWS sample-app hosting, worker apps, global.js

## Export flow
pingcli-terraformer export --exclude-resources 'regex:pingone_branding_theme' \
  -> writes ping-export-module/ (flows, forms, connectors, apps)
Parent consumes locally; children consume the same module via git:: tag.
