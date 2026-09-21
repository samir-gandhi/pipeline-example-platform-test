##########################################################################
# notifications.tf - Notification templates for the passwordless solution.
# Adapted from davinci-oidc_sdk-ciam_passwordless_solution-pkg.
##########################################################################

resource "pingone_notification_template_content" "email" {
  environment_id = var.environment_id
  template_name  = "general"
  locale         = "en"
  variant        = "Magic Link"

  email = {
    body    = <<EOT
<div style="display: block; text-align: center; font-family: sans-serif; border: 1px solid #c5c5c5; width: 400px; padding: 50px 30px;">
<img class="align-self-center mb-5" src="$${logoUrl}" alt="$${companyName}" style="$${logoStyle}"/>
     <h1>Success</h1>
     <div style="margin-top: 20px; margin-bottom:25px">
     <p> Please click the link below to confirm your email for Authentication. </p>
     <a href="$${magicLink}" style="font-size: 14pt">Confirmation Link</a>
     </div>
</div>
EOT
    subject = "Magic Link Authentication"

    from = {
      name    = "PingOne"
      address = "noreply@pingidentity.com"
    }
  }
}

resource "pingone_notification_template_content" "unknown_device" {
  environment_id = var.environment_id
  template_name  = "general"
  locale         = "en"
  variant        = "Unknown Device"

  email = {
    body    = <<EOT
    <div style="display: block; text-align: center; font-family: sans-serif; border: 1px solid #c5c5c5; width: 400px; padding: 50px 30px;">
      <img class="align-self-center mb-5" src="$${logoUrl}" alt="$${companyName}" style="$${logoStyle}"/>
     <h1>Unknown Device</h1>
     <div style="margin-top: 20px; margin-bottom:25px">
     <p>A new device logged into your account.</p>
     </div>
</div>
EOT
    subject = "CIAM Passwordless - Unknown Device"

    from = {
      name    = "PingOne"
      address = "noreply@pingidentity.com"
    }
  }
}

resource "pingone_notification_template_content" "threat_detected" {
  environment_id = var.environment_id
  template_name  = "general"
  locale         = "en"
  variant        = "Threat Detected"

  email = {
    body    = <<EOT
    <div style="display: block; text-align: center; font-family: sans-serif; border: 1px solid #c5c5c5; width: 400px; padding: 50px 30px;">
      <img class="align-self-center mb-5" src="$${logoUrl}" alt="$${companyName}" style="$${logoStyle}"/>
     <h1>Threat Detected</h1>
     <div style="margin-top: 20px; margin-bottom:25px">
     <p>A threat has been detected, your account has been disabled for security purposes.</p>
     </div>
</div>
EOT
    subject = "CIAM Passwordless - Threat Detected"

    from = {
      name    = "PingOne"
      address = "noreply@pingidentity.com"
    }
  }
}

resource "pingone_notification_template_content" "new_device" {
  environment_id = var.environment_id
  template_name  = "general"
  locale         = "en"
  variant        = "New Device"

  email = {
    body    = <<EOT
    <div style="display: block; text-align: center; font-family: sans-serif; border: 1px solid #c5c5c5; width: 400px; padding: 50px 30px;">
      <img class="align-self-center mb-5" src="$${logoUrl}" alt="$${companyName}" style="$${logoStyle}"/>
     <h1>New Device</h1>
     <div style="margin-top: 20px; margin-bottom:25px">
     <p>A new authentication device was added to your account.</p>
     </div>
</div>
EOT
    subject = "CIAM Passwordless - New Device"

    from = {
      name    = "PingOne"
      address = "noreply@pingidentity.com"
    }
  }
}