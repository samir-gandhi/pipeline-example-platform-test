resource "pingone_davinci_flow" "irco_starter_kit" {
  environment_id = pingone_environment.brand.id
  name           = "IRCO Starter Kit"
  description    = "Imported on Wed Oct 07 2026 06:02:44 GMT+0000 (Coordinated Universal Time)"
  color          = "#CACED3"

  settings = {
    csp                                 = "worker-src 'self' blob:; script-src 'self' https://cdn.jsdelivr.net https://code.jquery.com https://devsdk.singularkey.com http://cdnjs.cloudflare.com 'unsafe-inline' 'unsafe-eval';"
    custom_timeout_error_screen_css     = ""
    custom_timeout_error_screen_html    = ""
    custom_timeout_error_screen_message = ""
    log_level                           = 2
    intermediate_loading_screen_css     = ""
    intermediate_loading_screen_html    = ""
  }

  graph_data = {
    data = jsonencode({})
    renderer = jsonencode({
      "name" : "null"
    })
    elements = {
      nodes = {
        "4200s7ahm0kv" = {
          data = {
            id              = "4200s7ahm0kv"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "311y2en1fvf1"
              }
            })
          }
          position = {
            x = 3307.031222758748
            y = 1063.4356400893894
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "0301qur02ofs" = {
          data = {
            id              = "0301qur02ofs"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "441kxdlpixpj"
              }
            })
          }
          position = {
            x = 915.6870748299319
            y = 895.4058956916099
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "4905acmu01se" = {
          data = {
            id              = "4905acmu01se"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "1500xngg20fg9"
              }
            })
          }
          position = {
            x = 3794.95386218217
            y = 358.6584942555578
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "68083z3rmd1g" = {
          data = {
            id               = "68083z3rmd1g"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.form.id
            connector_id     = "pingOneFormsConnector"
            capability_class = "render"
            name             = "Form"
            label            = "PingOne Forms"
            capability_name  = "showForm"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "componentVisibility" : {
                "value" : [
                  {
                    "key" : "code-resent-text",
                    "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"resendMsg\",\"data\":\"{{local.1ws0i7gp2d.payload.output.resendMsg}}\",\"tooltip\":\"{{local.1ws0i7gp2d.payload.output.resendMsg}}\",\"children\":[{\"text\":\"resendMsg\"}]}]}]"
                  },
                  {
                    "key" : "resend-code-link",
                    "value" : " "
                  }
                ]
              },
              "dynamicText" : {
                "value" : []
              },
              "form" : {
                "value" : pingone_form.irco_starter_kit__e28094__enter_new_password.id
              },
              "formData" : {
                "value" : [
                  {
                    "key" : "user.recoveryCode",
                    "value" : ""
                  },
                  {
                    "key" : "user.newPassword",
                    "value" : ""
                  }
                ]
              },
              "nodeDescription" : {
                "value" : "Prompt the user to enter a verification code and set a new password."
              },
              "nodeTitle" : {
                "value" : "Enter New Password"
              },
              "theme" : {
                "value" : "useThemeId"
              },
              "themeId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"url\": \"themeID\",\n        \"tooltip\": \"{{global.parameters.authorizationRequest.themeID}}\",\n        \"data\": \"{{global.parameters.authorizationRequest.themeID}}\",\n        \"src\": \"auth.svg\",\n        \"children\": [\n          {\n            \"text\": \"\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
            outcomes = [
              {
                id     = "7tram6ohpq"
                result = "submit"
                label  = "Continue"
              },
              {
                id     = "yt27fwraly"
                result = "resend-code-link"
                label  = "Resend Code"
              },
              {
                id     = "u33rmdxlf0"
                result = "cancel-link"
                label  = "Cancel"
              }
            ]
          }
          position = {
            x = 1777.4610124077162
            y = 2647.1859410430843
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "11109zvnryktc" = {
          data = {
            id              = "11109zvnryktc"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "1141v0zyvofmz"
              }
            })
          }
          position = {
            x = 2352.521928186683
            y = 3025.0997732426304
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "850adkt6pfx1" = {
          data = {
            id        = "850adkt6pfx1"
            node_type = "EVAL"
          }
          position = {
            x = 715.9569160997733
            y = 395.672335600907
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1530apfzfajon" = {
          data = {
            id              = "1530apfzfajon"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "startNode"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeTitle" : {
                "value" : "External IdP Sign On"
              }
            })
          }
          position = {
            x = 311.44541441216455
            y = 1644.6691401523858
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "880d9jvouoil" = {
          data = {
            id               = "880d9jvouoil"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.form.id
            connector_id     = "pingOneFormsConnector"
            capability_class = "render"
            name             = "Form"
            label            = "PingOne Forms"
            capability_name  = "showForm"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "collectBehavioralData" : {
                "value" : false
              },
              "componentVisibility" : {
                "value" : [
                  {
                    "key" : "socialLoginAuth",
                    "value" : "[{ \"children\": [{ \"text\": \"true\" }] }]"
                  }
                ]
              },
              "dynamicText" : {
                "value" : []
              },
              "enableRisk" : {
                "value" : false
              },
              "form" : {
                "value" : pingone_form.irco_starter_kit__e28094__registration.id
              },
              "formData" : {
                "value" : [
                  {
                    "key" : "user.password",
                    "value" : "[{ \"children\": [{ \"text\": \"\" }] }]"
                  },
                  {
                    "key" : "user.name.given",
                    "value" : "[{ \"children\": [{ \"text\": \"\" }] }]"
                  },
                  {
                    "key" : "user.name.family",
                    "value" : "[{ \"children\": [{ \"text\": \"\" }] }]"
                  }
                ]
              },
              "idpList" : {
                "constructType" : "skConnectorList",
                "value" : [
                  {
                    "connectionId" : "c3e6a164bde107954e93f5c09f0c8bce",
                    "connectorId" : "pingOneAuthenticationConnector",
                    "properties" : {}
                  }
                ]
              },
              "linkWithP1User" : {
                "value" : true
              },
              "nodeDescription" : {
                "value" : "Prompt the user to enter their information to create an account."
              },
              "nodeTitle" : {
                "value" : "Registration"
              },
              "population" : {
                "value" : pingone_population.local_users.id
              },
              "theme" : {
                "value" : "activeTheme"
              }
            })
            outcomes = [
              {
                id     = "hqrdmmsjsv"
                result = "submit"
                label  = "Submit"
              },
              {
                id     = "a61xjavs72"
                result = "externalIdp_35a998b2-e358-4d54-a6df-4760d38dbdf7"
                label  = "Sample LinkedIn"
              },
              {
                id     = "4y9czfrxv6"
                result = "back-link"
                label  = "Already have an account? Sign on"
              }
            ]
          }
          position = {
            x = 595.9138321995465
            y = 3635.5759637188203
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "580hbny9inpm" = {
          data = {
            id              = "580hbny9inpm"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "281r342mj94r"
              },
              "username" : {
                "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"username\",\"data\":\"{{local.1r342mj94r.payload.output.username}}\",\"tooltip\":\"{{local.1r342mj94r.payload.output.username}}\",\"children\":[{\"text\":\"username\"}]}]}]"
              }
            })
          }
          position = {
            x = 3008.8562764444346
            y = 1171.8628932945942
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1290hmbc9e11m" = {
          data = {
            id              = "1290hmbc9e11m"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "281r342mj94r"
              }
            })
          }
          position = {
            x = 915.6870748299319
            y = 3996.2789115646256
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "570k1nlg79ew" = {
          data = {
            id              = "570k1nlg79ew"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "1530apfzfajon"
              }
            })
          }
          position = {
            x = 915.6870748299319
            y = 795.4058956916099
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "550m5pgnj0d3" = {
          data = {
            id               = "550m5pgnj0d3"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.authentication.id
            connector_id     = "authenticationUseCaseConnector"
            capability_class = "backend"
            name             = "Authentication"
            label            = "Authentication Journey"
            capability_name  = "verifyEmail"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "nodeTitle" : {
                "value" : "Authentication"
              },
              "verificationCode" : {
                "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"verification-code-field\",\"data\":\"{{local.1diz9vpjjr.payload.output.formData.verification-code-field}}\",\"tooltip\":\"{{local.1diz9vpjjr.payload.output.formData.verification-code-field}}\",\"children\":[{\"text\":\"verification-code-field\"}]}]}]"
              }
            })
          }
          position = {
            x = 915.6870748299319
            y = 4478.614512471647
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "890rjurdezwb" = {
          data = {
            id               = "890rjurdezwb"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.authentication.id
            connector_id     = "authenticationUseCaseConnector"
            capability_class = "backend"
            name             = "Authentication"
            label            = "Authentication Journey"
            capability_name  = "findUser"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "username" : {
                "value" : "[{\"children\":[{\"text\":\" \"},{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"email\",\"data\":\"{{local.25xikwhn3s.payload.output.formData.user.email}}\",\"tooltip\":\"{{local.25xikwhn3s.payload.output.formData.user.email}}\",\"children\":[{\"text\":\"email\"}]},{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"username\",\"data\":\"{{local.25xikwhn3s.payload.output.formData.user.username}}\",\"tooltip\":\"{{local.25xikwhn3s.payload.output.formData.user.username}}\",\"children\":[{\"text\":\"username\"}]}]}]"
              }
            })
          }
          position = {
            x = 855.6116315996173
            y = 2763.4671201814062
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1240sjm0udh9l" = {
          data = {
            id        = "1240sjm0udh9l"
            node_type = "EVAL"
            properties = jsonencode({
              "68083z3rmd1g" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 1908.1566750847542
            y = 2850.678004535147
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1160sjozlk5r7" = {
          data = {
            id               = "1160sjozlk5r7"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.form.id
            connector_id     = "pingOneFormsConnector"
            capability_class = "render"
            name             = "Form"
            label            = "PingOne Forms"
            capability_name  = "showForm"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "agreement" : {
                "value" : "[{\"children\":[]}]"
              },
              "collectBehavioralData" : {
                "value" : true
              },
              "dynamicText" : {
                "value" : []
              },
              "enableRisk" : {
                "value" : true
              },
              "form" : {
                "value" : pingone_form.irco_starter_kit__e28094__agreement.id
              },
              "formData" : {
                "value" : []
              },
              "nodeDescription" : {
                "value" : "Prompt the user to read and consent to an agreement, such as a Terms of Service."
              },
              "nodeTitle" : {
                "value" : "Agreement"
              },
              "theme" : {
                "value" : "useThemeId"
              },
              "themeId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"url\": \"themeID\",\n        \"tooltip\": \"{{global.parameters.authorizationRequest.themeID}}\",\n        \"data\": \"{{global.parameters.authorizationRequest.themeID}}\",\n        \"src\": \"auth.svg\",\n        \"children\": [\n          {\n            \"text\": \"\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
            outcomes = [
              {
                id     = "rvvwu0ruwo"
                result = "submit"
                label  = "Accept"
              },
              {
                id     = "9329xdnlyl"
                result = "decline-link"
                label  = "Decline"
              }
            ]
          }
          position = {
            x = 3198.6039695535433
            y = 629.7266272685699
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "510sl3ysoxw4" = {
          data = {
            id              = "510sl3ysoxw4"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "1141v0zyvofmz"
              }
            })
          }
          position = {
            x = 1777.4610124077162
            y = 3080.0997732426304
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "670tnq37pnno" = {
          data = {
            id              = "670tnq37pnno"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "1071ws0i7gp2d"
              },
              "resendMsg" : {
                "value" : "Code Resent"
              },
              "retryLimitError" : {
                "value" : " "
              }
            })
          }
          position = {
            x = 2352.521928186683
            y = 2850.678004535147
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1170ur5bbmask" = {
          data = {
            id               = "1170ur5bbmask"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.authentication.id
            connector_id     = "authenticationUseCaseConnector"
            capability_class = "backend"
            name             = "Authentication"
            label            = "Authentication Journey"
            capability_name  = "recoverAccountSendRecoveryCode"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "nodeTitle" : {
                "value" : "Authentication"
              },
              "resendPasswordRecoveryCode" : {
                "value" : true
              },
              "username" : {
                "value" : "[{\"children\":[{\"text\":\" \"},{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"email\",\"data\":\"{{local.25xikwhn3s.payload.output.formData.user.email}}\",\"tooltip\":\"{{local.25xikwhn3s.payload.output.formData.user.email}}\",\"children\":[{\"text\":\"email\"}]},{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"username\",\"data\":\"{{local.25xikwhn3s.payload.output.formData.user.username}}\",\"tooltip\":\"{{local.25xikwhn3s.payload.output.formData.user.username}}\",\"children\":[{\"text\":\"username\"}]}]}]"
              }
            })
            outcomes = [
              {
                id     = "4r55ua0pzg"
                result = "code_resent"
                label  = "Code Resent"
              },
              {
                id     = "txnkgrvla5"
                result = "retry_limit_reached"
                label  = "Retry Limit Reached"
              },
              {
                id     = "xfchlqbhvm"
                result = "error"
                label  = "Error"
              }
            ]
          }
          position = {
            x = 2064.9914702971996
            y = 2850.678004535147
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "140uwd5cmzit" = {
          data = {
            id               = "140uwd5cmzit"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.authentication.id
            connector_id     = "authenticationUseCaseConnector"
            capability_class = "backend"
            name             = "Authentication"
            label            = "Authentication Journey"
            capability_name  = "acceptAgreement"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "agreement" : {
                "value" : "useAgreementId"
              },
              "agreementId" : {
                "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"agreementId\",\"data\":\"{{local.0sjozlk5r7.payload.output.formData.agreementId}}\",\"tooltip\":\"{{local.0sjozlk5r7.payload.output.formData.agreementId}}\",\"children\":[{\"text\":\"agreementId\"}]}]}]"
              }
            })
          }
          position = {
            x = 3523.8857291691575
            y = 629.7266272685699
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1510v8gnkrs8x" = {
          data = {
            id        = "1510v8gnkrs8x"
            node_type = "EVAL"
            properties = jsonencode({
              "302mb91yyrd8" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 741.265306122449
            y = 895.4058956916099
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1520vfye4zp3i" = {
          data = {
            id               = "1520vfye4zp3i"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.authentication.id
            connector_id     = "authenticationUseCaseConnector"
            capability_class = "backend"
            name             = "Authentication"
            label            = "Authentication Journey"
            capability_name  = "recoverAccountSetNewPassword"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "customTemplateVariant" : {
                "value" : {}
              },
              "newPassword" : {
                "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"newPassword\",\"data\":\"{{local.083z3rmd1g.payload.output.formData.user.newPassword}}\",\"tooltip\":\"{{local.083z3rmd1g.payload.output.formData.user.newPassword}}\",\"children\":[{\"text\":\"newPassword\"}]}]}]"
              },
              "nodeTitle" : {
                "value" : "Authentication"
              },
              "recoveryCode" : {
                "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"recoveryCode\",\"data\":\"{{local.083z3rmd1g.payload.output.formData.user.recoveryCode}}\",\"tooltip\":\"{{local.083z3rmd1g.payload.output.formData.user.recoveryCode}}\",\"children\":[{\"text\":\"recoveryCode\"}]}]}]"
              }
            })
          }
          position = {
            x = 2064.9914702971996
            y = 2647.1859410430843
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1330xk4f74cqh" = {
          data = {
            id              = "1330xk4f74cqh"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "startNode"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeTitle" : {
                "value" : "Send Recovery Code"
              }
            })
          }
          position = {
            x = 1129.2659288982277
            y = 2647.1859410430843
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1500xngg20fg9" = {
          data = {
            id              = "1500xngg20fg9"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "startNode"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeTitle" : {
                "value" : "Return Success"
              }
            })
          }
          position = {
            x = 304
            y = 5239.172335600907
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "102103ezou4o0" = {
          data = {
            id              = "102103ezou4o0"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "1500xngg20fg9"
              }
            })
          }
          position = {
            x = 2352.521928186683
            y = 2647.1859410430843
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "9410i8qnyw39" = {
          data = {
            id              = "9410i8qnyw39"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "1441vj2udlf69"
              }
            })
          }
          position = {
            x = 2412.506383815808
            y = 683.9402538711724
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "13611j3abj6ag" = {
          data = {
            id              = "13611j3abj6ag"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "1141v0zyvofmz"
              }
            })
          }
          position = {
            x = 3198.6039695535433
            y = 927.9015735828834
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "2415dl8522ou" = {
          data = {
            id               = "2415dl8522ou"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.authentication.id
            connector_id     = "authenticationUseCaseConnector"
            capability_class = "backend"
            name             = "Authentication"
            label            = "Authentication Journey"
            capability_name  = "checkAccountStatus"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "checkAccountStatusAgreement" : {
                "value" : "[{\"children\":[]}]"
              },
              "checkAccountVerificationStatus" : {
                "value" : false
              },
              "checkAgreementConsent" : {
                "value" : false
              },
              "nodeTitle" : {
                "value" : "Authentication"
              }
            })
            outcomes = [
              {
                id     = "kx73pttdch"
                result = "continue"
                label  = "Continue"
              },
              {
                id     = "3esdecu3ie"
                result = "agreement_required"
                label  = "Agreement Required"
              },
              {
                id     = "2e4beng4ai"
                result = "error"
                label  = "Error"
              }
            ]
          }
          position = {
            x = 622.8908288243291
            y = 1644.6691401523858
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "0415ohzj3jqe" = {
          data = {
            id              = "0415ohzj3jqe"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "281r342mj94r"
              }
            })
          }
          position = {
            x = 2064.9914702971996
            y = 3141.3809523809523
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "8116ns28pa1z" = {
          data = {
            id              = "8116ns28pa1z"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "1530apfzfajon"
              }
            })
          }
          position = {
            x = 915.6870748299319
            y = 3896.631419007512
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "2318975qbjaz" = {
          data = {
            id               = "2318975qbjaz"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.functions.id
            connector_id     = "functionsConnector"
            capability_class = "backend"
            name             = "Functions"
            label            = "Functions"
            capability_name  = "customFunction"
            type             = "trigger"
            status           = "configured"
            properties = jsonencode({
              "code" : {
                "value" : "// Supported language: JavaScript\nmodule.exports = async ({ params }) =\u003e {\n    var methods = Array.isArray(params.authMethods)\n    ? params.authMethods\n    : [];\n\n    if (params.rememberme \u0026\u0026 methods.indexOf(\"rm\") === -1) {\n    methods.push(\"rm\");\n    }\n\n    return {\n    authMethodsString: methods.join(\" \")\n    };\n};"
              },
              "nodeTitle" : {
                "value" : "Add rememberMe To authMethods"
              },
              "outputSchema" : {
                "value" : "{\n  \"output\": {\n    \"type\": \"object\",\n    \"properties\": {\n      \"authMethodsString\": { \"type\": \"string\" }\n    }\n  }\n}"
              },
              "variableInputList" : {
                "value" : [
                  {
                    "name" : "rememberme",
                    "preferredDataType" : "boolean",
                    "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"remember-me-checkbox\",\"data\":\"{{local.2pxl4v5qlp.payload.output.formData.remember-me-checkbox}}\",\"tooltip\":\"{{local.2pxl4v5qlp.payload.output.formData.remember-me-checkbox}}\",\"children\":[{\"text\":\"remember-me-checkbox\"}]}]}]"
                  },
                  {
                    "name" : "authMethods",
                    "preferredDataType" : "object",
                    "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"methods\",\"data\":\"{{global.authentication.methods}}\",\"tooltip\":\"{{global.authentication.methods}}\",\"children\":[{\"text\":\"methods\"}]}]}]"
                  }
                ]
              }
            })
          }
          position = {
            x = 574
            y = 5239.172335600907
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "531a2xxpv6b6" = {
          data = {
            id              = "531a2xxpv6b6"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "startNode"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "inputSchema" : {
                "value" : "{\n\t\"type\": \"object\",\n\t\"properties\": {\n\t\t\"userEmail\": {\n\t\t\t\"type\": \"string\",\n\t\t\t\"displayName\": \"User Email\",\n\t\t\t\"preferredControlType\": \"textField\",\n\t\t\t\"enableParameters\": true,\n\t\t\t\"propertyName\": \"userEmail\"\n\t\t},\n\t\t\"resendMsg\": {\n\t\t\t\"type\": \"string\",\n\t\t\t\"displayName\": \"Resend Message\",\n\t\t\t\"preferredControlType\": \"textField\",\n\t\t\t\"enableParameters\": true,\n\t\t\t\"propertyName\": \"resendMsg\"\n\t\t},\n\t\t\"retryLimitError\": {\n\t\t\t\"type\": \"string\",\n\t\t\t\"displayName\": \"Retry Limit Error\",\n\t\t\t\"preferredControlType\": \"textField\",\n\t\t\t\"enableParameters\": true,\n\t\t\t\"propertyName\": \"retryLimitError\"\n\t\t}\n\t}\n}"
              },
              "nodeTitle" : {
                "value" : "Email Verification"
              }
            })
          }
          position = {
            x = 305.2108843537415
            y = 4478.614512471647
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1311d35vsyxfq" = {
          data = {
            id               = "1311d35vsyxfq"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.authentication.id
            connector_id     = "authenticationUseCaseConnector"
            capability_class = "backend"
            name             = "Authentication"
            label            = "Authentication Journey"
            capability_name  = "checkAccountStatus"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "checkAccountStatusAgreement" : {
                "value" : "[{\"children\":[]}]"
              },
              "checkAccountVerificationStatus" : {
                "value" : true
              },
              "checkAgreementConsent" : {
                "value" : true
              },
              "nodeTitle" : {
                "value" : "Authentication"
              },
              "verificationCodeCustomTemplateVariant" : {
                "value" : "{}"
              }
            })
            outcomes = [
              {
                id     = "3ltwo6dsk9"
                result = "continue"
                label  = "Continue"
              },
              {
                id     = "ou3ctvg0d6"
                result = "verification_required"
                label  = "Verification Required"
              },
              {
                id     = "tsarwmppho"
                result = "agreement_required"
                label  = "Agreement Required"
              },
              {
                id     = "kltwjkw7zh"
                result = "error"
                label  = "Error"
              }
            ]
          }
          position = {
            x = 2900.4290232392295
            y = 358.6584942555578
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1211diz9vpjjr" = {
          data = {
            id               = "1211diz9vpjjr"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.form.id
            connector_id     = "pingOneFormsConnector"
            capability_class = "render"
            name             = "Form"
            label            = "PingOne Forms"
            capability_name  = "showForm"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "collectBehavioralData" : {
                "value" : false
              },
              "componentVisibility" : {
                "value" : [
                  {
                    "key" : "codeResentMessage",
                    "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"resendMsg\",\"data\":\"{{local.1a2xxpv6b6.payload.output.resendMsg}}\",\"tooltip\":\"{{local.1a2xxpv6b6.payload.output.resendMsg}}\",\"children\":[{\"text\":\"resendMsg\"}]}]}]"
                  },
                  {
                    "key" : "resend-limit-reached-text",
                    "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"retryLimitError\",\"data\":\"{{local.1a2xxpv6b6.payload.output.retryLimitError}}\",\"tooltip\":\"{{local.1a2xxpv6b6.payload.output.retryLimitError}}\",\"children\":[{\"text\":\"retryLimitError\"}]}]}]"
                  },
                  {
                    "key" : "resendCodeLink",
                    "value" : ""
                  }
                ]
              },
              "dynamicText" : {
                "value" : []
              },
              "enableRisk" : {
                "value" : false
              },
              "form" : {
                "value" : pingone_form.irco_starter_kit__e28094__verification_code.id
              },
              "formData" : {
                "value" : [
                  {
                    "key" : "verification-code-field",
                    "value" : ""
                  }
                ]
              },
              "nodeDescription" : {
                "value" : "Prompt the user to verify their email address by entering a verification code."
              },
              "nodeTitle" : {
                "value" : "Verification Code"
              },
              "theme" : {
                "value" : "activeTheme"
              }
            })
            outcomes = [
              {
                id     = "ugjcwdf4xd"
                result = "submit"
                label  = "Continue"
              },
              {
                id     = "m1461zfkeb"
                result = "resend-code-link"
                label  = "Resend Code"
              },
              {
                id     = "6u2lzd3e9x"
                result = "cancel-link"
                label  = "Cancel"
              }
            ]
          }
          position = {
            x = 595.9138321995465
            y = 4478.614512471647
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "641glq8nhi1k" = {
          data = {
            id              = "641glq8nhi1k"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "1500xngg20fg9"
              }
            })
          }
          position = {
            x = 1581.1844116309892
            y = 1644.6691401523858
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "331gmhj9es2i" = {
          data = {
            id              = "331gmhj9es2i"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "1500xngg20fg9"
              }
            })
          }
          position = {
            x = 1880.7133858834538
            y = 3776.631419007512
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "431hho4ldtw9" = {
          data = {
            id              = "431hho4ldtw9"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "1071ws0i7gp2d"
              },
              "resendMsg" : {
                "value" : " "
              },
              "retryLimitError" : {
                "value" : "Resend limit reached. Try again later."
              }
            })
          }
          position = {
            x = 2352.521928186683
            y = 2937.8888888888887
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1451id98m4kdx" = {
          data = {
            id              = "1451id98m4kdx"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "1141v0zyvofmz"
              }
            })
          }
          position = {
            x = 1150.4415590463345
            y = 3110.424579425404
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "661j1oxznamy" = {
          data = {
            id        = "661j1oxznamy"
            node_type = "EVAL"
            properties = jsonencode({
              "570k1nlg79ew" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 780
            y = 750.172335600907
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "441kxdlpixpj" = {
          data = {
            id              = "441kxdlpixpj"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "startNode"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeTitle" : {
                "value" : "User Registration"
              }
            })
          }
          position = {
            x = 305.2108843537415
            y = 3635.5759637188203
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "961l8sk2h1rg" = {
          data = {
            id              = "961l8sk2h1rg"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "531a2xxpv6b6"
              },
              "resendMsg" : {
                "value" : " "
              },
              "retryLimitError" : {
                "value" : "Resend limit reached. Try again later."
              },
              "userEmail" : {
                "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"userEmail\",\"data\":\"{{local.1a2xxpv6b6.payload.output.userEmail}}\",\"tooltip\":\"{{local.1a2xxpv6b6.payload.output.userEmail}}\",\"children\":[{\"text\":\"userEmail\"}]}]}]"
              }
            })
          }
          position = {
            x = 1206.3900226757369
            y = 4711.176870748296
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "281r342mj94r" = {
          data = {
            id              = "281r342mj94r"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "startNode"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "inputSchema" : {
                "value" : "{\n    \"type\": \"object\",\n    \"properties\": {\n        \"username\": {\n            \"propertyName\": \"username\",\n            \"preferredControlType\": \"textField\",\n            \"isExpanded\": true,\n            \"displayName\": \"Username\",\n            \"type\": \"string\",\n            \"enableParameters\": true\n        }\n    }\n}"
              },
              "nodeTitle" : {
                "value" : "Sign On"
              }
            })
          }
          position = {
            x = 305.2108843537415
            y = 359.3514739229024
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "911savvkq9u2" = {
          data = {
            id              = "911savvkq9u2"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "1141v0zyvofmz"
              }
            })
          }
          position = {
            x = 1581.1844116309892
            y = 1860.285196283884
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1141v0zyvofmz" = {
          data = {
            id              = "1141v0zyvofmz"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "startNode"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeTitle" : {
                "value" : "Return Error"
              }
            })
          }
          position = {
            x = 304
            y = 5619.172335600907
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1441vj2udlf69" = {
          data = {
            id              = "1441vj2udlf69"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "startNode"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeTitle" : {
                "value" : "Account Recovery"
              }
            })
          }
          position = {
            x = 305.2108843537415
            y = 2647.1859410430843
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1071ws0i7gp2d" = {
          data = {
            id              = "1071ws0i7gp2d"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "startNode"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "inputSchema" : {
                "value" : "{\n    \"type\": \"object\",\n    \"properties\": {\n        \"resendMsg\": {\n            \"type\": \"string\",\n            \"displayName\": \"Resend Message\",\n            \"preferredControlType\": \"textField\",\n            \"enableParameters\": true,\n            \"propertyName\": \"resendMsg\"\n        },\n        \"retryLimitError\": {\n            \"type\": \"string\",\n            \"displayName\": \"Retry Limit Error\",\n            \"preferredControlType\": \"textField\",\n            \"enableParameters\": true,\n            \"propertyName\": \"retryLimitError\"\n        }\n    }\n}"
              },
              "nodeTitle" : {
                "value" : "Resend Recovery Code"
              }
            })
          }
          position = {
            x = 1463.791421982825
            y = 2647.1859410430843
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "311y2en1fvf1" = {
          data = {
            id              = "311y2en1fvf1"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "startNode"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeTitle" : {
                "value" : "Check Account Status"
              }
            })
          }
          position = {
            x = 2629.3608902262176
            y = 358.6584942555578
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "631yhxy2jqz5" = {
          data = {
            id              = "631yhxy2jqz5"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingone_authentication.id
            connector_id    = "pingOneAuthenticationConnector"
            name            = "PingOne Authentication"
            label           = "PingOne Authentication"
            capability_name = "returnErrorResponseRedirect"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "customErrorFlag" : {
                "value" : false
              },
              "nodeTitle" : {
                "value" : "Redirect With Error Response"
              }
            })
          }
          position = {
            x = 574
            y = 5619.172335600907
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1191z7z8yxoe4" = {
          data = {
            id              = "1191z7z8yxoe4"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "281r342mj94r"
              }
            })
          }
          position = {
            x = 915.6870748299319
            y = 2908.8185941043084
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "601z9nrhh820" = {
          data = {
            id              = "601z9nrhh820"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "531a2xxpv6b6"
              },
              "userEmail" : {
                "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"email\",\"data\":\"{{local.2qtq630wh6.payload.output.user.email}}\",\"tooltip\":\"{{local.2qtq630wh6.payload.output.user.email}}\",\"children\":[{\"text\":\"email\"}]}]}]"
              }
            })
          }
          position = {
            x = 1541.9890889084281
            y = 3776.631419007512
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "10320tcwlk7dj" = {
          data = {
            id               = "10320tcwlk7dj"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.form.id
            connector_id     = "pingOneFormsConnector"
            capability_class = "render"
            name             = "Form"
            label            = "PingOne Forms"
            capability_name  = "showForm"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "agreement" : {
                "value" : "[{\"children\":[]}]"
              },
              "collectBehavioralData" : {
                "value" : false
              },
              "dynamicText" : {
                "value" : []
              },
              "enableRisk" : {
                "value" : false
              },
              "form" : {
                "value" : pingone_form.irco_starter_kit__e28094__agreement.id
              },
              "formData" : {
                "value" : []
              },
              "nodeDescription" : {
                "value" : "Agreement"
              },
              "nodeTitle" : {
                "value" : "Agreement"
              },
              "theme" : {
                "value" : "useThemeId"
              },
              "themeId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"url\": \"themeID\",\n        \"tooltip\": \"{{global.parameters.authorizationRequest.themeID}}\",\n        \"data\": \"{{global.parameters.authorizationRequest.themeID}}\",\n        \"src\": \"auth.svg\",\n        \"children\": [\n          {\n            \"text\": \"\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
            outcomes = [
              {
                id     = "rc3c1rmwps"
                result = "submit"
                label  = "Accept"
              },
              {
                id     = "kdbd00x1oq"
                result = "decline-link"
                label  = "Decline"
              }
            ]
          }
          position = {
            x = 934.3362432364936
            y = 1860.285196283884
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "472102zf0ulz" = {
          data = {
            id              = "472102zf0ulz"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "531a2xxpv6b6"
              },
              "resendMsg" : {
                "value" : "Code Resent"
              },
              "retryLimitError" : {
                "value" : " "
              },
              "userEmail" : {
                "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"userEmail\",\"data\":\"{{local.1a2xxpv6b6.payload.output.userEmail}}\",\"tooltip\":\"{{local.1a2xxpv6b6.payload.output.userEmail}}\",\"children\":[{\"text\":\"userEmail\"}]}]}]"
              }
            })
          }
          position = {
            x = 1206.3900226757369
            y = 4623.965986394557
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "692211eppnpc" = {
          data = {
            id              = "692211eppnpc"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "311y2en1fvf1"
              }
            })
          }
          position = {
            x = 3496.7789158678565
            y = 467.08574746076283
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "3922ji3wj5mv" = {
          data = {
            id              = "3922ji3wj5mv"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "returnBackToCallingNode"
            type            = "trigger"
            status          = "configured"
            properties      = jsonencode({})
          }
          position = {
            x = 1206.3900226757369
            y = 4478.614512471647
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "14322s891e0ol" = {
          data = {
            id               = "14322s891e0ol"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.error_message.id
            connector_id     = "errorConnector"
            capability_class = "backend"
            name             = "Error Message"
            label            = "Error Message"
            capability_name  = "customErrorMessage"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#ffc8c1ff"
              },
              "errorCode" : {
                "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"code\",\"data\":\"{{local.20tcwlk7dj.payload.error.code}}\",\"tooltip\":\"{{local.20tcwlk7dj.payload.error.code}}\",\"children\":[{\"text\":\"code\"}]}]}]"
              },
              "errorMessage" : {
                "value" : "You must accept the agreement to continue."
              },
              "nodeDescription" : {
                "value" : "Show a message: \"You must accept the agreement to continue.\""
              },
              "nodeTitle" : {
                "value" : "Agreement Declined Message"
              }
            })
          }
          position = {
            x = 1269.7389972188246
            y = 1975.1145545645504
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "13522yp535mae" = {
          data = {
            id               = "13522yp535mae"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.authentication.id
            connector_id     = "authenticationUseCaseConnector"
            capability_class = "backend"
            name             = "Authentication"
            label            = "Authentication Journey"
            capability_name  = "sendVerificationCode"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "nodeTitle" : {
                "value" : "Authentication"
              }
            })
            outcomes = [
              {
                id     = "x8c6yupma6"
                result = "code_resent"
                label  = "Code Resent"
              },
              {
                id     = "l9y8vrunkz"
                result = "retry_limit_reached"
                label  = "Retry Limit Reached"
              },
              {
                id     = "gcu14lendg"
                result = "error"
                label  = "Error"
              }
            ]
          }
          position = {
            x = 915.6870748299319
            y = 4623.965986394557
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "9723cgh3bwry" = {
          data = {
            id              = "9723cgh3bwry"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "1141v0zyvofmz"
              }
            })
          }
          position = {
            x = 1206.3900226757369
            y = 4798.3877551020405
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "15424nsnyy2go" = {
          data = {
            id              = "15424nsnyy2go"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingone_authentication.id
            connector_id    = "pingOneAuthenticationConnector"
            name            = "PingOne Authentication"
            label           = "PingOne Authentication"
            capability_name = "returnSuccessResponseRedirect"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "authenticationMethods" : {
                "value" : "useCustomAuthenticationMethods"
              },
              "customAuthenticationMethods" : {
                "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"authMethodsString\",\"data\":\"{{local.18975qbjaz.payload.output.authMethodsString}}\",\"tooltip\":\"{{local.18975qbjaz.payload.output.authMethodsString}}\",\"children\":[{\"text\":\"authMethodsString\"}]}]}]"
              },
              "idleTimeout" : {
                "value" : 43200
              },
              "nodeDescription" : {
                "value" : "Success return"
              },
              "nodeTitle" : {
                "value" : "Success"
              }
            })
          }
          position = {
            x = 874
            y = 5239.172335600907
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1462520c96qit" = {
          data = {
            id              = "1462520c96qit"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "531a2xxpv6b6"
              },
              "userEmail" : {
                "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"email\",\"data\":\"{{local.2alznw7c0t.payload.output.user.email}}\",\"tooltip\":\"{{local.2alznw7c0t.payload.output.user.email}}\",\"children\":[{\"text\":\"email\"}]}]}]"
              }
            })
          }
          position = {
            x = 3198.6039695535433
            y = 467.08574746076283
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "4625xikwhn3s" = {
          data = {
            id               = "4625xikwhn3s"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.form.id
            connector_id     = "pingOneFormsConnector"
            capability_class = "render"
            name             = "Form"
            label            = "PingOne Forms"
            capability_name  = "showForm"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "collectBehavioralData" : {
                "value" : false
              },
              "dynamicText" : {
                "value" : []
              },
              "enableRisk" : {
                "value" : false
              },
              "form" : {
                "value" : pingone_form.irco_starter_kit__e28094__recover_your_account.id
              },
              "formData" : {
                "value" : [
                  {
                    "key" : "user.email",
                    "value" : ""
                  }
                ]
              },
              "nodeDescription" : {
                "value" : "Prompt the user to enter their email address to receive a verification code."
              },
              "nodeTitle" : {
                "value" : "Recover Your Account"
              },
              "theme" : {
                "value" : "useThemeId"
              },
              "themeId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"url\": \"themeID\",\n        \"tooltip\": \"{{global.parameters.authorizationRequest.themeID}}\",\n        \"data\": \"{{global.parameters.authorizationRequest.themeID}}\",\n        \"src\": \"auth.svg\",\n        \"children\": [\n          {\n            \"text\": \"\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
            outcomes = [
              {
                id     = "gnhanaojdb"
                result = "submit"
                label  = "Continue"
              },
              {
                id     = "2xcmuuknbf"
                result = "cancel-link"
                label  = "Cancel"
              }
            ]
          }
          position = {
            x = 595.9138321995465
            y = 2647.1859410430843
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "7926h2nbue79" = {
          data = {
            id               = "7926h2nbue79"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.authentication.id
            connector_id     = "authenticationUseCaseConnector"
            capability_class = "backend"
            name             = "Authentication"
            label            = "Authentication Journey"
            capability_name  = "changePassword"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "currentPassword" : {
                "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"currentPassword\",\"data\":\"{{local.2n06ehykpz.payload.output.formData.user.currentPassword}}\",\"tooltip\":\"{{local.2n06ehykpz.payload.output.formData.user.currentPassword}}\",\"children\":[{\"text\":\"currentPassword\"}]}]}]"
              },
              "newPassword" : {
                "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"newPassword\",\"data\":\"{{local.2n06ehykpz.payload.output.formData.user.newPassword}}\",\"tooltip\":\"{{local.2n06ehykpz.payload.output.formData.user.newPassword}}\",\"children\":[{\"text\":\"newPassword\"}]}]}]"
              },
              "nodeDescription" : {
                "value" : "Update user password"
              },
              "nodeTitle" : {
                "value" : "Authentication"
              }
            })
          }
          position = {
            x = 3008.8562764444346
            y = 1063.4356400893894
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "09281kjq6t3o" = {
          data = {
            id               = "09281kjq6t3o"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.authentication.id
            connector_id     = "authenticationUseCaseConnector"
            capability_class = "backend"
            name             = "Authentication"
            label            = "Authentication Journey"
            capability_name  = "acceptAgreement"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "agreement" : {
                "value" : "useAgreementId"
              },
              "agreementId" : {
                "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"agreementId\",\"data\":\"{{local.20tcwlk7dj.payload.output.formData.agreementId}}\",\"tooltip\":\"{{local.20tcwlk7dj.payload.output.formData.agreementId}}\",\"children\":[{\"text\":\"agreementId\"}]}]}]"
              }
            })
          }
          position = {
            x = 1269.7389972188246
            y = 1860.285196283884
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1392alznw7c0t" = {
          data = {
            id               = "1392alznw7c0t"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.authentication.id
            connector_id     = "authenticationUseCaseConnector"
            capability_class = "backend"
            name             = "Authentication"
            label            = "Authentication Journey"
            capability_name  = "authenticateUser"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "nodeTitle" : {
                "value" : "Authentication"
              },
              "password" : {
                "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"password\",\"data\":\"{{local.2pxl4v5qlp.payload.output.formData.user.password}}\",\"tooltip\":\"{{local.2pxl4v5qlp.payload.output.formData.user.password}}\",\"children\":[{\"text\":\"password\"}]}]}]"
              },
              "username" : {
                "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"email\",\"data\":\"{{local.2mb91yyrd8.payload.output.formData.user.email}}\",\"tooltip\":\"{{local.2mb91yyrd8.payload.output.formData.user.email}}\",\"children\":[{\"text\":\"email\"}]}]}]"
              }
            })
            outcomes = [
              {
                id     = "szsqx4vre0"
                result = "ok"
                label  = "Continue"
              },
              {
                id     = "r6pu5s6thu"
                result = "new_password_required"
                label  = "New Password Required"
              },
              {
                id     = "tnit01779y"
                result = "error"
                label  = "Error"
              }
            ]
          }
          position = {
            x = 2412.506383815808
            y = 358.6584942555578
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1102arb3lhxfx" = {
          data = {
            id              = "1102arb3lhxfx"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "281r342mj94r"
              }
            })
          }
          position = {
            x = 915.6870748299319
            y = 4885.598639455778
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "902ghkpfczwl" = {
          data = {
            id               = "902ghkpfczwl"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.error_message.id
            connector_id     = "errorConnector"
            capability_class = "backend"
            name             = "Error Message"
            label            = "Error Message"
            capability_name  = "customErrorMessage"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#ffc8c1ff"
              },
              "errorCode" : {
                "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"code\",\"data\":\"{{local.0sjozlk5r7.payload.error.code}}\",\"tooltip\":\"{{local.0sjozlk5r7.payload.error.code}}\",\"children\":[{\"text\":\"code\"}]}]}]"
              },
              "errorMessage" : {
                "value" : "You must accept the agreement to continue."
              },
              "nodeDescription" : {
                "value" : "Show a message: \"You must accept the agreement to continue.\""
              },
              "nodeTitle" : {
                "value" : "Agreement Declined Message"
              }
            })
          }
          position = {
            x = 3523.8857291691575
            y = 738.153880473775
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "002ht96d7fpa" = {
          data = {
            id              = "002ht96d7fpa"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "1141v0zyvofmz"
              }
            })
          }
          position = {
            x = 3794.95386218217
            y = 629.7266272685699
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "302mb91yyrd8" = {
          data = {
            id               = "302mb91yyrd8"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.form.id
            connector_id     = "pingOneFormsConnector"
            capability_class = "render"
            name             = "Form"
            label            = "PingOne Forms"
            capability_name  = "showForm"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "collectBehavioralData" : {
                "value" : true
              },
              "componentVisibility" : {
                "value" : [
                  {
                    "key" : "passkeyAuth",
                    "value" : "[{\"children\":[{\"text\":\"false\"}]}]"
                  },
                  {
                    "key" : "passwordlessAuth"
                  },
                  {
                    "key" : "socialLoginAuth",
                    "value" : "[{\"children\":[{\"text\":\"true\"}]}]"
                  },
                  {
                    "key" : "register",
                    "value" : "[{\"children\":[{\"text\":\"true\"}]}]"
                  },
                  {
                    "key" : "accountRecovery",
                    "value" : "[{\"children\":[{\"text\":\"false\"}]}]"
                  }
                ]
              },
              "dynamicText" : {
                "value" : []
              },
              "enableRisk" : {
                "value" : true
              },
              "form" : {
                "value" : pingone_form.irco_starter_kit__e28094__sign_in_or_linkedin.id
              },
              "formData" : {
                "value" : [
                  {
                    "key" : "user.email",
                    "value" : "[{\"children\":[{\"text\":\"\"}]}]"
                  }
                ]
              },
              "idpList" : {
                "constructType" : "skConnectorList",
                "value" : [
                  {
                    "connectionId" : "c3e6a164bde107954e93f5c09f0c8bce",
                    "connectorId" : "pingOneAuthenticationConnector",
                    "properties" : {}
                  }
                ]
              },
              "linkWithP1User" : {
                "value" : true
              },
              "nodeDescription" : {
                "value" : "Prompt the user to sign on."
              },
              "nodeTitle" : {
                "value" : "IRCO Starter Kit — Sign in or LinkedIn"
              },
              "populationId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"7a01ac12-9699-408e-91a3-938ba70c5ff3\"\n      }\n    ]\n  }\n]"
              },
              "returnUrl" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"https://auth.pingone.eu/cf069241-3860-4e6b-9450-ac2d7950184c/rp/callback/linkedin_oidc\"\n      }\n    ]\n  }\n]"
              },
              "theme" : {
                "value" : "activeTheme"
              },
              "themeId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"url\": \"themeID\",\n        \"tooltip\": \"{{global.parameters.authorizationRequest.themeID}}\",\n        \"data\": \"{{global.parameters.authorizationRequest.themeID}}\",\n        \"src\": \"auth.svg\",\n        \"children\": [\n          {\n            \"text\": \"\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
            outcomes = [
              {
                id     = "6s4zjelwmf"
                result = "submit"
                label  = "Sign On"
              },
              {
                id     = "9qjiqxdism"
                result = "passkey-button"
                label  = "Sign On with Passkey"
              },
              {
                id     = "xexkoh9sfz"
                result = "passwordless-button"
                label  = "Passwordless SignOn"
              },
              {
                id     = "h3z7hscsvk"
                result = "externalIdp_6bfbf5e5-88c1-487d-89b5-8829861c0fd3"
                label  = "Ingersoll Rand LinkedIn"
              },
              {
                id     = "21g35ckvl4"
                result = "register-link"
                label  = "No account? Register now!"
              },
              {
                id     = "o9m5yavhst"
                result = "account-recovery-link"
                label  = "Having trouble signing on?"
              }
            ]
          }
          position = {
            x = 595.9138321995465
            y = 359.3514739229024
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "172n06ehykpz" = {
          data = {
            id               = "172n06ehykpz"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.form.id
            connector_id     = "pingOneFormsConnector"
            capability_class = "render"
            name             = "Form"
            label            = "PingOne Forms"
            capability_name  = "showForm"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "dynamicText" : {
                "value" : []
              },
              "form" : {
                "value" : pingone_form.irco_starter_kit__e28094__change_your_password.id
              },
              "formData" : {
                "value" : [
                  {
                    "key" : "user.currentPassword",
                    "value" : ""
                  },
                  {
                    "key" : "user.newPassword",
                    "value" : ""
                  }
                ]
              },
              "nodeDescription" : {
                "value" : "Prompt the user to enter their current password and set a new password."
              },
              "nodeTitle" : {
                "value" : "Change Your Password"
              },
              "theme" : {
                "value" : "activeTheme"
              }
            })
            outcomes = [
              {
                id     = "4m6pl6lpv1"
                result = "submit"
                label  = "Continue"
              },
              {
                id     = "1hdqqkwjml"
                result = "cancel-link"
                label  = "Cancel"
              }
            ]
          }
          position = {
            x = 2710.6813301301213
            y = 1063.4356400893894
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1042o9yhhen7m" = {
          data = {
            id              = "1042o9yhhen7m"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#caced3ff"
              },
              "nodeInstanceId" : {
                "value" : "1141v0zyvofmz"
              }
            })
          }
          position = {
            x = 934.3362432364936
            y = 2195.687950266215
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1232ot8aawr5p" = {
          data = {
            id               = "1232ot8aawr5p"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.authentication.id
            connector_id     = "authenticationUseCaseConnector"
            capability_class = "backend"
            name             = "Authentication"
            label            = "Authentication Journey"
            capability_name  = "recoverAccountSendRecoveryCode"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "nodeTitle" : {
                "value" : "Authentication"
              },
              "username" : {
                "value" : "[{\"children\":[{\"text\":\" \"},{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"email\",\"data\":\"{{local.25xikwhn3s.payload.output.formData.user.email}}\",\"tooltip\":\"{{local.25xikwhn3s.payload.output.formData.user.email}}\",\"children\":[{\"text\":\"email\"}]},{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"username\",\"data\":\"{{local.25xikwhn3s.payload.output.formData.user.username}}\",\"tooltip\":\"{{local.25xikwhn3s.payload.output.formData.user.username}}\",\"children\":[{\"text\":\"username\"}]}]}]"
              }
            })
          }
          position = {
            x = 1463.791421982825
            y = 2763.4671201814062
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1382pxl4v5qlp" = {
          data = {
            id               = "1382pxl4v5qlp"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.form.id
            connector_id     = "pingOneFormsConnector"
            capability_class = "render"
            name             = "Form"
            label            = "PingOne Forms"
            capability_name  = "showForm"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "collectBehavioralData" : {
                "value" : true
              },
              "componentVisibility" : {
                "value" : [
                  {
                    "key" : "passwordAuth",
                    "value" : "[{\"children\":[{\"text\":\"true\"}]}]"
                  },
                  {
                    "key" : "rememberMe",
                    "value" : "[{\"children\":[{\"text\":\"true\"}]}]"
                  },
                  {
                    "key" : "accountRecovery",
                    "value" : "[{\"children\":[{\"text\":\"true\"}]}]"
                  }
                ]
              },
              "dynamicText" : {
                "value" : []
              },
              "enableRisk" : {
                "value" : true
              },
              "form" : {
                "value" : pingone_form.irco_starter_kit__e28094__sign_on__0028_password_0029.id
              },
              "formData" : {
                "value" : [
                  {
                    "key" : "user.password",
                    "value" : ""
                  }
                ]
              },
              "nodeDescription" : {
                "value" : "Prompt the user to sign on."
              },
              "nodeTitle" : {
                "value" : "Sign On - Password"
              },
              "theme" : {
                "value" : "useThemeId"
              },
              "themeId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"url\": \"themeID\",\n        \"tooltip\": \"{{global.parameters.authorizationRequest.themeID}}\",\n        \"data\": \"{{global.parameters.authorizationRequest.themeID}}\",\n        \"src\": \"auth.svg\",\n        \"children\": [\n          {\n            \"text\": \"\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
            outcomes = [
              {
                id     = "3admg3l4t6"
                result = "submit"
                label  = "Sign On"
              },
              {
                id     = "iue9j8qng5"
                result = "account-recovery-link"
                label  = "Having trouble signing on?"
              }
            ]
          }
          position = {
            x = 2005.9041842962897
            y = 358.6584942555578
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1002qtq630wh6" = {
          data = {
            id               = "1002qtq630wh6"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.authentication.id
            connector_id     = "authenticationUseCaseConnector"
            capability_class = "backend"
            name             = "Authentication"
            label            = "Authentication Journey"
            capability_name  = "registerAccount"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "additionalUserProperties" : {
                "value" : []
              },
              "email" : {
                "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"email\",\"data\":\"{{local.0d9jvouoil.payload.output.formData.user.email}}\",\"tooltip\":\"{{local.0d9jvouoil.payload.output.formData.user.email}}\",\"children\":[{\"text\":\"email\"}]}]}]"
              },
              "family" : {
                "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"family\",\"data\":\"{{local.0d9jvouoil.payload.output.formData.user.name.family}}\",\"tooltip\":\"{{local.0d9jvouoil.payload.output.formData.user.name.family}}\",\"children\":[{\"text\":\"family\"}]}]}]"
              },
              "given" : {
                "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"given\",\"data\":\"{{local.0d9jvouoil.payload.output.formData.user.name.given}}\",\"tooltip\":\"{{local.0d9jvouoil.payload.output.formData.user.name.given}}\",\"children\":[{\"text\":\"given\"}]}]}]"
              },
              "mobilePhone" : {
                "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"mobilePhone\",\"data\":\"{{local.0d9jvouoil.payload.output.formData.user.mobilePhone}}\",\"tooltip\":\"{{local.0d9jvouoil.payload.output.formData.user.mobilePhone}}\",\"children\":[{\"text\":\"mobilePhone\"}]}]}]"
              },
              "nodeTitle" : {
                "value" : "Authentication"
              },
              "password" : {
                "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"password\",\"data\":\"{{local.0d9jvouoil.payload.output.formData.user.password}}\",\"tooltip\":\"{{local.0d9jvouoil.payload.output.formData.user.password}}\",\"children\":[{\"text\":\"password\"}]}]}]"
              },
              "population" : {
                "value" : "usePopulationId"
              },
              "populationId" : {
                "value" : pingone_population.local_users.id
              },
              "requireUserToVerifyEmail" : {
                "value" : true
              },
              "username" : {
                "value" : "[{\"children\":[{\"type\":\"link\",\"src\":\"auth.svg\",\"url\":\"email\",\"data\":\"{{local.0d9jvouoil.payload.output.formData.user.email}}\",\"tooltip\":\"{{local.0d9jvouoil.payload.output.formData.user.email}}\",\"children\":[{\"text\":\"email\"}]}]}]"
              }
            })
            outcomes = [
              {
                id     = "22l4g6kfrv"
                result = "success"
                label  = "Verification Required"
              },
              {
                id     = "w355b44hda"
                result = "error"
                label  = "Error"
              }
            ]
          }
          position = {
            x = 1259.7188414292398
            y = 3635.496295267918
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1483n8uubc2vp" = {
          data = {
            id        = "1483n8uubc2vp"
            node_type = "EVAL"
            properties = jsonencode({
              "13522yp535mae" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 1061.0385487528342
            y = 4623.965986394557
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1183poui3v50k" = {
          data = {
            id              = "1183poui3v50k"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            label           = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "annotation" : {
                "value" : " "
              },
              "annotationTextColor" : {
                "value" : "#ffffffff"
              },
              "backgroundColor" : {
                "value" : "#4a90e2ff"
              },
              "cornerRadius" : {
                "value" : 100
              },
              "fontFamily" : {
                "value" : "\"Open Sans\", sans-serif"
              },
              "fontSize" : {
                "value" : 16
              },
              "fontStyle" : {
                "value" : "bold"
              },
              "strokeColor" : {
                "value" : "#4a90e2ff"
              },
              "strokeEnabled" : {
                "value" : true
              },
              "strokeWidth" : {
                "value" : 2
              },
              "width" : {
                "value" : 650
              }
            })
          }
          position = {
            x = 654.0544217687075
            y = 4333.263038548753
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "133vlqwq39h6" = {
          data = {
            id        = "133vlqwq39h6"
            node_type = "EVAL"
            properties = jsonencode({
              "1500xngg20fg9" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 424
            y = 5239.172335600907
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "62458jb4gdgj" = {
          data = {
            id        = "62458jb4gdgj"
            node_type = "EVAL"
            properties = jsonencode({
              "1330xk4f74cqh" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 1296.5286754405265
            y = 2647.1859410430843
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "14048snft2w4u" = {
          data = {
            id               = "14048snft2w4u"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.http.id
            connector_id     = "httpConnector"
            capability_class = "backend"
            name             = "Http"
            label            = "Http"
            capability_name  = "makeRestApiCall"
            type             = "trigger"
            status           = "configured"
            properties = jsonencode({
              "headers" : {
                "value" : [
                  {
                    "key" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Authorization\"\n      }\n    ]\n  }\n]",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"Bearer \"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"access_token\",\n        \"data\": \"{{local.ad02uo58lr.payload.output.rawResponse.body.access_token}}\",\n        \"tooltip\": \"{{local.ad02uo58lr.payload.output.rawResponse.body.access_token}}\",\n        \"children\": [\n          {\n            \"text\": \"access_token\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              },
              "nodeTitle" : {
                "value" : "Find User in EntraID"
              },
              "outputSchema" : {
                "value" : "{\n  \"$schema\": \"https://json-schema.org/draft/2020-12/schema\",\n  \"title\": \"MicrosoftGraphUserCollectionResponse\",\n  \"type\": \"object\",\n  \"required\": [\n    \"value\"\n  ],\n  \"properties\": {\n    \"@odata.context\": {\n      \"type\": \"string\",\n      \"description\": \"Metadata URL describing the context of the payload.\"\n    },\n    \"@odata.nextLink\": {\n      \"type\": \"string\",\n      \"description\": \"Pagination URL to retrieve the next page of results (present when total results exceed page size).\"\n    },\n    \"value\": {\n      \"type\": \"array\",\n      \"description\": \"Array of Microsoft Graph User objects.\",\n      \"items\": {\n        \"type\": \"object\",\n        \"required\": [\n          \"id\"\n        ],\n        \"properties\": {\n          \"id\": {\n            \"type\": \"string\",\n            \"description\": \"Unique identifier (GUID) for the user.\"\n          },\n          \"userPrincipalName\": {\n            \"type\": [\"string\", \"null\"],\n            \"description\": \"The User Principal Name (UPN) of the user.\"\n          },\n          \"displayName\": {\n            \"type\": [\"string\", \"null\"],\n            \"description\": \"The name displayed in the address book for the user.\"\n          },\n          \"givenName\": {\n            \"type\": [\"string\", \"null\"],\n            \"description\": \"The given name (first name) of the user.\"\n          },\n          \"surname\": {\n            \"type\": [\"string\", \"null\"],\n            \"description\": \"The user's surname (family name or last name).\"\n          },\n          \"mail\": {\n            \"type\": [\"string\", \"null\"],\n            \"description\": \"The SMTP address for the user.\"\n          },\n          \"jobTitle\": {\n            \"type\": [\"string\", \"null\"],\n            \"description\": \"The user's job title.\"\n          },\n          \"officeLocation\": {\n            \"type\": [\"string\", \"null\"],\n            \"description\": \"The office location in the user's place of business.\"\n          },\n          \"preferredLanguage\": {\n            \"type\": [\"string\", \"null\"],\n            \"description\": \"The preferred language for the user.\"\n          },\n          \"businessPhones\": {\n            \"type\": \"array\",\n            \"items\": {\n              \"type\": \"string\"\n            },\n            \"description\": \"The telephone numbers for the user.\"\n          },\n          \"mobilePhone\": {\n            \"type\": [\"string\", \"null\"],\n            \"description\": \"The primary cellular telephone number for the user.\"\n          }\n        },\n        \"additionalProperties\": true\n      }\n    }\n  },\n  \"additionalProperties\": true\n}"
              },
              "url" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"https://graph.microsoft.com/v1.0/users/\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingone-forms.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{local.2mb91yyrd8.payload.output.formData.user.email}}\",\n        \"tooltip\": \"{{local.2mb91yyrd8.payload.output.formData.user.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 1138.4861586546508
            y = 765.2606937750761
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "784p61imaicj" = {
          data = {
            id        = "784p61imaicj"
            node_type = "EVAL"
            properties = jsonencode({
              "281r342mj94r" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 450.562358276644
            y = 359.3514739229024
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "454rm3aiy9pt" = {
          data = {
            id        = "454rm3aiy9pt"
            node_type = "EVAL"
            properties = jsonencode({
              "1392alznw7c0t" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 2548.040450322314
            y = 1063.4356400893894
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "924yekxqpfm9" = {
          data = {
            id        = "924yekxqpfm9"
            node_type = "EVAL"
            properties = jsonencode({
              "1002qtq630wh6" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 1400.8539651688338
            y = 3776.631419007512
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "3250v1b8pcns" = {
          data = {
            id        = "3250v1b8pcns"
            node_type = "EVAL"
            properties = jsonencode({
              "1392alznw7c0t" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 2249.8655040080007
            y = 358.6584942555578
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "0856fq4hnsjf" = {
          data = {
            id        = "0856fq4hnsjf"
            node_type = "EVAL"
            properties = jsonencode({
              "16ad02uo58lr" : {
                "value" : "anyTriggersFalse"
              }
            })
          }
          position = {
            x = 1002.9520921481449
            y = 385.76530755685917
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1305dnki11bc0" = {
          data = {
            id        = "1305dnki11bc0"
            node_type = "EVAL"
            properties = jsonencode({
              "7926h2nbue79" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 3171.497156252242
            y = 1063.4356400893894
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "185ourzhmq6y" = {
          data = {
            id        = "185ourzhmq6y"
            node_type = "EVAL"
          }
          position = {
            x = 1737.670351574317
            y = 660.9877972202248
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1476bb7b8a2aw" = {
          data = {
            id               = "1476bb7b8a2aw"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.http.id
            connector_id     = "httpConnector"
            capability_class = "render"
            name             = "Http"
            label            = "Http"
            capability_name  = "customHtmlMessage"
            type             = "trigger"
            status           = "configured"
            properties = jsonencode({
              "message" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Here is your access token. Use it wisely:\"\n      }\n    ]\n  },\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"access_token\",\n        \"data\": \"{{local.ad02uo58lr.payload.output.rawResponse.body.access_token}}\",\n        \"tooltip\": \"{{local.ad02uo58lr.payload.output.rawResponse.body.access_token}}\",\n        \"children\": [\n          {\n            \"text\": \"access_token\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeTitle" : {
                "value" : "Show Access Token"
              },
              "showContinueButton" : {
                "value" : true
              }
            })
          }
          position = {
            x = 1138.4861586546508
            y = 629.7266272685699
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1056bn5h0bigq" = {
          data = {
            id               = "1056bn5h0bigq"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.http.id
            connector_id     = "httpConnector"
            capability_class = "render"
            name             = "Http"
            label            = "Http"
            capability_name  = "customHtmlMessage"
            type             = "trigger"
            status           = "configured"
            properties = jsonencode({
              "message" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Here is the User:\"\n      }\n    ]\n  },\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"url\": \"userPrincipalName\",\n        \"tooltip\": \"{{local.48snft2w4u.payload.output.rawResponse.body.userPrincipalName}}\",\n        \"data\": \"{{local.48snft2w4u.payload.output.rawResponse.body.userPrincipalName}}\",\n        \"src\": \"http.svg\",\n        \"children\": [\n          {\n            \"text\": \"\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\\n\"\n      },\n      {\n        \"text\": \"\\n\\n\"\n      }\n    ]\n  }\n]"
              },
              "nodeTitle" : {
                "value" : "Show User"
              },
              "showContinueButton" : {
                "value" : true
              }
            })
          }
          position = {
            x = 1138.4861586546508
            y = 900.7947602815821
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "376lgrmfrlbm" = {
          data = {
            id        = "376lgrmfrlbm"
            node_type = "EVAL"
            properties = jsonencode({
              "14322s891e0ol" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 1078.0802806574927
            y = 1975.1145545645504
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "106uss3esz7z" = {
          data = {
            id        = "106uss3esz7z"
            node_type = "EVAL"
            properties = jsonencode({
              "1170ur5bbmask" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 2195.6871329742376
            y = 3025.0997732426304
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "3589exm4h0nf" = {
          data = {
            id               = "3589exm4h0nf"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.http.id
            connector_id     = "httpConnector"
            capability_class = "render"
            name             = "Http"
            label            = "Http"
            capability_name  = "customHtmlMessage"
            type             = "trigger"
            status           = "configured"
            properties = jsonencode({
              "message" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Here is the User:\\n\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"url:48snft2w4u\",\n        \"url\": \"userPrincipalName\",\n        \"data\": \"{{local.48snft2w4u.payload.output.rawResponse.body.userPrincipalName}}\",\n        \"tooltip\": \"{{local.48snft2w4u.payload.output.rawResponse.body.userPrincipalName}}\",\n        \"children\": [\n          {\n            \"text\": \"{{local.48snft2w4u.payload.output.rawResponse.body.userPrincipalName}}\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\\nHear is the response to marking migrated:\"\n      }\n    ]\n  },\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"statusCode\",\n        \"data\": \"{{local.wmm1avkt0k.payload.output.rawResponse.statusCode}}\",\n        \"tooltip\": \"{{local.wmm1avkt0k.payload.output.rawResponse.statusCode}}\",\n        \"children\": [\n          {\n            \"text\": \"statusCode\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\\n\\n\"\n      }\n    ]\n  }\n]"
              },
              "nodeTitle" : {
                "value" : "Show User Migration Status"
              },
              "showContinueButton" : {
                "value" : true
              }
            })
          }
          position = {
            x = 1626.4087980780728
            y = 819.4743203776786
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "4095z7mw8wqj" = {
          data = {
            id        = "4095z7mw8wqj"
            node_type = "EVAL"
            properties = jsonencode({
              "68083z3rmd1g" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 1908.1566750847542
            y = 3141.3809523809523
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1099co6nss8oq" = {
          data = {
            id        = "1099co6nss8oq"
            node_type = "EVAL"
            properties = jsonencode({
              "311y2en1fvf1" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 2764.8949567327236
            y = 358.6584942555578
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "1209g3go1wzf4" = {
          data = {
            id        = "1209g3go1wzf4"
            node_type = "EVAL"
            properties = jsonencode({
              "10320tcwlk7dj" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 766.6348662453281
            y = 1860.285196283884
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "419s9t8kgsre" = {
          data = {
            id        = "419s9t8kgsre"
            node_type = "EVAL"
            properties = jsonencode({
              "13522yp535mae" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 1061.0385487528342
            y = 4711.176870748296
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "16ad02uo58lr" = {
          data = {
            id               = "16ad02uo58lr"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.http.id
            connector_id     = "httpConnector"
            capability_class = "backend"
            name             = "Http"
            label            = "Http"
            capability_name  = "makeRestApiCall"
            type             = "trigger"
            status           = "configured"
            properties = jsonencode({
              "headers" : {
                "value" : [
                  {
                    "key" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Content-Type\"\n      }\n    ]\n  }\n]",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"application/x-www-form-urlencoded\"\n      }\n    ]\n  }\n]"
                  }
                ]
              },
              "httpBody" : {
                "value" : "raw"
              },
              "httpMethod" : {
                "value" : "POST"
              },
              "nodeTitle" : {
                "value" : "Get EntraID Access Token"
              },
              "outputSchema" : {
                "value" : "{\n  \"$schema\": \"https://json-schema.org/draft/2020-12/schema\",\n  \"title\": \"OAuth2AccessTokenResponse\",\n  \"type\": \"object\",\n  \"required\": [\n    \"token_type\",\n    \"expires_in\",\n    \"access_token\"\n  ],\n  \"properties\": {\n    \"token_type\": {\n      \"type\": \"string\",\n      \"description\": \"The type of token issued, typically 'Bearer'.\"\n    },\n    \"expires_in\": {\n      \"type\": \"integer\",\n      \"description\": \"The lifetime in seconds of the access token.\"\n    },\n    \"ext_expires_in\": {\n      \"type\": \"integer\",\n      \"description\": \"Extended lifetime in seconds during outages.\"\n    },\n    \"access_token\": {\n      \"type\": \"string\",\n      \"description\": \"The issued access token string (typically a JWT).\"\n    }\n  },\n  \"additionalProperties\": true\n}"
              },
              "raw" : {
                "value" : "grant_type=client_credentials\n\u0026client_id=f6586904-bc99-428d-a88c-0e548ca6436f\n\u0026client_secret=REDACTED\n\u0026scope=https://graph.microsoft.com/.default"
              },
              "url" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"https://login.microsoftonline.com/254d80cc-8a8a-4cb2-98d7-196d743a05bb/oauth2/v2.0/token\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 1138.4861586546508
            y = 494.192560762064
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "56ah6u1ff558" = {
          data = {
            id        = "56ah6u1ff558"
            node_type = "EVAL"
            properties = jsonencode({
              "1170ur5bbmask" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 2195.6871329742376
            y = 2850.678004535147
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "141apcwz59lrx" = {
          data = {
            id              = "141apcwz59lrx"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            label           = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "annotation" : {
                "value" : "Account Recovery"
              },
              "annotationTextColor" : {
                "value" : "#ffffffff"
              },
              "backgroundColor" : {
                "value" : "#4a90e2ff"
              },
              "cornerRadius" : {
                "value" : 100
              },
              "fontFamily" : {
                "value" : "\"Open Sans\", sans-serif"
              },
              "fontSize" : {
                "value" : 16
              },
              "fontStyle" : {
                "value" : "bold"
              },
              "strokeColor" : {
                "value" : "#4a90e2ff"
              },
              "strokeEnabled" : {
                "value" : true
              },
              "strokeWidth" : {
                "value" : 2
              },
              "width" : {
                "value" : 460
              }
            })
          }
          position = {
            x = 218
            y = 2501.834467120181
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "02bcgytar965" = {
          data = {
            id              = "02bcgytar965"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            label           = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "annotation" : {
                "value" : "External IdP Sign On"
              },
              "annotationTextColor" : {
                "value" : "#ffffffff"
              },
              "backgroundColor" : {
                "value" : "#4a90e2ff"
              },
              "cornerRadius" : {
                "value" : 100
              },
              "fontFamily" : {
                "value" : "\"Open Sans\", sans-serif"
              },
              "fontSize" : {
                "value" : 16
              },
              "fontStyle" : {
                "value" : "bold"
              },
              "strokeColor" : {
                "value" : "#4a90e2ff"
              },
              "strokeEnabled" : {
                "value" : true
              },
              "strokeWidth" : {
                "value" : 2
              },
              "width" : {
                "value" : 460
              }
            })
          }
          position = {
            x = 222.6820933174767
            y = 1511.2042870634195
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "11bksj8d2bjj" = {
          data = {
            id        = "11bksj8d2bjj"
            node_type = "EVAL"
            properties = jsonencode({
              "880d9jvouoil" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 741.265306122449
            y = 3996.2789115646256
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "71djzci5afi3" = {
          data = {
            id        = "71djzci5afi3"
            node_type = "EVAL"
            properties = jsonencode({
              "1392alznw7c0t" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 3063.069903047037
            y = 629.7266272685699
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "12dxzmcdr8zz" = {
          data = {
            id        = "12dxzmcdr8zz"
            node_type = "EVAL"
            properties = jsonencode({
              "68083z3rmd1g" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 1908.1566750847542
            y = 2647.1859410430843
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "25e4kxhjrnp4" = {
          data = {
            id        = "25e4kxhjrnp4"
            node_type = "EVAL"
            properties = jsonencode({
              "172n06ehykpz" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 2846.2153966366272
            y = 1171.8628932945942
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "27e5afg9n3vh" = {
          data = {
            id        = "27e5afg9n3vh"
            node_type = "EVAL"
            properties = jsonencode({
              "172n06ehykpz" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 2846.2153966366272
            y = 1063.4356400893894
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "128fcqsh3yjn7" = {
          data = {
            id        = "128fcqsh3yjn7"
            node_type = "EVAL"
            properties = jsonencode({
              "8116ns28pa1z" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 741.265306122449
            y = 3896.631419007512
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "50fkgzzvjim4" = {
          data = {
            id        = "50fkgzzvjim4"
            node_type = "EVAL"
            properties = jsonencode({
              "4625xikwhn3s" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 741.265306122449
            y = 2763.4671201814062
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "142flhhsetjou" = {
          data = {
            id        = "142flhhsetjou"
            node_type = "EVAL"
            properties = jsonencode({
              "911savvkq9u2" : {
                "value" : "anyTriggersFalse"
              }
            })
          }
          position = {
            x = 1413.4830346398237
            y = 1860.285196283884
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "74fqd7fa8z3d" = {
          data = {
            id        = "74fqd7fa8z3d"
            node_type = "EVAL"
            properties = jsonencode({
              "2415dl8522ou" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 479.1467914033301
            y = 1644.6691401523858
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "54glvzr5yi3y" = {
          data = {
            id        = "54glvzr5yi3y"
            node_type = "EVAL"
            properties = jsonencode({
              "002ht96d7fpa" : {
                "value" : "anyTriggersFalse"
              }
            })
          }
          position = {
            x = 3659.419795675664
            y = 629.7266272685699
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "93gm5l2y0a1i" = {
          data = {
            id        = "93gm5l2y0a1i"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 1246.9134118598558
            y = 521.2993740633651
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "101h0x49r5udy" = {
          data = {
            id              = "101h0x49r5udy"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            label           = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "annotation" : {
                "value" : "Register Account"
              },
              "annotationTextColor" : {
                "value" : "#ffffffff"
              },
              "backgroundColor" : {
                "value" : "#4a90e2ff"
              },
              "cornerRadius" : {
                "value" : 100
              },
              "fontFamily" : {
                "value" : "\"Open Sans\", sans-serif"
              },
              "fontSize" : {
                "value" : 16
              },
              "fontStyle" : {
                "value" : "bold"
              },
              "strokeColor" : {
                "value" : "#4a90e2ff"
              },
              "strokeEnabled" : {
                "value" : true
              },
              "strokeWidth" : {
                "value" : 2
              },
              "width" : {
                "value" : 460
              }
            })
          }
          position = {
            x = 218
            y = 3490.224489795918
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "20h1mrxlol47" = {
          data = {
            id               = "20h1mrxlol47"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.functions.id
            connector_id     = "functionsConnector"
            capability_class = "backend"
            name             = "Functions"
            label            = "Functions"
            capability_name  = "customFunction"
            type             = "trigger"
            status           = "configured"
            properties = jsonencode({
              "code" : {
                "value" : "// Write your code here\n// Supported language: Javascript \nmodule.exports = async ({params}) =\u003e {\n    const currentTime = new Date().toISOString();\n    return { 'currentTime': currentTime };\n};"
              },
              "nodeTitle" : {
                "value" : "Generate Timestamp"
              },
              "outputSchema" : {
                "value" : "{\n    \"output\": {\n        \"type\": \"object\",\n        \"properties\": {\n            \"currentTime\": {\n                \"type\": \"string\"\n            }\n        }\n    }\n}"
              }
            })
          }
          position = {
            x = 1138.4861586546508
            y = 1036.3288267880882
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "99haajkp5akm" = {
          data = {
            id        = "99haajkp5akm"
            node_type = "EVAL"
            properties = jsonencode({
              "531a2xxpv6b6" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 450.562358276644
            y = 4478.614512471647
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "48hul4x29daz" = {
          data = {
            id        = "48hul4x29daz"
            node_type = "EVAL"
            properties = jsonencode({
              "1520vfye4zp3i" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 2195.6871329742376
            y = 2647.1859410430843
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "132hv6kk10c0a" = {
          data = {
            id        = "132hv6kk10c0a"
            node_type = "EVAL"
            properties = jsonencode({
              "09281kjq6t3o" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 1078.0802806574927
            y = 1860.285196283884
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "98ib12ufdt7k" = {
          data = {
            id        = "98ib12ufdt7k"
            node_type = "EVAL"
            properties = jsonencode({
              "1441vj2udlf69" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 450.562358276644
            y = 2647.1859410430843
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "76idohn5ig8q" = {
          data = {
            id        = "76idohn5ig8q"
            node_type = "EVAL"
            properties = jsonencode({
              "13522yp535mae" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 1061.0385487528342
            y = 4798.3877551020405
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "72j864qsl63b" = {
          data = {
            id              = "72j864qsl63b"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            label           = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "annotation" : {
                "value" : "Sign On"
              },
              "annotationTextColor" : {
                "value" : "#ffffffff"
              },
              "backgroundColor" : {
                "value" : "#4a90e2ff"
              },
              "cornerRadius" : {
                "value" : 100
              },
              "fontFamily" : {
                "value" : "\"Open Sans\", sans-serif"
              },
              "fontSize" : {
                "value" : 16
              },
              "fontStyle" : {
                "value" : "bold"
              },
              "strokeColor" : {
                "value" : "#4a90e2ff"
              },
              "strokeEnabled" : {
                "value" : true
              },
              "strokeWidth" : {
                "value" : 2
              },
              "width" : {
                "value" : 460
              }
            })
          }
          position = {
            x = 218
            y = 214
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "70jth75wq4k1" = {
          data = {
            id        = "70jth75wq4k1"
            node_type = "EVAL"
            properties = jsonencode({
              "1392alznw7c0t" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 2764.8949567327236
            y = 358.6584942555578
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "86kd9fq4xf7w" = {
          data = {
            id        = "86kd9fq4xf7w"
            node_type = "EVAL"
            properties = jsonencode({
              "002ht96d7fpa" : {
                "value" : "anyTriggersFalse"
              }
            })
          }
          position = {
            x = 3361.24484936135
            y = 629.7266272685699
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "06khw0ppe7jb" = {
          data = {
            id        = "06khw0ppe7jb"
            node_type = "EVAL"
            properties = jsonencode({
              "1462520c96qit" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 3307.031222758748
            y = 467.08574746076283
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "149kqthqkfk3w" = {
          data = {
            id        = "149kqthqkfk3w"
            node_type = "EVAL"
          }
          position = {
            x = 1246.9134118598558
            y = 1036.3288267880882
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "05luy2tfa01v" = {
          data = {
            id        = "05luy2tfa01v"
            node_type = "EVAL"
            properties = jsonencode({
              "1211diz9vpjjr" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 741.265306122449
            y = 4885.598639455778
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "95mfe4jj56nn" = {
          data = {
            id              = "95mfe4jj56nn"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            label           = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "annotation" : {
                "value" : " "
              },
              "annotationTextColor" : {
                "value" : "#ffffffff"
              },
              "backgroundColor" : {
                "value" : "#4a90e2ff"
              },
              "cornerRadius" : {
                "value" : 100
              },
              "fontFamily" : {
                "value" : "\"Open Sans\", sans-serif"
              },
              "fontSize" : {
                "value" : 16
              },
              "fontStyle" : {
                "value" : "bold"
              },
              "strokeColor" : {
                "value" : "#4a90e2ff"
              },
              "strokeEnabled" : {
                "value" : true
              },
              "strokeWidth" : {
                "value" : 2
              },
              "width" : {
                "value" : 1265
              }
            })
          }
          position = {
            x = 624.984126984127
            y = 3490.224489795918
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "77mfxgb3y0xz" = {
          data = {
            id              = "77mfxgb3y0xz"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            label           = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "annotation" : {
                "value" : " "
              },
              "annotationTextColor" : {
                "value" : "#ffffffff"
              },
              "backgroundColor" : {
                "value" : "#4a90e2ff"
              },
              "cornerRadius" : {
                "value" : 100
              },
              "fontFamily" : {
                "value" : "\"Open Sans\", sans-serif"
              },
              "fontSize" : {
                "value" : 16
              },
              "fontStyle" : {
                "value" : "bold"
              },
              "strokeColor" : {
                "value" : "#4a90e2ff"
              },
              "strokeEnabled" : {
                "value" : true
              },
              "strokeWidth" : {
                "value" : 2
              },
              "width" : {
                "value" : 1820
              }
            })
          }
          position = {
            x = 624.984126984127
            y = 2501.834467120181
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "36mhyukcim0g" = {
          data = {
            id        = "36mhyukcim0g"
            node_type = "EVAL"
            properties = jsonencode({
              "641glq8nhi1k" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 766.6348662453281
            y = 1644.6691401523858
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "75mpw3034usp" = {
          data = {
            id        = "75mpw3034usp"
            node_type = "EVAL"
            properties = jsonencode({
              "1382pxl4v5qlp" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 2249.8655040080007
            y = 683.9402538711724
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "83mqsseua5oo" = {
          data = {
            id        = "83mqsseua5oo"
            node_type = "EVAL"
            properties = jsonencode({
              "2318975qbjaz" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 724
            y = 5239.172335600907
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "87mwa98kpp4w" = {
          data = {
            id        = "87mwa98kpp4w"
            node_type = "EVAL"
            properties = jsonencode({
              "880d9jvouoil" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 741.265306122449
            y = 3635.5759637188203
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "126n0w1ruorm7" = {
          data = {
            id        = "126n0w1ruorm7"
            node_type = "EVAL"
            properties = jsonencode({
              "1382pxl4v5qlp" : {
                "value" : "allTriggersFalse"
              }
            })
          }
          position = {
            x = 1617.9281382222173
            y = 373.01031522491235
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "73n42659x92l" = {
          data = {
            id        = "73n42659x92l"
            node_type = "EVAL"
            properties = jsonencode({
              "601z9nrhh820" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 1683.1242126480222
            y = 3776.631419007512
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "108opwj3iq2yk" = {
          data = {
            id              = "108opwj3iq2yk"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            label           = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "annotation" : {
                "value" : "Success"
              },
              "annotationTextColor" : {
                "value" : "#ffffffff"
              },
              "backgroundColor" : {
                "value" : "#4a90e2ff"
              },
              "cornerRadius" : {
                "value" : 100
              },
              "fontFamily" : {
                "value" : "\"Open Sans\", sans-serif"
              },
              "fontSize" : {
                "value" : 16
              },
              "fontStyle" : {
                "value" : "bold"
              },
              "strokeColor" : {
                "value" : "#4a90e2ff"
              },
              "strokeEnabled" : {
                "value" : true
              },
              "strokeWidth" : {
                "value" : 2
              },
              "width" : {
                "value" : 760
              }
            })
          }
          position = {
            x = 214
            y = 5129.172335600907
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "84orzyly6iji" = {
          data = {
            id               = "84orzyly6iji"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.functions.id
            connector_id     = "functionsConnector"
            capability_class = "backend"
            name             = "Functions"
            label            = "Functions"
            capability_name  = "AEqualsB"
            type             = "trigger"
            status           = "configured"
            properties = jsonencode({
              "caseSensitive" : {
                "value" : false
              },
              "leftValueA" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"passwordStatus\",\n        \"data\": \"{{local.t6uwbxhn3l.payload.output.passwordStatus}}\",\n        \"tooltip\": \"{{local.t6uwbxhn3l.payload.output.passwordStatus}}\",\n        \"children\": [\n          {\n            \"text\": \"passwordStatus\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeTitle" : {
                "value" : "Password is not set"
              },
              "rightValueB" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"NO_PASSWORD\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 1229.9520921481449
            y = 387.3621361942669
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "82ouxxxk27p7" = {
          data = {
            id        = "82ouxxxk27p7"
            node_type = "EVAL"
            properties = jsonencode({
              "441kxdlpixpj" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 450.562358276644
            y = 3635.5759637188203
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "112p7nypm5zxc" = {
          data = {
            id        = "112p7nypm5zxc"
            node_type = "EVAL"
            properties = jsonencode({
              "1462520c96qit" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 3063.069903047037
            y = 927.9015735828834
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "34plai6cg85z" = {
          data = {
            id        = "34plai6cg85z"
            node_type = "EVAL"
            properties = jsonencode({
              "1141v0zyvofmz" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 424
            y = 5619.172335600907
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "26qdtc1yivco" = {
          data = {
            id        = "26qdtc1yivco"
            node_type = "EVAL"
            properties = jsonencode({
              "1170ur5bbmask" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 2195.6871329742376
            y = 2937.8888888888887
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "134r7s7stqt7h" = {
          data = {
            id        = "134r7s7stqt7h"
            node_type = "EVAL"
            properties = jsonencode({
              "1042o9yhhen7m" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 766.6348662453281
            y = 2195.687950266215
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "15rfw49nkyop" = {
          data = {
            id        = "15rfw49nkyop"
            node_type = "EVAL"
            properties = jsonencode({
              "550m5pgnj0d3" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 1061.0385487528342
            y = 4478.614512471647
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "113rxrwuac94d" = {
          data = {
            id        = "113rxrwuac94d"
            node_type = "EVAL"
            properties = jsonencode({
              "510sl3ysoxw4" : {
                "value" : "anyTriggersFalse"
              }
            })
          }
          position = {
            x = 1620.6262171952706
            y = 2647.1859410430843
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "52rygt127u8i" = {
          data = {
            id        = "52rygt127u8i"
            node_type = "EVAL"
          }
          position = {
            x = 1463.7679182702655
            y = 873.6879469802809
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "59swevoz4cl8" = {
          data = {
            id        = "59swevoz4cl8"
            node_type = "EVAL"
            properties = jsonencode({
              "1071ws0i7gp2d" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 1620.6262171952706
            y = 2647.1859410430843
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "115t6uwbxhn3l" = {
          data = {
            id              = "115t6uwbxhn3l"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingone_master.id
            connector_id    = "pingOneSSOConnector"
            name            = "PingOne"
            label           = "PingOne"
            capability_name = "userLookup"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "matchAttributes" : {
                "value" : [
                  "username"
                ]
              },
              "returnUserPasswordStatus" : {
                "value" : true
              },
              "userIdentifierForFindUser" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingone-forms.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{local.2mb91yyrd8.payload.output.formData.user.email}}\",\n        \"tooltip\": \"{{local.2mb91yyrd8.payload.output.formData.user.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 836
            y = 395.672335600907
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "22tncdlvbcmv" = {
          data = {
            id        = "22tncdlvbcmv"
            node_type = "EVAL"
            properties = jsonencode({
              "902ghkpfczwl" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 3361.24484936135
            y = 738.153880473775
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "61tomg6cge48" = {
          data = {
            id        = "61tomg6cge48"
            node_type = "EVAL"
            properties = jsonencode({
              "4625xikwhn3s" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 741.265306122449
            y = 2908.8185941043084
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "127tqiptvfr89" = {
          data = {
            id        = "127tqiptvfr89"
            node_type = "EVAL"
            properties = jsonencode({
              "1211diz9vpjjr" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 741.265306122449
            y = 4623.965986394557
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "29un4vtkxuhq" = {
          data = {
            id              = "29un4vtkxuhq"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            label           = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "annotation" : {
                "value" : " "
              },
              "annotationTextColor" : {
                "value" : "#ffffffff"
              },
              "backgroundColor" : {
                "value" : "#4a90e2ff"
              },
              "cornerRadius" : {
                "value" : 100
              },
              "fontFamily" : {
                "value" : "\"Open Sans\", sans-serif"
              },
              "fontSize" : {
                "value" : 16
              },
              "fontStyle" : {
                "value" : "bold"
              },
              "strokeColor" : {
                "value" : "#4a90e2ff"
              },
              "strokeEnabled" : {
                "value" : true
              },
              "strokeWidth" : {
                "value" : 2
              },
              "width" : {
                "value" : 2750
              }
            })
          }
          position = {
            x = 566.843537414966
            y = 214
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "21uukm9qt5e2" = {
          data = {
            id        = "21uukm9qt5e2"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 1246.9134118598558
            y = 927.9015735828834
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "19uuoz2u8lpn" = {
          data = {
            id        = "19uuoz2u8lpn"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 1246.9134118598558
            y = 792.3675070763773
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "80uw21kbvm1m" = {
          data = {
            id        = "80uw21kbvm1m"
            node_type = "EVAL"
            properties = jsonencode({
              "1211diz9vpjjr" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 741.265306122449
            y = 4478.614512471647
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "125vg64zypwa7" = {
          data = {
            id              = "125vg64zypwa7"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            label           = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "annotation" : {
                "value" : "Error"
              },
              "annotationTextColor" : {
                "value" : "#ffffffff"
              },
              "backgroundColor" : {
                "value" : "#4a90e2ff"
              },
              "cornerRadius" : {
                "value" : 100
              },
              "fontFamily" : {
                "value" : "\"Open Sans\", sans-serif"
              },
              "fontSize" : {
                "value" : 16
              },
              "fontStyle" : {
                "value" : "bold"
              },
              "strokeColor" : {
                "value" : "#4a90e2ff"
              },
              "strokeEnabled" : {
                "value" : true
              },
              "strokeWidth" : {
                "value" : 2
              },
              "width" : {
                "value" : 460
              }
            })
          }
          position = {
            x = 214
            y = 5499.172335600907
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "38w027xus9pu" = {
          data = {
            id        = "38w027xus9pu"
            node_type = "EVAL"
            properties = jsonencode({
              "1311d35vsyxfq" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 3063.069903047037
            y = 467.08574746076283
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "106wkvg3ocqi0" = {
          data = {
            id        = "106wkvg3ocqi0"
            node_type = "EVAL"
            properties = jsonencode({
              "1451id98m4kdx" : {
                "value" : "anyTriggersFalse"
              }
            })
          }
          position = {
            x = 998.4387802489225
            y = 2764.955834813404
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "137wmm1avkt0k" = {
          data = {
            id               = "137wmm1avkt0k"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.http.id
            connector_id     = "httpConnector"
            capability_class = "backend"
            name             = "Http"
            label            = "Http"
            capability_name  = "makeRestApiCall"
            type             = "trigger"
            status           = "configured"
            properties = jsonencode({
              "headers" : {
                "value" : [
                  {
                    "key" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Authorization\"\n      }\n    ]\n  }\n]",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"Bearer \"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"access_token\",\n        \"data\": \"{{local.ad02uo58lr.payload.output.rawResponse.body.access_token}}\",\n        \"tooltip\": \"{{local.ad02uo58lr.payload.output.rawResponse.body.access_token}}\",\n        \"children\": [\n          {\n            \"text\": \"access_token\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "key" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Content-Type\"\n      }\n    ]\n  }\n]",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"application/json\"\n      }\n    ]\n  }\n]"
                  }
                ]
              },
              "httpBody" : {
                "value" : "raw"
              },
              "httpMethod" : {
                "value" : "PATCH"
              },
              "nodeTitle" : {
                "value" : "Flag User in EntraID as Migrated to Ping"
              },
              "outputSchema" : {
                "value" : "{\n  \"$schema\": \"https://json-schema.org/draft/2020-12/schema\",\n  \"title\": \"MicrosoftGraphUserUpdateSuccessResponse\",\n  \"type\": \"object\",\n  \"description\": \"Successful PATCH request returns HTTP 204 No Content with an empty response payload.\",\n  \"properties\": {},\n  \"additionalProperties\": false\n}"
              },
              "raw" : {
                "value" : "{\n  \"employeeType\": \"PING_MIGRATED_{{local.h1mrxlol47.payload.output.currentTime}}\"\n}"
              },
              "url" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"https://graph.microsoft.com/v1.0/users/\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingone-forms.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{local.2mb91yyrd8.payload.output.formData.user.email}}\",\n        \"tooltip\": \"{{local.2mb91yyrd8.payload.output.formData.user.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 1140
            y = 1170
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "01x69c93rg74" = {
          data = {
            id        = "01x69c93rg74"
            node_type = "EVAL"
            properties = jsonencode({
              "1311d35vsyxfq" : {
                "value" : "allTriggersTrue"
              }
            })
          }
          position = {
            x = 3063.069903047037
            y = 358.6584942555578
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "122y6nizpl1lv" = {
          data = {
            id              = "122y6nizpl1lv"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            label           = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "annotation" : {
                "value" : "Verify Email"
              },
              "annotationTextColor" : {
                "value" : "#ffffffff"
              },
              "backgroundColor" : {
                "value" : "#4a90e2ff"
              },
              "cornerRadius" : {
                "value" : 100
              },
              "fontFamily" : {
                "value" : "\"Open Sans\", sans-serif"
              },
              "fontSize" : {
                "value" : 16
              },
              "fontStyle" : {
                "value" : "bold"
              },
              "strokeColor" : {
                "value" : "#4a90e2ff"
              },
              "strokeEnabled" : {
                "value" : true
              },
              "strokeWidth" : {
                "value" : 2
              },
              "width" : {
                "value" : 460
              }
            })
          }
          position = {
            x = 218
            y = 4333.263038548753
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "65z5yswefgw2" = {
          data = {
            id        = "65z5yswefgw2"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 1246.9134118598558
            y = 656.8334405698713
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
        "07zx20b8xta9" = {
          data = {
            id              = "07zx20b8xta9"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            label           = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "annotation" : {
                "value" : " "
              },
              "annotationTextColor" : {
                "value" : "#ffffffff"
              },
              "backgroundColor" : {
                "value" : "#4a90e2ff"
              },
              "cornerRadius" : {
                "value" : 100
              },
              "fontFamily" : {
                "value" : "\"Open Sans\", sans-serif"
              },
              "fontSize" : {
                "value" : 16
              },
              "fontStyle" : {
                "value" : "bold"
              },
              "strokeColor" : {
                "value" : "#4a90e2ff"
              },
              "strokeEnabled" : {
                "value" : true
              },
              "strokeWidth" : {
                "value" : 2
              },
              "width" : {
                "value" : 1200
              }
            })
          }
          position = {
            x = 538.682093317476
            y = 1511.2042870634195
          }
          group      = "nodes"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = false
          classes    = ""
        }
      }
      edges = {
        "01o0kquaeq" = {
          data = {
            id     = "01o0kquaeq"
            source = "16ad02uo58lr"
            target = "93gm5l2y0a1i"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "0h4v7kfw6x" = {
          data = {
            id     = "0h4v7kfw6x"
            source = "1441vj2udlf69"
            target = "98ib12ufdt7k"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "0wcq7xcq2v" = {
          data = {
            id                    = "0wcq7xcq2v"
            source                = "302mb91yyrd8"
            target                = "1510v8gnkrs8x"
            multi_value_source_id = "21g35ckvl4"
          }
          position = {
            x = 64
            y = 212
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "173v9ne1go" = {
          data = {
            id     = "173v9ne1go"
            source = "1530apfzfajon"
            target = "74fqd7fa8z3d"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "1glkjmide6" = {
          data = {
            id     = "1glkjmide6"
            source = "26qdtc1yivco"
            target = "431hho4ldtw9"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "1k11yfvf97" = {
          data = {
            id                    = "1k11yfvf97"
            source                = "1160sjozlk5r7"
            target                = "86kd9fq4xf7w"
            multi_value_source_id = "rvvwu0ruwo"
          }
          position = {
            x = 64
            y = 52
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "1s7kixhjro" = {
          data = {
            id     = "1s7kixhjro"
            source = "06khw0ppe7jb"
            target = "692211eppnpc"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "1svuv7efp7" = {
          data = {
            id     = "1svuv7efp7"
            source = "61tomg6cge48"
            target = "1191z7z8yxoe4"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "2cb34op2u4" = {
          data = {
            id     = "2cb34op2u4"
            source = "3589exm4h0nf"
            target = "185ourzhmq6y"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "2fm7yc6g5u" = {
          data = {
            id     = "2fm7yc6g5u"
            source = "149kqthqkfk3w"
            target = "137wmm1avkt0k"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "2ftse1wnxb" = {
          data = {
            id     = "2ftse1wnxb"
            source = "62458jb4gdgj"
            target = "1232ot8aawr5p"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "2o1c2hvs0c" = {
          data = {
            id     = "2o1c2hvs0c"
            source = "05luy2tfa01v"
            target = "1102arb3lhxfx"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "2w2nb9za5t" = {
          data = {
            id                    = "2w2nb9za5t"
            source                = "1382pxl4v5qlp"
            target                = "3250v1b8pcns"
            multi_value_source_id = "3admg3l4t6"
          }
          position = {
            x = 64
            y = 52
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "3fv9n2lmz8" = {
          data = {
            id     = "3fv9n2lmz8"
            source = "82ouxxxk27p7"
            target = "880d9jvouoil"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "3i4zrx9p44" = {
          data = {
            id     = "3i4zrx9p44"
            source = "4095z7mw8wqj"
            target = "0415ohzj3jqe"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "3ih6rkh4zj" = {
          data = {
            id     = "3ih6rkh4zj"
            source = "1071ws0i7gp2d"
            target = "59swevoz4cl8"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "48fn3zy6md" = {
          data = {
            id                    = "48fn3zy6md"
            source                = "10320tcwlk7dj"
            target                = "376lgrmfrlbm"
            multi_value_source_id = "kdbd00x1oq"
          }
          position = {
            x = 64
            y = 92
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "4dkx33v54o" = {
          data = {
            id     = "4dkx33v54o"
            source = "83mqsseua5oo"
            target = "15424nsnyy2go"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "4he36pyhv2" = {
          data = {
            id                    = "4he36pyhv2"
            source                = "1311d35vsyxfq"
            target                = "71djzci5afi3"
            multi_value_source_id = "tsarwmppho"
          }
          position = {
            x = 64
            y = 132
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "4irw7ey8nj" = {
          data = {
            id     = "4irw7ey8nj"
            source = "140uwd5cmzit"
            target = "54glvzr5yi3y"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "4it5glw6bo" = {
          data = {
            id                    = "4it5glw6bo"
            source                = "302mb91yyrd8"
            target                = "850adkt6pfx1"
            multi_value_source_id = "6s4zjelwmf"
          }
          position = {
            x = 64
            y = 52
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "4lj8c84ucm" = {
          data = {
            id     = "4lj8c84ucm"
            source = "0856fq4hnsjf"
            target = "16ad02uo58lr"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "5jhj1ldhig" = {
          data = {
            id     = "5jhj1ldhig"
            source = "27e5afg9n3vh"
            target = "7926h2nbue79"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "603cnasrzn" = {
          data = {
            id     = "603cnasrzn"
            source = "419s9t8kgsre"
            target = "961l8sk2h1rg"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "61h3ia1yyq" = {
          data = {
            id     = "61h3ia1yyq"
            source = "38w027xus9pu"
            target = "1462520c96qit"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "6a7h5kzlqg" = {
          data = {
            id     = "6a7h5kzlqg"
            source = "19uuoz2u8lpn"
            target = "1056bn5h0bigq"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "6emu9k8bnc" = {
          data = {
            id     = "6emu9k8bnc"
            source = "54glvzr5yi3y"
            target = "4905acmu01se"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "6ina49k6ai" = {
          data = {
            id                    = "6ina49k6ai"
            source                = "13522yp535mae"
            target                = "419s9t8kgsre"
            multi_value_source_id = "l9y8vrunkz"
          }
          position = {
            x = 64
            y = 92
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "6ocsakyctb" = {
          data = {
            id     = "6ocsakyctb"
            source = "20h1mrxlol47"
            target = "149kqthqkfk3w"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "6p0k5xvgbc" = {
          data = {
            id                    = "6p0k5xvgbc"
            source                = "880d9jvouoil"
            target                = "87mwa98kpp4w"
            multi_value_source_id = "hqrdmmsjsv"
          }
          position = {
            x = 64
            y = 52
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "76c3mxc159" = {
          data = {
            id     = "76c3mxc159"
            source = "01x69c93rg74"
            target = "4905acmu01se"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "7b6r5duyxl" = {
          data = {
            id     = "7b6r5duyxl"
            source = "601z9nrhh820"
            target = "73n42659x92l"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "7sm8v12bso" = {
          data = {
            id     = "7sm8v12bso"
            source = "113rxrwuac94d"
            target = "68083z3rmd1g"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "8cid6wx3qv" = {
          data = {
            id     = "8cid6wx3qv"
            source = "924yekxqpfm9"
            target = "601z9nrhh820"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "8f08ycesch" = {
          data = {
            id     = "8f08ycesch"
            source = "73n42659x92l"
            target = "331gmhj9es2i"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "9bdecgyju3" = {
          data = {
            id     = "9bdecgyju3"
            source = "99haajkp5akm"
            target = "1211diz9vpjjr"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "9kw7ujv5gr" = {
          data = {
            id                    = "9kw7ujv5gr"
            source                = "1170ur5bbmask"
            target                = "56ah6u1ff558"
            multi_value_source_id = "4r55ua0pzg"
          }
          position = {
            x = 64
            y = 52
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "9xdch4vxnv" = {
          data = {
            id     = "9xdch4vxnv"
            source = "1240sjm0udh9l"
            target = "1170ur5bbmask"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "a6t7j61ax3" = {
          data = {
            id     = "a6t7j61ax3"
            source = "106uss3esz7z"
            target = "11109zvnryktc"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "afi8u12f5q" = {
          data = {
            id     = "afi8u12f5q"
            source = "70jth75wq4k1"
            target = "1311d35vsyxfq"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "at509qosng" = {
          data = {
            id     = "at509qosng"
            source = "14048snft2w4u"
            target = "19uuoz2u8lpn"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "b0i8btlp9z" = {
          data = {
            id                    = "b0i8btlp9z"
            source                = "2415dl8522ou"
            target                = "1209g3go1wzf4"
            multi_value_source_id = "3esdecu3ie"
          }
          position = {
            x = 64
            y = 92
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "bpibjan3ea" = {
          data = {
            id     = "bpibjan3ea"
            source = "54glvzr5yi3y"
            target = "002ht96d7fpa"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "bzcips1gwo" = {
          data = {
            id     = "bzcips1gwo"
            source = "52rygt127u8i"
            target = "3589exm4h0nf"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "cfvfe49knv" = {
          data = {
            id     = "cfvfe49knv"
            source = "128fcqsh3yjn7"
            target = "8116ns28pa1z"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "d1pesoejc6" = {
          data = {
            id     = "d1pesoejc6"
            source = "113rxrwuac94d"
            target = "510sl3ysoxw4"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "d4x9yg7thk" = {
          data = {
            id                    = "d4x9yg7thk"
            source                = "13522yp535mae"
            target                = "76idohn5ig8q"
            multi_value_source_id = "gcu14lendg"
          }
          position = {
            x = 64
            y = 132
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "d8h0r3a6s9" = {
          data = {
            id     = "d8h0r3a6s9"
            source = "137wmm1avkt0k"
            target = "52rygt127u8i"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "dx5cx7y8jd" = {
          data = {
            id                    = "dx5cx7y8jd"
            source                = "1211diz9vpjjr"
            target                = "80uw21kbvm1m"
            multi_value_source_id = "ugjcwdf4xd"
          }
          position = {
            x = 64
            y = 52
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "e160bkbss8" = {
          data = {
            id     = "e160bkbss8"
            source = "441kxdlpixpj"
            target = "82ouxxxk27p7"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "eq9lq0ezf2" = {
          data = {
            id     = "eq9lq0ezf2"
            source = "1476bb7b8a2aw"
            target = "65z5yswefgw2"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "etn9z6vk1h" = {
          data = {
            id     = "etn9z6vk1h"
            source = "106wkvg3ocqi0"
            target = "1232ot8aawr5p"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "eumq5kuhrm" = {
          data = {
            id     = "eumq5kuhrm"
            source = "1209g3go1wzf4"
            target = "10320tcwlk7dj"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "ex2fsz4t76" = {
          data = {
            id     = "ex2fsz4t76"
            source = "134r7s7stqt7h"
            target = "1042o9yhhen7m"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "f2oxnvotny" = {
          data = {
            id                    = "f2oxnvotny"
            source                = "880d9jvouoil"
            target                = "11bksj8d2bjj"
            multi_value_source_id = "4y9czfrxv6"
          }
          position = {
            x = 64
            y = 132
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "f4hzdp1i3b" = {
          data = {
            id                    = "f4hzdp1i3b"
            source                = "1392alznw7c0t"
            target                = "70jth75wq4k1"
            multi_value_source_id = "szsqx4vre0"
          }
          position = {
            x = 64
            y = 52
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "faqc8poooi" = {
          data = {
            id     = "faqc8poooi"
            source = "09281kjq6t3o"
            target = "142flhhsetjou"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "fgrcgjzmop" = {
          data = {
            id                    = "fgrcgjzmop"
            source                = "13522yp535mae"
            target                = "1483n8uubc2vp"
            multi_value_source_id = "x8c6yupma6"
          }
          position = {
            x = 64
            y = 52
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "fkrvhkpgga" = {
          data = {
            id     = "fkrvhkpgga"
            source = "376lgrmfrlbm"
            target = "14322s891e0ol"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "fm966ogjv7" = {
          data = {
            id     = "fm966ogjv7"
            source = "65z5yswefgw2"
            target = "14048snft2w4u"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "ftrvrx56oi" = {
          data = {
            id     = "ftrvrx56oi"
            source = "1462520c96qit"
            target = "06khw0ppe7jb"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "fzspq1j78a" = {
          data = {
            id     = "fzspq1j78a"
            source = "80uw21kbvm1m"
            target = "550m5pgnj0d3"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "g0uru84vmi" = {
          data = {
            id     = "g0uru84vmi"
            source = "0856fq4hnsjf"
            target = "84orzyly6iji"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "gcldtzerel" = {
          data = {
            id     = "gcldtzerel"
            source = "1520vfye4zp3i"
            target = "48hul4x29daz"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "gg8mxyc8rx" = {
          data = {
            id                    = "gg8mxyc8rx"
            source                = "172n06ehykpz"
            target                = "27e5afg9n3vh"
            multi_value_source_id = "4m6pl6lpv1"
          }
          position = {
            x = 64
            y = 52
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "gpia6ejns2" = {
          data = {
            id     = "gpia6ejns2"
            source = "86kd9fq4xf7w"
            target = "140uwd5cmzit"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "guvurmpubu" = {
          data = {
            id     = "guvurmpubu"
            source = "2318975qbjaz"
            target = "83mqsseua5oo"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "h1lezpz59w" = {
          data = {
            id     = "h1lezpz59w"
            source = "550m5pgnj0d3"
            target = "15rfw49nkyop"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "h3jzyris8i" = {
          data = {
            id     = "h3jzyris8i"
            source = "1232ot8aawr5p"
            target = "113rxrwuac94d"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "h93rb3rdqo" = {
          data = {
            id     = "h93rb3rdqo"
            source = "21uukm9qt5e2"
            target = "20h1mrxlol47"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "hhudpdcutd" = {
          data = {
            id     = "hhudpdcutd"
            source = "59swevoz4cl8"
            target = "68083z3rmd1g"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "hwnujddkhh" = {
          data = {
            id     = "hwnujddkhh"
            source = "36mhyukcim0g"
            target = "641glq8nhi1k"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "i2q925pa3l" = {
          data = {
            id     = "i2q925pa3l"
            source = "71djzci5afi3"
            target = "1160sjozlk5r7"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "i4gvburv72" = {
          data = {
            id     = "i4gvburv72"
            source = "106wkvg3ocqi0"
            target = "1451id98m4kdx"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "i84e2ovdl9" = {
          data = {
            id     = "i84e2ovdl9"
            source = "132hv6kk10c0a"
            target = "09281kjq6t3o"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "i9cz2lawxl" = {
          data = {
            id                    = "i9cz2lawxl"
            source                = "1160sjozlk5r7"
            target                = "22tncdlvbcmv"
            multi_value_source_id = "9329xdnlyl"
          }
          position = {
            x = 64
            y = 92
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "ipz91aupdm" = {
          data = {
            id                    = "ipz91aupdm"
            source                = "68083z3rmd1g"
            target                = "1240sjm0udh9l"
            multi_value_source_id = "yt27fwraly"
          }
          position = {
            x = 64
            y = 92
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "iz0xvivszl" = {
          data = {
            id                    = "iz0xvivszl"
            source                = "2415dl8522ou"
            target                = "36mhyukcim0g"
            multi_value_source_id = "kx73pttdch"
          }
          position = {
            x = 64
            y = 52
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "izcxz0a7nk" = {
          data = {
            id                    = "izcxz0a7nk"
            source                = "1170ur5bbmask"
            target                = "106uss3esz7z"
            multi_value_source_id = "xfchlqbhvm"
          }
          position = {
            x = 64
            y = 132
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "j4jv59vquh" = {
          data = {
            id     = "j4jv59vquh"
            source = "22tncdlvbcmv"
            target = "902ghkpfczwl"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "jzc8zcc6eo" = {
          data = {
            id     = "jzc8zcc6eo"
            source = "1099co6nss8oq"
            target = "1311d35vsyxfq"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "jzrwl8w8za" = {
          data = {
            id     = "jzrwl8w8za"
            source = "12dxzmcdr8zz"
            target = "1520vfye4zp3i"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "k3jvdlie58" = {
          data = {
            id     = "k3jvdlie58"
            source = "50fkgzzvjim4"
            target = "890rjurdezwb"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "kfkodebwr1" = {
          data = {
            id     = "kfkodebwr1"
            source = "1056bn5h0bigq"
            target = "21uukm9qt5e2"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "kgtvom8wmv" = {
          data = {
            id     = "kgtvom8wmv"
            source = "454rm3aiy9pt"
            target = "172n06ehykpz"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "ko3ipvbil4" = {
          data = {
            id     = "ko3ipvbil4"
            source = "185ourzhmq6y"
            target = "1382pxl4v5qlp"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "kqrmi5xc0w" = {
          data = {
            id     = "kqrmi5xc0w"
            source = "11bksj8d2bjj"
            target = "1290hmbc9e11m"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "ks8gcvtf84" = {
          data = {
            id                    = "ks8gcvtf84"
            source                = "1382pxl4v5qlp"
            target                = "75mpw3034usp"
            multi_value_source_id = "iue9j8qng5"
          }
          position = {
            x = 64
            y = 92
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "kthndu4jir" = {
          data = {
            id     = "kthndu4jir"
            source = "126n0w1ruorm7"
            target = "1382pxl4v5qlp"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "kxluac82nr" = {
          data = {
            id                    = "kxluac82nr"
            source                = "302mb91yyrd8"
            target                = "661j1oxznamy"
            multi_value_source_id = "h3z7hscsvk"
          }
          position = {
            x = 64
            y = 172
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "l2mmvw3cne" = {
          data = {
            id     = "l2mmvw3cne"
            source = "76idohn5ig8q"
            target = "9723cgh3bwry"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "loehji23vu" = {
          data = {
            id     = "loehji23vu"
            source = "98ib12ufdt7k"
            target = "4625xikwhn3s"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "lqv18m6yr7" = {
          data = {
            id     = "lqv18m6yr7"
            source = "127tqiptvfr89"
            target = "13522yp535mae"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "m24vzwg573" = {
          data = {
            id     = "m24vzwg573"
            source = "1330xk4f74cqh"
            target = "62458jb4gdgj"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "m5lwzkmgb6" = {
          data = {
            id     = "m5lwzkmgb6"
            source = "784p61imaicj"
            target = "302mb91yyrd8"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "mi547qeusw" = {
          data = {
            id                    = "mi547qeusw"
            source                = "68083z3rmd1g"
            target                = "4095z7mw8wqj"
            multi_value_source_id = "u33rmdxlf0"
          }
          position = {
            x = 64
            y = 132
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "mi683ie1pe" = {
          data = {
            id                    = "mi683ie1pe"
            source                = "4625xikwhn3s"
            target                = "50fkgzzvjim4"
            multi_value_source_id = "gnhanaojdb"
          }
          position = {
            x = 64
            y = 52
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "n45nin7r9c" = {
          data = {
            id     = "n45nin7r9c"
            source = "56ah6u1ff558"
            target = "670tnq37pnno"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "o303nlcxqg" = {
          data = {
            id                    = "o303nlcxqg"
            source                = "880d9jvouoil"
            target                = "128fcqsh3yjn7"
            multi_value_source_id = "a61xjavs72"
          }
          position = {
            x = 64
            y = 92
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "obthytzyr9" = {
          data = {
            id                    = "obthytzyr9"
            source                = "68083z3rmd1g"
            target                = "12dxzmcdr8zz"
            multi_value_source_id = "7tram6ohpq"
          }
          position = {
            x = 64
            y = 52
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "ok0z9pb0ie" = {
          data = {
            id     = "ok0z9pb0ie"
            source = "281r342mj94r"
            target = "784p61imaicj"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "pb88ybmd4s" = {
          data = {
            id     = "pb88ybmd4s"
            source = "661j1oxznamy"
            target = "570k1nlg79ew"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "qb31qi3vyn" = {
          data = {
            id                    = "qb31qi3vyn"
            source                = "1311d35vsyxfq"
            target                = "112p7nypm5zxc"
            multi_value_source_id = "kltwjkw7zh"
          }
          position = {
            x = 64
            y = 172
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "qxj8nf9nwy" = {
          data = {
            id     = "qxj8nf9nwy"
            source = "48hul4x29daz"
            target = "102103ezou4o0"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "r3ooqs7aum" = {
          data = {
            id     = "r3ooqs7aum"
            source = "15rfw49nkyop"
            target = "3922ji3wj5mv"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "rjtvq54r2a" = {
          data = {
            id                    = "rjtvq54r2a"
            source                = "1311d35vsyxfq"
            target                = "38w027xus9pu"
            multi_value_source_id = "ou3ctvg0d6"
          }
          position = {
            x = 64
            y = 92
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "rqabpox82u" = {
          data = {
            id     = "rqabpox82u"
            source = "112p7nypm5zxc"
            target = "13611j3abj6ag"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "rszp7nyoo2" = {
          data = {
            id     = "rszp7nyoo2"
            source = "531a2xxpv6b6"
            target = "99haajkp5akm"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "sg7ip89czu" = {
          data = {
            id                    = "sg7ip89czu"
            source                = "2415dl8522ou"
            target                = "134r7s7stqt7h"
            multi_value_source_id = "2e4beng4ai"
          }
          position = {
            x = 64
            y = 132
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "sur0keq3xa" = {
          data = {
            id     = "sur0keq3xa"
            source = "87mwa98kpp4w"
            target = "1002qtq630wh6"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "t2fh0yhx3s" = {
          data = {
            id     = "t2fh0yhx3s"
            source = "1141v0zyvofmz"
            target = "34plai6cg85z"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "teh6dctp31" = {
          data = {
            id     = "teh6dctp31"
            source = "142flhhsetjou"
            target = "911savvkq9u2"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "tiv6ntqpzy" = {
          data = {
            id                    = "tiv6ntqpzy"
            source                = "1002qtq630wh6"
            target                = "924yekxqpfm9"
            multi_value_source_id = "22l4g6kfrv"
          }
          position = {
            x = 64
            y = 52
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "tm1zzsamqn" = {
          data = {
            id     = "tm1zzsamqn"
            source = "133vlqwq39h6"
            target = "2318975qbjaz"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "tpim3fvviu" = {
          data = {
            id                    = "tpim3fvviu"
            source                = "4625xikwhn3s"
            target                = "61tomg6cge48"
            multi_value_source_id = "2xcmuuknbf"
          }
          position = {
            x = 64
            y = 92
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "tsjrnpi3tb" = {
          data = {
            id                    = "tsjrnpi3tb"
            source                = "1211diz9vpjjr"
            target                = "127tqiptvfr89"
            multi_value_source_id = "m1461zfkeb"
          }
          position = {
            x = 64
            y = 92
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "tzabdukqr9" = {
          data = {
            id     = "tzabdukqr9"
            source = "93gm5l2y0a1i"
            target = "1476bb7b8a2aw"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "upw5t3xp6a" = {
          data = {
            id     = "upw5t3xp6a"
            source = "34plai6cg85z"
            target = "631yhxy2jqz5"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "voajvdbie8" = {
          data = {
            id     = "voajvdbie8"
            source = "142flhhsetjou"
            target = "641glq8nhi1k"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "vsd55hy5u4" = {
          data = {
            id                    = "vsd55hy5u4"
            source                = "1170ur5bbmask"
            target                = "26qdtc1yivco"
            multi_value_source_id = "txnkgrvla5"
          }
          position = {
            x = 64
            y = 92
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "wjn3u1xkjj" = {
          data = {
            id     = "wjn3u1xkjj"
            source = "1483n8uubc2vp"
            target = "472102zf0ulz"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "wl0mcsyasx" = {
          data = {
            id     = "wl0mcsyasx"
            source = "311y2en1fvf1"
            target = "1099co6nss8oq"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "wl29xp7vyb" = {
          data = {
            id     = "wl29xp7vyb"
            source = "115t6uwbxhn3l"
            target = "0856fq4hnsjf"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "wmu20yfml" = {
          data = {
            id     = "wmu20yfml"
            source = "850adkt6pfx1"
            target = "115t6uwbxhn3l"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "wqn33yr7fx" = {
          data = {
            id                    = "wqn33yr7fx"
            source                = "10320tcwlk7dj"
            target                = "132hv6kk10c0a"
            multi_value_source_id = "rc3c1rmwps"
          }
          position = {
            x = 64
            y = 52
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "wtinggbumn" = {
          data = {
            id     = "wtinggbumn"
            source = "25e4kxhjrnp4"
            target = "580hbny9inpm"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "wvplz677zu" = {
          data = {
            id     = "wvplz677zu"
            source = "84orzyly6iji"
            target = "126n0w1ruorm7"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "x12so0ybhl" = {
          data = {
            id                    = "x12so0ybhl"
            source                = "1392alznw7c0t"
            target                = "454rm3aiy9pt"
            multi_value_source_id = "r6pu5s6thu"
          }
          position = {
            x = 64
            y = 92
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "x5gwn3ihsc" = {
          data = {
            id     = "x5gwn3ihsc"
            source = "1305dnki11bc0"
            target = "4200s7ahm0kv"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "xb6tligy04" = {
          data = {
            id     = "xb6tligy04"
            source = "74fqd7fa8z3d"
            target = "2415dl8522ou"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "xblvum8x8n" = {
          data = {
            id     = "xblvum8x8n"
            source = "7926h2nbue79"
            target = "1305dnki11bc0"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "xn234g7pby" = {
          data = {
            id     = "xn234g7pby"
            source = "1510v8gnkrs8x"
            target = "0301qur02ofs"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "xrgrn7mjdt" = {
          data = {
            id     = "xrgrn7mjdt"
            source = "1500xngg20fg9"
            target = "133vlqwq39h6"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "xs1pnlqbnj" = {
          data = {
            id     = "xs1pnlqbnj"
            source = "3250v1b8pcns"
            target = "1392alznw7c0t"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "y4fest6l9m" = {
          data = {
            id     = "y4fest6l9m"
            source = "890rjurdezwb"
            target = "106wkvg3ocqi0"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "zdd8jzoioc" = {
          data = {
            id                    = "zdd8jzoioc"
            source                = "172n06ehykpz"
            target                = "25e4kxhjrnp4"
            multi_value_source_id = "1hdqqkwjml"
          }
          position = {
            x = 64
            y = 92
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "zedk27t3t7" = {
          data = {
            id                    = "zedk27t3t7"
            source                = "1211diz9vpjjr"
            target                = "05luy2tfa01v"
            multi_value_source_id = "6u2lzd3e9x"
          }
          position = {
            x = 64
            y = 132
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "zq08jvbnw8" = {
          data = {
            id     = "zq08jvbnw8"
            source = "75mpw3034usp"
            target = "9410i8qnyw39"
          }
          position = {
            x = 0
            y = 0
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
        "ztj6v58ye2" = {
          data = {
            id                    = "ztj6v58ye2"
            source                = "1311d35vsyxfq"
            target                = "01x69c93rg74"
            multi_value_source_id = "3ltwo6dsk9"
          }
          position = {
            x = 64
            y = 52
          }
          group      = "edges"
          removed    = false
          selected   = false
          selectable = true
          locked     = false
          grabbable  = true
          pannable   = true
          classes    = ""
        }
      }
    }
    box_selection_enabled = true
    panning_enabled       = true
    user_panning_enabled  = true
    user_zooming_enabled  = true
    zooming_enabled       = true
    zoom                  = 1
    min_zoom              = 1e-50
    max_zoom              = 1e+50
    pan = {
      x = 0
      y = 0
    }
  }

  trigger = {
    type = "AUTHENTICATION"
  }
}


