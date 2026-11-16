
resource "pingone_form" "irco_starter_kit__e28094__agreement" {
  environment_id                 = pingone_environment.brand.id
  name                           = "IRCO Starter Kit — Agreement"
  description                    = "Imported 2026-10-07T06:02:43.215Z with flow: \"IRCO Starter Kit\". Prompt the user to read and consent to an agreement, such as a Terms of Service."
  category                       = "CUSTOM"
  cols                           = 4
  mark_optional                  = true
  mark_required                  = false
  password_auto_complete_enabled = false
  text_auto_complete_enabled     = false
  translation_method             = "TRANSLATE"
  components = {
    fields = [
      {
        position = {
          col = 0,
          row = 1
        },
        type = "ERROR_DISPLAY"
      },
      {
        label = jsonencode("[{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.create-account.Accept\",\"defaultTranslation\":\"Accept\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]}]"),
        position = {
          col = 0,
          row = 2
        },
        styles = {
          alignment                                = "CENTER",
          displayDefaultThemeButtonBackgroundColor = false,
          displayDefaultThemeButtonBorderColor     = false,
          displayDefaultThemeButtonTextColor       = false,
          enabled                                  = true
        },
        type = "SUBMIT_BUTTON"
      },
      {
        key   = "decline-link",
        label = jsonencode("[{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.create-account.Decline\",\"defaultTranslation\":\"Decline\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]}]"),
        position = {
          col = 0,
          row = 3
        },
        type = "FLOW_LINK"
      }
    ]
  }
}


resource "pingone_form" "irco_starter_kit__e28094__change_your_password" {
  environment_id                 = pingone_environment.brand.id
  name                           = "IRCO Starter Kit — Change Your Password"
  description                    = "Imported 2026-10-07T06:02:43.215Z with flow: \"IRCO Starter Kit\". Prompt the user to enter their current password and set a new password."
  category                       = "CUSTOM"
  cols                           = 4
  mark_optional                  = true
  mark_required                  = false
  password_auto_complete_enabled = false
  text_auto_complete_enabled     = false
  translation_method             = "TRANSLATE"
  components = {
    fields = [
      {
        content = jsonencode("[{\"type\":\"align-center\",\"children\":[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.ChangePassword\",\"defaultTranslation\":\"Change Password\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}],\"type\":\"heading-1\"}]}]"),
        key     = "title-text",
        position = {
          col = 0,
          row = 0
        },
        type = "SLATE_TEXTBLOB"
      },
      {
        content = jsonencode("[{\"type\":\"align-center\",\"children\":[{\"children\":[{\"text\":\"\"}]},{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.YouMustChangeYourPassword\",\"defaultTranslation\":\"You must change your password before signing on.\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]},{\"children\":[{\"text\":\"\"}]}]}]"),
        icon = {
          size = "MEDIUM",
          type = "NONE"
        },
        key = "help-text",
        position = {
          col = 0,
          row = 1
        },
        type = "SLATE_TEXTBLOB"
      },
      {
        position = {
          col = 0,
          row = 2
        },
        type = "ERROR_DISPLAY"
      },
      {
        attributeDisabled            = false,
        key                          = "user.currentPassword",
        label                        = jsonencode("[{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.CurrentPassword\",\"defaultTranslation\":\"Current Password\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]}]"),
        otherOptionAttributeDisabled = false,
        otherOptionEnabled           = false,
        position = {
          col = 0,
          row = 3
        },
        required                 = true,
        showPasswordRequirements = false,
        type                     = "PASSWORD",
        validation = {
          errorMessage = "",
          regex        = "",
          type         = "NONE"
        }
      },
      {
        attributeDisabled            = false,
        key                          = "user.newPassword",
        label                        = jsonencode("[{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.NewPassword\",\"defaultTranslation\":\"New Password\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]}]"),
        labelPasswordVerify          = jsonencode("[{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.VerifyPassword\",\"defaultTranslation\":\"Verify Password\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]}]"),
        otherOptionAttributeDisabled = false,
        otherOptionEnabled           = false,
        position = {
          col = 0,
          row = 4
        },
        required                 = true,
        showPasswordRequirements = true,
        type                     = "PASSWORD_VERIFY",
        validation = {
          errorMessage = "",
          regex        = "",
          type         = "NONE"
        }
      },
      {
        label = jsonencode("[{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.Continue\",\"defaultTranslation\":\"Continue\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]}]"),
        position = {
          col = 0,
          row = 5
        },
        styles = {
          alignment                                = "CENTER",
          displayDefaultThemeButtonBackgroundColor = false,
          displayDefaultThemeButtonBorderColor     = false,
          displayDefaultThemeButtonTextColor       = false,
          enabled                                  = true
        },
        type = "SUBMIT_BUTTON"
      },
      {
        key   = "cancel-link",
        label = jsonencode("[{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.Cancel\",\"defaultTranslation\":\"Cancel\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]}]"),
        position = {
          col = 0,
          row = 6
        },
        type = "FLOW_LINK"
      }
    ]
  }
}


