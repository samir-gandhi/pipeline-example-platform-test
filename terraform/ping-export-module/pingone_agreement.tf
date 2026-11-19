# End-user consent agreement shown by the IRCO Agreement form. The form's
# AGREEMENT field binds to this resource; the flow's acceptAgreement nodes
# read the agreement id from the form response at runtime.
resource "pingone_agreement" "consent" {
  environment_id        = pingone_environment.brand.id
  name                  = "Terms of Service"
  description           = "Consent to the terms of service and privacy policy."
  reconsent_period_days = 0
}