resource "pingone_form" "irco_starter_kit__e28094__enter_new_password" {
  environment_id                 = pingone_environment.brand.id
  name                           = "IRCO Starter Kit — Enter New Password"
  description                    = "Imported 2026-10-07T06:02:43.215Z with flow: \"IRCO Starter Kit\". Prompt the user to enter a verification code and set a new password."
  category                       = "CUSTOM"
  cols                           = 4
  mark_optional                  = true
  mark_required                  = false
  password_auto_complete_enabled = false
  text_auto_complete_enabled     = false
  translation_method             = "TRANSLATE"
  components = {
    fields = [
      {
        content = jsonencode("[{\"children\":[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.EnterNewPassword\",\"defaultTranslation\":\"Enter New Password\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}],\"type\":\"heading-1\"}],\"type\":\"align-center\"}]"),
        key     = "title-text",
        position = {
          col = 0,
          row = 0
        },
        type = "SLATE_TEXTBLOB"
      },
      {
        content = jsonencode("[{\"children\":[{\"children\":[{\"text\":\"\"}]},{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.CreateAndVerifyNewPassword\",\"defaultTranslation\":\"Create and verify a new password.\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]},{\"children\":[{\"text\":\"\"}]}],\"type\":\"align-center\"}]"),
        icon = {
          size = "MEDIUM",
          type = "NONE"
        },
        key = "help-text",
        position = {
          col = 0,
          row = 1
        },
        type = "SLATE_TEXTBLOB"
      },
      {
        position = {
          col = 0,
          row = 2
        },
        type = "ERROR_DISPLAY"
      },
      {
        attributeDisabled            = false,
        key                          = "user.recoveryCode",
        label                        = jsonencode("[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.RecoveryCode\",\"defaultTranslation\":\"Recovery Code\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}],\"type\":\"paragraph\"}]"),
        otherOptionAttributeDisabled = false,
        otherOptionEnabled           = false,
        position = {
          col = 0,
          row = 3
        },
        required                 = true,
        showPasswordRequirements = false,
        type                     = "PASSWORD",
        validation = {
          errorMessage = "",
          regex        = "",
          type         = "NONE"
        }
      },
      {
        attributeDisabled            = false,
        key                          = "user.newPassword",
        label                        = jsonencode("[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.NewPassword\",\"defaultTranslation\":\"New Password\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}],\"type\":\"paragraph\"}]"),
        labelPasswordVerify          = jsonencode("[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.VerifyPassword\",\"defaultTranslation\":\"Verify Password\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}],\"type\":\"paragraph\"}]"),
        otherOptionAttributeDisabled = false,
        otherOptionEnabled           = false,
        position = {
          col = 0,
          row = 4
        },
        required                 = true,
        showPasswordRequirements = true,
        type                     = "PASSWORD_VERIFY",
        validation = {
          errorMessage = "",
          regex        = "",
          type         = "NONE"
        }
      },
      {
        content = jsonencode("[{\"type\":\"align-center\",\"children\":[{\"type\":\"align-center\",\"children\":[{\"children\":[{\"text\":\"\",\"color\":\"#018511\"}]},{\"children\":[{\"color\":\"#018511\",\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.CodeResent\",\"defaultTranslation\":\"Code resent\",\"color\":\"#018511\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]},{\"children\":[{\"color\":\"#018511\",\"text\":\"\"}]}]}]}]"),
        icon = {
          size = "SMALL",
          type = "SUCCESS"
        },
        key = "code-resent-text",
        position = {
          col = 0,
          row = 5
        },
        type = "SLATE_TEXTBLOB",
        visibility = {
          key  = "code-resent-text",
          type = "HIDE_BY_DEFAULT"
        }
      },
      {
        key   = "resend-code-link",
        label = jsonencode("[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.ResendCode\",\"defaultTranslation\":\"Resend Code\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}],\"type\":\"paragraph\"}]"),
        position = {
          col = 0,
          row = 6
        },
        type = "FLOW_LINK",
        visibility = {
          key  = "resend-code-link",
          type = "SHOW_BY_DEFAULT"
        }
      },
      {
        label = jsonencode("[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.Continue\",\"defaultTranslation\":\"Continue\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}],\"type\":\"paragraph\"}]"),
        position = {
          col = 0,
          row = 7
        },
        styles = {
          alignment                                = "CENTER",
          displayDefaultThemeButtonBackgroundColor = false,
          displayDefaultThemeButtonBorderColor     = false,
          displayDefaultThemeButtonTextColor       = false,
          enabled                                  = true
        },
        type = "SUBMIT_BUTTON"
      },
      {
        key   = "cancel-link",
        label = jsonencode("[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.Cancel\",\"defaultTranslation\":\"Cancel\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}],\"type\":\"paragraph\"}]"),
        position = {
          col = 0,
          row = 8
        },
        type = "FLOW_LINK"
      }
    ]
  }
}


resource "pingone_form" "irco_starter_kit__e28094__profiling_your_device" {
  environment_id                 = pingone_environment.brand.id
  name                           = "IRCO Starter Kit — Profiling Your Device"
  description                    = "Imported 2026-10-07T06:02:43.215Z with flow: \"IRCO Starter Kit\". Profile the user's device to enable risk evaluation."
  category                       = "CUSTOM"
  cols                           = 4
  mark_optional                  = true
  mark_required                  = false
  password_auto_complete_enabled = false
  text_auto_complete_enabled     = false
  translation_method             = "TRANSLATE"
  components = {
    fields = [
      {
        position = {
          col = 0,
          row = 0
        },
        type = "ERROR_DISPLAY"
      },
      {
        key                = "polling-field",
        pollingAppearance  = "DOTS",
        polling_appearance = "DOTS",
        position = {
          col = 0,
          row = 1
        },
        size = "MEDIUM",
        type = "POLLING"
      },
      {
        content = jsonencode("[{\"children\":[{\"text\":\"\"}]}]"),
        icon = {
          size = "MEDIUM",
          type = "NONE"
        },
        key = "rich-text",
        position = {
          col = 0,
          row = 2
        },
        type = "SLATE_TEXTBLOB"
      }
    ]
  }
}


resource "pingone_form" "irco_starter_kit__e28094__recover_your_account" {
  environment_id                 = pingone_environment.brand.id
  name                           = "IRCO Starter Kit — Recover Your Account"
  description                    = "Imported 2026-10-07T06:02:43.215Z with flow: \"IRCO Starter Kit\". Prompt the user to enter their email address to receive a verification code."
  category                       = "CUSTOM"
  cols                           = 4
  mark_optional                  = true
  mark_required                  = false
  password_auto_complete_enabled = false
  text_auto_complete_enabled     = false
  translation_method             = "TRANSLATE"
  components = {
    fields = [
      {
        content = jsonencode("[{\"type\":\"align-center\",\"children\":[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.RecoverYourAccount\",\"defaultTranslation\":\"Recover Your Account\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}],\"type\":\"heading-1\"}]}]"),
        icon = {
          size = "MEDIUM",
          type = "NONE"
        },
        key = "title-text",
        position = {
          col = 0,
          row = 0
        },
        type = "SLATE_TEXTBLOB"
      },
      {
        content = jsonencode("[{\"type\":\"align-center\",\"children\":[{\"children\":[{\"text\":\"\"}]},{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.EnterYourEmailAddress\",\"defaultTranslation\":\"Enter your email address to receive a recovery code that will let you change your password.\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]},{\"children\":[{\"text\":\"\"}]}]}]"),
        icon = {
          size = "MEDIUM",
          type = "NONE"
        },
        key = "help-text",
        position = {
          col = 0,
          row = 1
        },
        type = "SLATE_TEXTBLOB"
      },
      {
        position = {
          col = 0,
          row = 2
        },
        type = "ERROR_DISPLAY"
      },
      {
        attributeDisabled            = false,
        key                          = "user.email",
        label                        = jsonencode("[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.Email\",\"defaultTranslation\":\"Email\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}],\"type\":\"paragraph\"}]"),
        otherOptionAttributeDisabled = false,
        otherOptionEnabled           = false,
        position = {
          col = 0,
          row = 3
        },
        required = true,
        type     = "TEXT",
        validation = {
          errorMessage = "",
          regex        = "",
          type         = "NONE"
        }
      },
      {
        label = jsonencode("[{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.Continue\",\"defaultTranslation\":\"Continue\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]}]"),
        position = {
          col = 0,
          row = 4
        },
        styles = {
          alignment                                = "CENTER",
          displayDefaultThemeButtonBackgroundColor = false,
          displayDefaultThemeButtonBorderColor     = false,
          displayDefaultThemeButtonTextColor       = false,
          enabled                                  = true
        },
        type = "SUBMIT_BUTTON"
      },
      {
        key   = "cancel-link",
        label = jsonencode("[{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.Cancel\",\"defaultTranslation\":\"Cancel\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]}]"),
        position = {
          col = 0,
          row = 5
        },
        type = "FLOW_LINK"
      }
    ]
  }
}


resource "pingone_form" "irco_starter_kit__e28094__registration" {
  environment_id                 = pingone_environment.brand.id
  name                           = "IRCO Starter Kit — Registration"
  description                    = "Imported 2026-10-07T06:02:43.215Z with flow: \"IRCO Starter Kit\". Prompt the user to enter their information to create an account."
  category                       = "CUSTOM"
  cols                           = 4
  mark_optional                  = true
  mark_required                  = false
  password_auto_complete_enabled = false
  text_auto_complete_enabled     = false
  translation_method             = "TRANSLATE"
  components = {
    fields = [
      {
        content = jsonencode("[{\"children\":[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.create-account.CreateYourAccount\",\"defaultTranslation\":\"Create Your Account\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}],\"type\":\"heading-1\"}],\"type\":\"align-center\"}]"),
        icon = {
          size = "MEDIUM",
          type = "NONE"
        },
        key = "title-text",
        position = {
          col = 0,
          row = 0
        },
        type = "SLATE_TEXTBLOB"
      },
      {
        position = {
          col = 0,
          row = 1
        },
        type = "ERROR_DISPLAY"
      },
      {
        attributeDisabled            = false,
        key                          = "user.email",
        label                        = jsonencode("[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.create-account.Email\",\"defaultTranslation\":\"Email\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}],\"type\":\"paragraph\"}]"),
        otherOptionAttributeDisabled = false,
        otherOptionEnabled           = false,
        position = {
          col = 0,
          row = 2
        },
        required = true,
        type     = "TEXT",
        validation = {
          errorMessage = "",
          regex        = "",
          type         = "NONE"
        }
      },
      {
        attributeDisabled            = false,
        key                          = "user.password",
        label                        = jsonencode("[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.create-account.Password\",\"defaultTranslation\":\"Password\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}],\"type\":\"paragraph\"}]"),
        labelPasswordVerify          = jsonencode("[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.create-account.VerifyPassword\",\"defaultTranslation\":\"Verify Password\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}],\"type\":\"paragraph\"}]"),
        otherOptionAttributeDisabled = false,
        otherOptionEnabled           = false,
        position = {
          col = 0,
          row = 3
        },
        required                 = true,
        showPasswordRequirements = true,
        type                     = "PASSWORD_VERIFY",
        validation = {
          errorMessage = "",
          regex        = "",
          type         = "NONE"
        }
      },
      {
        attributeDisabled            = false,
        key                          = "user.name.given",
        label                        = jsonencode("[{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"fields.user.name.given.label\",\"defaultTranslation\":\"Given Name\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]}]"),
        otherOptionAttributeDisabled = false,
        otherOptionEnabled           = false,
        position = {
          col = 0,
          row = 4
        },
        required = true,
        type     = "TEXT",
        validation = {
          errorMessage = "",
          regex        = "",
          type         = "NONE"
        }
      },
      {
        attributeDisabled            = false,
        key                          = "user.name.family",
        label                        = jsonencode("[{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"fields.user.name.family.label\",\"defaultTranslation\":\"Family Name\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]}]"),
        otherOptionAttributeDisabled = false,
        otherOptionEnabled           = false,
        position = {
          col = 0,
          row = 5
        },
        required = true,
        type     = "TEXT",
        validation = {
          errorMessage = "",
          regex        = "",
          type         = "NONE"
        }
      },
      {
        label = jsonencode("[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.create-account.Continue\",\"defaultTranslation\":\"Continue\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}],\"type\":\"paragraph\"}]"),
        position = {
          col = 0,
          row = 6
        },
        styles = {
          alignment                                = "CENTER",
          displayDefaultThemeButtonBackgroundColor = false,
          displayDefaultThemeButtonBorderColor     = false,
          displayDefaultThemeButtonTextColor       = false,
          enabled                                  = true
        },
        type = "SUBMIT_BUTTON"
      },
      {
        position = {
          col = 0,
          row = 7
        },
        type = "DIVIDER",
        visibility = {
          key  = "socialLoginAuth",
          type = "HIDE_BY_DEFAULT"
        }
      },
      {
        key   = "back-link",
        label = jsonencode("[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.create-account.AlreadyHaveAccount\",\"defaultTranslation\":\"Already have an account? Sign on\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}],\"type\":\"paragraph\"}]"),
        position = {
          col = 0,
          row = 9
        },
        type = "FLOW_LINK"
      }
    ]
  }
}


resource "pingone_form" "irco_starter_kit__e28094__sign_in_or_linkedin" {
  environment_id                 = pingone_environment.brand.id
  name                           = "IRCO Starter Kit — Sign in or LinkedIn"
  description                    = "Prompt the user to sign on."
  category                       = "CUSTOM"
  cols                           = 4
  mark_optional                  = true
  mark_required                  = false
  password_auto_complete_enabled = false
  text_auto_complete_enabled     = false
  translation_method             = "TRANSLATE"
  components = {
    fields = [
      {
        content = jsonencode("[{\"type\":\"align-center\",\"children\":[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.sign-on.SignOn\",\"defaultTranslation\":\"Sign On\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}],\"type\":\"heading-1\"}]}]"),
        key     = "title-text",
        position = {
          col = 0,
          row = 0
        },
        type = "SLATE_TEXTBLOB"
      },
      {
        position = {
          col = 0,
          row = 1
        },
        type = "ERROR_DISPLAY"
      },
      {
        attributeDisabled            = false,
        key                          = "user.email",
        label                        = jsonencode("[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.create-account.Email\",\"defaultTranslation\":\"Email\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}],\"type\":\"paragraph\"}]"),
        otherOptionAttributeDisabled = false,
        otherOptionEnabled           = false,
        position = {
          col = 0,
          row = 2
        },
        required = true,
        type     = "TEXT",
        validation = {
          errorMessage = "",
          regex        = "",
          type         = "NONE"
        }
      },
      {
        label = jsonencode("[{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.sign-on.SignOn\",\"defaultTranslation\":\"Sign On\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]}]"),
        position = {
          col = 0,
          row = 3
        },
        styles = {
          alignment                                = "CENTER",
          displayDefaultThemeButtonBackgroundColor = false,
          displayDefaultThemeButtonBorderColor     = false,
          displayDefaultThemeButtonTextColor       = false,
          enabled                                  = true
        },
        type = "SUBMIT_BUTTON"
      },
      {
        position = {
          col = 0,
          row = 4
        },
        type = "DIVIDER",
        visibility = {
          key  = "passkeyAuth",
          type = "HIDE_BY_DEFAULT"
        }
      },
      {
        key   = "passkey-button",
        label = jsonencode("[{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.sign-on.SignOnWithPasskey\",\"defaultTranslation\":\"Sign On with Passkey\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]}]"),
        position = {
          col = 0,
          row = 5
        },
        styles = {
          alignment                                = "CENTER",
          backgroundColor                          = "#69788b",
          borderColor                              = "#69788b",
          displayDefaultThemeButtonBackgroundColor = false,
          displayDefaultThemeButtonBorderColor     = false,
          displayDefaultThemeButtonTextColor       = true,
          enabled                                  = true,
          height                                   = 36,
          padding = {
            bottom = 5,
            left   = 0,
            right  = 0,
            top    = 5
          },
          textColor = "#FFF",
          widthUnit = "PERCENT"
        },
        type = "FLOW_BUTTON",
        visibility = {
          key  = "passkeyAuth",
          type = "HIDE_BY_DEFAULT"
        }
      },
      {
        key   = "passwordless-button",
        label = jsonencode("[{\"type\":\"paragraph\",\"children\":[{\"text\":\"Passwordless SignOn\"}]}]"),
        position = {
          col = 0,
          row = 6
        },
        styles = {
          alignment                                = "CENTER",
          backgroundColor                          = "#69788b",
          borderColor                              = "#69788b",
          displayDefaultThemeButtonBackgroundColor = false,
          displayDefaultThemeButtonBorderColor     = false,
          displayDefaultThemeButtonTextColor       = true,
          enabled                                  = true,
          height                                   = 36,
          padding = {
            bottom = 5,
            left   = 0,
            right  = 0,
            top    = 5
          },
          textColor = "#FFF",
          widthUnit = "PERCENT"
        },
        type = "FLOW_BUTTON",
        visibility = {
          key  = "passwordlessAuth",
          type = "HIDE_BY_DEFAULT"
        }
      },
      {
        position = {
          col = 0,
          row = 7
        },
        type = "DIVIDER",
        visibility = {
          key  = "socialLoginAuth",
          type = "HIDE_BY_DEFAULT"
        }
      },
      {
        key   = "register-link",
        label = jsonencode("[{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.sign-on.RegisterNow\",\"defaultTranslation\":\"No account? Register now!\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]}]"),
        position = {
          col = 0,
          row = 9
        },
        type = "FLOW_LINK",
        visibility = {
          key  = "register",
          type = "HIDE_BY_DEFAULT"
        }
      },
      {
        key   = "account-recovery-link",
        label = jsonencode("[{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.sign-on.SignOnHelp\",\"defaultTranslation\":\"Having trouble signing on?\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]}]"),
        position = {
          col = 0,
          row = 10
        },
        type = "FLOW_LINK",
        visibility = {
          key  = "accountRecovery",
          type = "HIDE_BY_DEFAULT"
        }
      }
    ]
  }
}


resource "pingone_form" "irco_starter_kit__e28094__sign_on__0028_password_0029_" {
  environment_id                 = pingone_environment.brand.id
  name                           = "IRCO Starter Kit — Sign On (Password)"
  description                    = "Imported 2026-10-07T06:02:43.215Z with flow: \"IRCO Starter Kit\". Prompt the user to sign on."
  category                       = "CUSTOM"
  cols                           = 4
  mark_optional                  = true
  mark_required                  = false
  password_auto_complete_enabled = false
  text_auto_complete_enabled     = false
  translation_method             = "TRANSLATE"
  components = {
    fields = [
      {
        content = jsonencode("[{\"type\":\"align-center\",\"children\":[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.sign-on.SignOn\",\"defaultTranslation\":\"Sign On\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}],\"type\":\"heading-1\"}]}]"),
        key     = "title-text",
        position = {
          col = 0,
          row = 0
        },
        type = "SLATE_TEXTBLOB"
      },
      {
        position = {
          col = 0,
          row = 1
        },
        type = "ERROR_DISPLAY"
      },
      {
        attributeDisabled            = false,
        key                          = "user.password",
        label                        = jsonencode("[{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.sign-on.Password\",\"defaultTranslation\":\"Password\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]}]"),
        otherOptionAttributeDisabled = false,
        otherOptionEnabled           = false,
        position = {
          col = 0,
          row = 2
        },
        required                 = true,
        showPasswordRequirements = false,
        type                     = "PASSWORD",
        validation = {
          errorMessage = "",
          regex        = "",
          type         = "NONE"
        },
        visibility = {
          key  = "passwordAuth",
          type = "SHOW_BY_DEFAULT"
        }
      },
      {
        appearance                   = "CHECKBOX",
        attributeDisabled            = false,
        errorMessage                 = jsonencode("[{\"type\":\"paragraph\",\"children\":[{\"text\":\"Select the checkbox to continue.\"}]}]"),
        inputType                    = "BOOLEAN",
        key                          = "remember-me-checkbox",
        label                        = jsonencode("[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.sign-on.RememberMe\",\"defaultTranslation\":\"Remember me\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]}]"),
        otherOptionAttributeDisabled = false,
        otherOptionEnabled           = false,
        position = {
          col = 0,
          row = 3
        },
        input_type = "BOOLEAN",
        required   = false,
        type       = "SINGLE_CHECKBOX",
        visibility = {
          key  = "rememberMe",
          type = "HIDE_BY_DEFAULT"
        }
      },
      {
        label = jsonencode("[{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.sign-on.SignOn\",\"defaultTranslation\":\"Sign On\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]}]"),
        position = {
          col = 0,
          row = 4
        },
        styles = {
          alignment                                = "CENTER",
          displayDefaultThemeButtonBackgroundColor = false,
          displayDefaultThemeButtonBorderColor     = false,
          displayDefaultThemeButtonTextColor       = false,
          enabled                                  = true
        },
        type = "SUBMIT_BUTTON"
      },
      {
        key   = "account-recovery-link",
        label = jsonencode("[{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.sign-on.SignOnHelp\",\"defaultTranslation\":\"Having trouble signing on?\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]}]"),
        position = {
          col = 0,
          row = 5
        },
        type = "FLOW_LINK",
        visibility = {
          key  = "accountRecovery",
          type = "HIDE_BY_DEFAULT"
        }
      }
    ]
  }
}


resource "pingone_form" "irco_starter_kit__e28094__verification_code" {
  environment_id                 = pingone_environment.brand.id
  name                           = "IRCO Starter Kit — Verification Code"
  description                    = "Imported 2026-10-07T06:02:43.215Z with flow: \"IRCO Starter Kit\". Prompt the user to verify their email address by entering a verification code."
  category                       = "CUSTOM"
  cols                           = 4
  mark_optional                  = true
  mark_required                  = false
  password_auto_complete_enabled = false
  text_auto_complete_enabled     = false
  translation_method             = "TRANSLATE"
  components = {
    fields = [
      {
        content = jsonencode("[{\"children\":[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.VerificationCode\",\"defaultTranslation\":\"Verification Code\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}],\"type\":\"heading-1\"}],\"type\":\"align-center\"}]"),
        icon = {
          size = "MEDIUM",
          type = "NONE"
        },
        key = "title-text",
        position = {
          col = 0,
          row = 0
        },
        type = "SLATE_TEXTBLOB"
      },
      {
        content = jsonencode("[{\"children\":[{\"children\":[{\"text\":\"\"}]},{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.EnterTheCodeThatWasEmailed\",\"defaultTranslation\":\"Enter the code that was emailed to you to verify your email address.\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]},{\"children\":[{\"text\":\"\"}]}],\"type\":\"align-center\"}]"),
        icon = {
          size = "MEDIUM",
          type = "NONE"
        },
        key = "help-text",
        position = {
          col = 0,
          row = 1
        },
        type = "SLATE_TEXTBLOB"
      },
      {
        position = {
          col = 0,
          row = 2
        },
        type = "ERROR_DISPLAY"
      },
      {
        attributeDisabled            = false,
        key                          = "verification-code-field",
        label                        = jsonencode("[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.VerificationCode\",\"defaultTranslation\":\"Verification Code\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}],\"type\":\"paragraph\"}]"),
        labelMode                    = "FLOAT",
        otherOptionAttributeDisabled = false,
        otherOptionEnabled           = false,
        position = {
          col = 0,
          row = 3
        },
        required = true,
        type     = "TEXT",
        validation = {
          errorMessage = "",
          regex        = "",
          type         = "NONE"
        }
      },
      {
        content = jsonencode("[{\"type\":\"align-center\",\"children\":[{\"children\":[{\"text\":\"\",\"color\":\"#018511\"}]},{\"children\":[{\"color\":\"#018511\",\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.CodeResent\",\"defaultTranslation\":\"Code resent\",\"color\":\"#018511\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]},{\"children\":[{\"color\":\"#018511\",\"text\":\"\"}]}]}]"),
        icon = {
          size = "SMALL",
          type = "SUCCESS"
        },
        key = "code-resent-text",
        position = {
          col = 0,
          row = 4
        },
        type = "SLATE_TEXTBLOB",
        visibility = {
          key  = "codeResentMessage",
          type = "HIDE_BY_DEFAULT"
        }
      },
      {
        content = jsonencode("[{\"type\":\"align-center\",\"children\":[{\"children\":[{\"text\":\"\",\"color\":\"#018511\"}]},{\"children\":[{\"color\":\"#a31300\",\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.ReachedResendLimit\",\"defaultTranslation\":\"You have reached your resend limit. Try again later.\",\"color\":\"#a31300\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]},{\"children\":[{\"color\":\"#018511\",\"text\":\"\"}]}]}]"),
        icon = {
          size = "MEDIUM",
          type = "NONE"
        },
        key = "resend-limit-reached-text",
        position = {
          col = 0,
          row = 5
        },
        type = "SLATE_TEXTBLOB",
        visibility = {
          key  = "resend-limit-reached-text",
          type = "HIDE_BY_DEFAULT"
        }
      },
      {
        key   = "resend-code-link",
        label = jsonencode("[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.ResendCode\",\"defaultTranslation\":\"Resend Code\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}],\"type\":\"paragraph\"}]"),
        position = {
          col = 0,
          row = 6
        },
        type = "FLOW_LINK",
        visibility = {
          key  = "resendCodeLink",
          type = "SHOW_BY_DEFAULT"
        }
      },
      {
        label = jsonencode("[{\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.Continue\",\"defaultTranslation\":\"Continue\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}],\"type\":\"paragraph\"}]"),
        position = {
          col = 0,
          row = 7
        },
        styles = {
          alignment                                = "CENTER",
          displayDefaultThemeButtonBackgroundColor = false,
          displayDefaultThemeButtonBorderColor     = false,
          displayDefaultThemeButtonTextColor       = false,
          enabled                                  = true
        },
        type = "SUBMIT_BUTTON"
      },
      {
        key   = "cancel-link",
        label = jsonencode("[{\"type\":\"paragraph\",\"children\":[{\"text\":\"\"},{\"type\":\"i18n\",\"key\":\"auth-policy.recover-account.Cancel\",\"defaultTranslation\":\"Cancel\",\"inline\":true,\"children\":[{\"text\":\"\"}]},{\"text\":\"\"}]}]"),
        position = {
          col = 0,
          row = 8
        },
        type = "FLOW_LINK"
      }
    ]
  }
}