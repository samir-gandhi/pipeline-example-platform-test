
resource "pingone_davinci_flow" "pingcli__PingOne-0020-Account-0020-Recovery-0020-by-0020-Email" {
  environment_id = var.pingone_environment_id
  name           = "PingOne Account Recovery by Email"
  description    = "Imported on Wed Sep 23 2026 05:31:16 GMT+0000 (Coordinated Universal Time)"
  color          = "#E3F0FF"

  settings = {
    csp                              = "worker-src 'self' blob:; script-src 'self' https://cdn.jsdelivr.net https://code.jquery.com https://devsdk.singularkey.com http://cdnjs.cloudflare.com 'unsafe-inline' 'unsafe-eval';"
    css                              = ".companyLogo {\n    height: 65px;\n}\n\n.icon-padding::before {\n  padding-right: 5px;\n}"
    custom_favicon_link              = "https://assets.pingone.com/ux/ui-library/5.0.2/images/logo-pingidentity.png"
    custom_title                     = "Account Recovery by Email"
    log_level                        = 4
    use_custom_css                   = true
    intermediate_loading_screen_css  = ""
    intermediate_loading_screen_html = ""
    css_links                        = ["https://assets.pingone.com/ux/end-user-nano/0.1.0-alpha.9/end-user-nano.css", "https://assets.pingone.com/ux/astro-nano/0.1.0-alpha.11/icons.css"]
  }

  graph_data = {
    data = jsonencode({})
    renderer = jsonencode({
      "name" : "null"
    })
    elements = {
      nodes = {
        "0bpfvjlfvh" = {
          data = {
            id              = "0bpfvjlfvh"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingcli__Teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "startNode"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "inputSchema" : {
                "value" : "{\n\t\"type\": \"object\",\n\t\"properties\": {\n\t\t\"message\": {\n\t\t\t\"type\": \"string\",\n\t\t\t\"displayName\": \"Message\",\n\t\t\t\"preferredControlType\": \"textField\",\n\t\t\t\"enableParameters\": true,\n\t\t\t\"propertyName\": \"message\"\n\t\t}\n\t}\n}"
              },
              "nodeTitle" : {
                "value" : "Start"
              }
            })
          }
          position = {
            x = 334
            y = 364
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
        "0btbsj8ijk" = {
          data = {
            id              = "0btbsj8ijk"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingcli__Teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "email" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{local.d3gppfo315.payload.output.email}}\",\n        \"tooltip\": \"{{local.d3gppfo315.payload.output.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeInstanceId" : {
                "value" : "v9puwtns1t"
              },
              "nodeTitle" : {
                "value" : "Go to Recover Account By Email"
              }
            })
          }
          position = {
            x = 934
            y = 514
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
        "0jkx2dk119" = {
          data = {
            id              = "0jkx2dk119"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.pingcli__Annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "annotation" : {
                "value" : "PingOne Account Recovery by Email"
              },
              "annotationTextColor" : {
                "value" : "#ffffffff"
              },
              "backgroundColor" : {
                "value" : "#4462edff"
              },
              "cornerRadius" : {
                "value" : 8
              },
              "fontFamily" : {
                "value" : "sans-serif"
              },
              "fontSize" : {
                "value" : 16
              },
              "fontStyle" : {
                "value" : "bold"
              },
              "width" : {
                "value" : 900
              }
            })
          }
          position = {
            x = 214
            y = 274
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
        "0ksm35m5qb" = {
          data = {
            id        = "0ksm35m5qb"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 1650
            y = 1110
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
        "4a669r77c3" = {
          data = {
            id               = "4a669r77c3"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.pingcli__Http.id
            connector_id     = "httpConnector"
            capability_class = "render"
            name             = "Http"
            label            = "Http"
            capability_name  = "customHTMLTemplate"
            type             = "trigger"
            status           = "configured"
            id_unique        = "tcoqrlkb25"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#afd5ffff"
              },
              "customCSS" : {
                "value" : ":root {\n  --animation-dimension: 120px;\n  --animation-start-color: #71e171;\n  --animation-midway-color: #67d067;\n  --animation-finish-color: #59b259;\n}\n\n.checkmark {\n  width: var(--animation-dimension);\n  height: var(--animation-dimension);\n  border-radius: 50%;\n  display: block;\n  stroke-width: 5;\n  stroke: #ffffff;\n  stroke-miterlimit: 10;\n  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);\n  animation: fill 0.4s ease-in-out 0.4s forwards,\n    scale 0.3s ease-in-out 0.9s both;\n}\n\n.checkmarkCircle {\n  stroke-dasharray: 166;\n  stroke-dashoffset: 166;\n  stroke-width: 5;\n  stroke-miterlimit: 10;\n  stroke: var(--animation-finish-color);\n  fill: none;\n  animation: stroke 0.6s cubic-bezier(0.65, 0, 0.45, 1) forwards,\n    colorChange 1.2s ease-in-out forwards;\n}\n\n.checkmarkCheck {\n  transform-origin: 50% 50%;\n  stroke-dasharray: 48;\n  stroke-dashoffset: 48;\n  animation: stroke 0.3s cubic-bezier(0.65, 0, 0.45, 1) 0.8s forwards,\n    colorChange 0.6s ease-in-out 0.8s forwards;\n}\n\n@keyframes colorChange {\n  0% {\n    stroke: var(--animation-start-color);\n  }\n  50% {\n    stroke: var(--animation-midway-color);\n  } \n  100% {\n    stroke: var(--animation-finish-color);\n  }\n}\n\n@keyframes stroke {\n  100% {\n    stroke-dashoffset: 0;\n  }\n}\n@keyframes scale {\n  0%,\n  100% {\n    transform: none;\n  }\n  50% {\n    transform: scale3d(1.1, 1.1, 1);\n  }\n  70% {\n    transform: scale3d(0.98, 0.98, 1);\n  }\n  85% {\n    transform: scale3d(1.02, 1.02, 1);\n  }\n}\n@keyframes fill {\n  100% {\n    box-shadow: inset 0px 0px 0px 0px var(--animation-finish-color);\n  }\n}"
              },
              "customHTML" : {
                "value" : "\u003cdiv class=\"end-user-nano\"\u003e\n    \u003cdiv\n        class=\"bg-light d-flex flex-column justify-content-center align-items-center position-absolute top-0 start-0 bottom-0 end-0 overflow-auto\"\u003e\n        \u003cdiv style=\"max-width: 400px; min-width: 400px; width: 100%\"\u003e\n            \u003cdiv class=\"card shadow mb-5\"\u003e\n                \u003cdiv class=\"card-body p-5 d-flex flex-column\"\u003e\n                    \u003cimg class=\"companyLogo align-self-center mb-5\" src=\"{{global.variables.companyLogo}}\" alt=\"{{global.variables.companyName}}\" /\u003e\n\n                    {{#if title}}\n                    \u003ch1 class=\"text-center mb-4\"\u003e{{title}}\u003c/h1\u003e\n                    {{/if}}\n\n                    \u003cdiv class=\"mx-auto mt-3 mb-4\"\u003e\n                        \u003csvg class=\"checkmark\" xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 52 52\"\u003e\n                            \u003ccircle class=\"checkmarkCircle\" cx=\"26\" cy=\"26\" r=\"25\" fill=\"none\" /\u003e\n                            \u003cpath class=\"checkmarkCheck\" fill=\"none\" d=\"M14.1 27.2l7.1 7.2 16.7-16.8\" /\u003e\n                        \u003c/svg\u003e\n                    \u003c/div\u003e\n\n                    {{#if textOne}}\n                    \u003cp class=\"text-muted text-center\"\u003e{{textOne}}\u003c/p\u003e\n                    {{/if}}\n\n                    {{#if textTwo}}\n                    \u003cp class=\"text-muted text-center\"\u003e{{textTwo}}\u003c/p\u003e\n                    {{/if}}\n                \u003c/div\u003e\n            \u003c/div\u003e\n        \u003c/div\u003e\n    \u003c/div\u003e\n\u003c/div\u003e"
              },
              "customScript" : {},
              "formFieldsList" : {
                "value" : [
                  {
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "buttonValue"
                  }
                ]
              },
              "inputSchema" : {
                "value" : "{\n  \"type\": \"object\",\n  \"properties\": {\n    \"title\": {\n      \"type\": \"string\",\n      \"displayName\": \"Title\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    },\n    \"textOne\": {\n      \"type\": \"string\",\n      \"displayName\": \"Text One\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    },\n    \"textTwo\": {\n      \"type\": \"string\",\n      \"displayName\": \"Text Two\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    }\n  }\n}"
              },
              "nodeDescription" : {
                "value" : "Success Message With Animated Checkmark"
              },
              "nodeTitle" : {
                "value" : "Password Reset Success"
              },
              "oeInteractionCacheExpire" : {
                "value" : true
              },
              "textOne" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Your password has been successfully updated.\"\n      }\n    ]\n  }\n]"
              },
              "title" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Success\"\n      }\n    ]\n  }\n]"
              },
              "validationRules" : {
                "value" : []
              }
            })
          }
          position = {
            x = 2730
            y = 930
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
        "4awm7e93pi" = {
          data = {
            id              = "4awm7e93pi"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingcli__Teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "nodeInstanceId" : {
                "value" : "0bpfvjlfvh"
              },
              "nodeTitle" : {
                "value" : "Go to Start"
              }
            })
          }
          position = {
            x = 1830
            y = 1260
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
        "5y2rv1bm60" = {
          data = {
            id              = "5y2rv1bm60"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.pingcli__Annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            id_unique       = "o2v5xhdcbc"
            properties = jsonencode({
              "annotation" : {
                "value" : "Last Updated: August 19th, 2024"
              },
              "annotationTextColor" : {
                "value" : "#000000"
              },
              "backgroundColor" : {
                "value" : "#ffffffff"
              },
              "cornerRadius" : {
                "value" : 8
              },
              "fontFamily" : {
                "value" : "sans-serif"
              },
              "fontSize" : {
                "value" : 14
              },
              "strokeColor" : {
                "value" : "#181818ff"
              },
              "strokeEnabled" : {
                "value" : false
              },
              "strokeWidth" : {
                "value" : 1
              },
              "width" : {
                "value" : 240
              }
            })
          }
          position = {
            x = 214
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
        "6geqqycejl" = {
          data = {
            id        = "6geqqycejl"
            node_type = "EVAL"
          }
          position = {
            x = 1650
            y = 930
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
        "7e8jehllq9" = {
          data = {
            id              = "7e8jehllq9"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingcli__Teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "nodeInstanceId" : {
                "value" : "mmzegoy7gw"
              },
              "nodeTitle" : {
                "value" : "Go to Recover Account By Email"
              },
              "resendMessage" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Recovery passcode resent\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 1830
            y = 1110
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
        "9pkno982vy" = {
          data = {
            id              = "9pkno982vy"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingcli__PingOne.id
            connector_id    = "pingOneSSOConnector"
            name            = "PingOne"
            label           = "pingOneSSOConnector"
            capability_name = "recoverPassword"
            type            = "action"
            status          = "configured"
            id_unique       = "nezyzu3twg"
            properties = jsonencode({
              "identifier" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"id\",\n        \"data\": \"{{local.v9adm9ez5d.payload.output.matchedUser.id}}\",\n        \"tooltip\": \"{{local.v9adm9ez5d.payload.output.matchedUser.id}}\",\n        \"children\": [\n          {\n            \"text\": \"id\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "matchAttribute" : {
                "value" : "id"
              },
              "matchAttributes" : {
                "value" : [
                  "username",
                  "email"
                ]
              },
              "newPassword" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"newPassword\",\n        \"data\": \"{{local.vfdw439zp2.payload.output.newPassword}}\",\n        \"tooltip\": \"{{local.vfdw439zp2.payload.output.newPassword}}\",\n        \"children\": [\n          {\n            \"text\": \"newPassword\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeDescription" : {},
              "nodeTitle" : {
                "value" : "Validates code and update password"
              },
              "recoverPassword_localizedErrors" : {
                "properties" : {
                  "en" : {
                    "value" : [
                      {
                        "key" : "unexpectedError",
                        "value" : ""
                      },
                      {
                        "key" : "notFound",
                        "value" : ""
                      },
                      {
                        "key" : "accessFailed",
                        "value" : ""
                      },
                      {
                        "key" : "constraintViolation",
                        "value" : ""
                      },
                      {
                        "key" : "invalidValue",
                        "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Invalid recovery code\"\n      }\n    ]\n  }\n]"
                      },
                      {
                        "key" : "invalidFilter",
                        "value" : ""
                      },
                      {
                        "key" : "noUserMatch",
                        "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                      },
                      {
                        "key" : "accountNotUsable",
                        "value" : ""
                      }
                    ]
                  }
                }
              },
              "recoveryCode" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"recoveryCode\",\n        \"data\": \"{{local.vfdw439zp2.payload.output.recoveryCode}}\",\n        \"tooltip\": \"{{local.vfdw439zp2.payload.output.recoveryCode}}\",\n        \"children\": [\n          {\n            \"text\": \"recoveryCode\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "userIdentifierForFindUser" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"username\",\n        \"data\": \"{{local.1teos2506v.payload.output.username}}\",\n        \"tooltip\": \"{{local.1teos2506v.payload.output.username}}\",\n        \"children\": [\n          {\n            \"text\": \"username\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 2430
            y = 930
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
        "acknzwphjw" = {
          data = {
            id               = "acknzwphjw"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.pingcli__Functions.id
            connector_id     = "functionsConnector"
            capability_class = "backend"
            name             = "Functions"
            label            = "Functions"
            capability_name  = "customFunction"
            type             = "trigger"
            status           = "configured"
            properties = jsonencode({
              "code" : {
                "value" : "// Test to ensure passwords match\nmodule.exports = a = async ({ params }) =\u003e {\n\tconst newPassword = params.newPassword;\n\tconst verifyNewPassword = params.verifyNewPassword;\n\n\tif (!newPassword || !verifyNewPassword || (newPassword !== verifyNewPassword)) {\n\t\treturn false;\n\t}\n\n\treturn { \"success\": true};\n}"
              },
              "nodeDescription" : {
                "value" : "Verify New Passwords Match Before Setting"
              },
              "nodeTitle" : {
                "value" : "Verify Passwords Match"
              },
              "outputSchema" : {
                "value" : "{\n\t\"output\": {\n\t\t\"type\": \"object\",\n\t\t\"properties\": {\n\t\t\t\"success\": {\n\t\t\t\t\"type\": \"string\"\n\t\t\t}\n\t\t}\n\t}\n}"
              },
              "variableInputList" : {
                "value" : [
                  {
                    "name" : "newPassword",
                    "preferredDataType" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"newPassword\",\n        \"data\": \"{{local.vfdw439zp2.payload.output.newPassword}}\",\n        \"tooltip\": \"{{local.vfdw439zp2.payload.output.newPassword}}\",\n        \"children\": [\n          {\n            \"text\": \"newPassword\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "name" : "verifyNewPassword",
                    "preferredDataType" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"verifyNewPassword\",\n        \"data\": \"{{local.vfdw439zp2.payload.output.verifyNewPassword}}\",\n        \"tooltip\": \"{{local.vfdw439zp2.payload.output.verifyNewPassword}}\",\n        \"children\": [\n          {\n            \"text\": \"verifyNewPassword\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 1830
            y = 930
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
        "autvsbla1a" = {
          data = {
            id               = "autvsbla1a"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.pingcli__Functions.id
            connector_id     = "functionsConnector"
            capability_class = "backend"
            name             = "Functions"
            label            = "Functions"
            capability_name  = "AEqualsMultipleB"
            type             = "trigger"
            status           = "configured"
            id_unique        = "liwkdm3vgm"
            properties = jsonencode({
              "leftValueA" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"buttonValue\",\n        \"data\": \"{{local.vfdw439zp2.payload.output.buttonValue}}\",\n        \"tooltip\": \"{{local.vfdw439zp2.payload.output.buttonValue}}\",\n        \"children\": [\n          {\n            \"text\": \"buttonValue\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeDescription" : {
                "value" : "Check Which Button Was Clicked"
              },
              "nodeTitle" : {
                "value" : "Password Recovery Button Action"
              },
              "rightValueB" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"submit\"\n      }\n    ]\n  }\n]"
              },
              "rightValueMultiple" : {
                "value" : [
                  {
                    "id" : "vgii63uk2p",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"UPDATE\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "id" : "3a7tpbhtep",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"RESEND\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "id" : "j2d7ax008r",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"CANCEL\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 1530
            y = 930
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
        "b5c3emwd8q" = {
          data = {
            id        = "b5c3emwd8q"
            node_type = "EVAL"
            label     = "Evaluator"
            properties = jsonencode({
              "emqskruuft" : {
                "value" : "anyTriggersFalse"
              },
              "undefined" : {
                "value" : "anyTriggersFalse"
              }
            })
          }
          position = {
            x = 2250
            y = 930
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
        "d3gppfo315" = {
          data = {
            id               = "d3gppfo315"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.pingcli__Http.id
            connector_id     = "httpConnector"
            capability_class = "render"
            name             = "Http"
            label            = "Http"
            capability_name  = "customHTMLTemplate"
            type             = "trigger"
            status           = "configured"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#afd5ffff"
              },
              "continueButtonLabel" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Continue\"\n      }\n    ]\n  }\n]"
              },
              "customCSS" : {
                "value" : "@keyframes fadeOut {\n    0% {\n        opacity: 1;\n        visibility: visible;\n    }\n    80% {\n        opacity: .8;\n        visibility: visible;\n    }\n\n    100% {\n        opacity: 0;\n        visibility: hidden;\n        max-height: 0;\n    }\n}\n\n.fade {\n    overflow: hidden;\n    animation: fadeOut 20s forwards;\n}"
              },
              "customHTML" : {
                "value" : "\u003cdiv class=\"end-user-nano\"\u003e\n  \u003cdiv\n    class=\"bg-light d-flex flex-column justify-content-center align-items-center position-absolute top-0 start-0 bottom-0 end-0 overflow-auto\"\u003e\n    \u003cdiv style=\"max-width: 400px; min-width: 400px; width: 100%\"\u003e\n      \u003cdiv class=\"card shadow mb-5\"\u003e\n        \u003cmain aria-labelledby=\"title\"\u003e\n          \u003cdiv class=\"card-body p-5 d-flex flex-column\"\u003e\n            \u003cimg class=\"companyLogo align-self-center mb-5\" src=\"{{global.variables.companyLogo}}\" alt=\"{{global.variables.companyName}}\"\u003e\n\n            {{#if title}}\n            \u003ch1 id=\"title\" class=\"text-center mb-4\"\u003e{{title}}\u003c/h1\u003e\n            {{/if}}\n\n            {{#if textOne}}\n            \u003cp class=\"text-muted text-center\"\u003e{{textOne}}\u003c/p\u003e\n            {{/if}}\n\n            {{#if textTwo}}\n            \u003cp class=\"text-muted text-center\"\u003e{{textTwo}}\u003c/p\u003e\n            {{/if}}\n\n            \u003c!-- Generic Error Message --\u003e\n            \u003cp class=\"text-danger mdi mdi-alert-circle text-center icon-padding\" id=\"feedbackError\" data-id=\"feedback\"\n              data-skcomponent=\"skerror\" aria-live=\"assertive\"\u003e\u003c/p\u003e\n\n            \u003c!-- Field Validation Error Messages --\u003e\n            \u003cp class=\"text-danger mdi mdi-alert-circle text-center icon-padding\" id=\"emailError\" data-skerrorid=\"email\"\n              data-skcomponent=\"skerrormessage\" aria-live=\"assertive\"\u003e\u003c/p\u003e\n            \u003cp class=\"text-danger mdi mdi-alert-circle text-center icon-padding\" id=\"passwordError\" data-skerrorid=\"password\"\n              data-skcomponent=\"skerrormessage\" aria-live=\"assertive\"\u003e\u003c/p\u003e\n\n            {{#if userMessage}}\n            \u003cp class=\"text-info text-center fade\" aria-live=\"assertive\"\u003e{{userMessage}}\u003c/p\u003e\n            {{/if}}\n\n            \u003cform id=\"emailForm\" aria-labelledby=\"title\" data-id=\"emailForm\"\u003e\n              \u003cdiv class=\"mb-4 form-floating\"\u003e\n                \u003cinput class=\"form-control\" type=\"email\" id=\"email\" name=\"email\" placeholder=\"Email Address\"\n                  autocomplete=\"email\" value=\"\" data-id=\"email-input\" aria-required=\"true\"\n                  aria-describedby=\"emailLabel\" /\u003e\n                \u003clabel id=\"emailLabel\" for=\"email\"\u003eEmail Address\u003c/label\u003e\n              \u003c/div\u003e\n              \u003cdiv class=\"d-flex flex-column\"\u003e\n                {{#if continueButtonLabel}}\n                \u003cbutton data-id=\"button\" type=\"submit\" class=\"btn btn-primary mb-3\" data-skcomponent=\"skbutton\"\n                  data-skbuttontype=\"form-submit\" id=\"btnContinue\" data-skform=\"emailForm\"\n                  data-skbuttonvalue=\"CONTINUE\"\u003e\n                  {{continueButtonLabel}}\n                \u003c/button\u003e\n                {{/if}}\n              \u003c/div\u003e\n            \u003c/form\u003e\n          \u003c/div\u003e\n        \u003c/main\u003e\n      \u003c/div\u003e\n    \u003c/div\u003e\n  \u003c/div\u003e\n\u003c/div\u003e\n"
              },
              "customScript" : {
                "value" : "const setFieldFocus = (id) =\u003e {\n    const element = document.getElementById(id);\n    if (element) {\n        element.focus();\n    }\n}\n\nconst start = () =\u003e {\n    setFieldFocus(\"email\")\n}\n\nif (document.readyState === \"loading\") {\n    // Loading hasn't finished yet\n    document.addEventListener(\"DOMContentLoaded\", start);\n} else {\n    // `DOMContentLoaded` has already fired\n    start();\n}"
              },
              "formFieldsList" : {
                "value" : [
                  {
                    "displayName" : "Email Address",
                    "hashedVisibility" : false,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "email",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "buttonValue"
                  }
                ]
              },
              "inputSchema" : {
                "value" : "{\n  \"type\": \"object\",\n  \"properties\": {\n    \"title\": {\n      \"type\": \"string\",\n      \"displayName\": \"Title\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    },\n    \"textOne\": {\n      \"type\": \"string\",\n      \"displayName\": \"Text One\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    },\n    \"textTwo\": {\n      \"type\": \"string\",\n      \"displayName\": \"Text Two\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    },\n    \"userMessage\": {\n      \"type\": \"string\",\n      \"displayName\": \"User Message\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    },\n    \"continueButtonLabel\": {\n      \"type\": \"string\",\n      \"displayName\": \"Continue Button Label\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    }\n  }\n}"
              },
              "nodeDescription" : {
                "value" : "Prompt for email address"
              },
              "nodeTitle" : {
                "value" : "User Identifier Form"
              },
              "outputSchema" : {
                "value" : {}
              },
              "textOne" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Enter your email address to receive a recovery code that will let you change your password.\"\n      }\n    ]\n  }\n]"
              },
              "title" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Recover Your Account\"\n      }\n    ]\n  }\n]"
              },
              "userMessage" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"teleport.svg\",\n        \"url\": \"message\",\n        \"data\": \"{{local.0bpfvjlfvh.payload.output.message}}\",\n        \"tooltip\": \"{{local.0bpfvjlfvh.payload.output.message}}\",\n        \"children\": [\n          {\n            \"text\": \"message\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "validationRules" : {
                "value" : [
                  {
                    "propertyName" : "email",
                    "rules" : [
                      {
                        "message" : "Enter your email address",
                        "ruleName" : "presence"
                      },
                      {
                        "message" : "Enter a valid email address",
                        "ruleName" : "email"
                      }
                    ]
                  }
                ]
              }
            })
          }
          position = {
            x = 634
            y = 514
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
        "emqskruuft" = {
          data = {
            id               = "emqskruuft"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.pingcli__Error-0020-Message.id
            connector_id     = "errorConnector"
            capability_class = "backend"
            name             = "Error Message"
            label            = "Error Customize"
            capability_name  = "customErrorMessage"
            type             = "action"
            status           = "configured"
            id_unique        = "8am3fknso1"
            properties = jsonencode({
              "errorCode" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"httpResponseCode\",\n        \"data\": \"{{local.fe51hat32b.payload.error.httpResponseCode}}\",\n        \"tooltip\": \"{{local.fe51hat32b.payload.error.httpResponseCode}}\",\n        \"children\": [\n          {\n            \"text\": \"httpResponseCode\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "errorDescription" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "errorMessage" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Invalid recovery code and/or password\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeDescription" : {},
              "nodeTitle" : {
                "value" : "Passcode mismatch or new password violation"
              }
            })
          }
          position = {
            x = 2730
            y = 1110
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
        "finrx3k4j3" = {
          data = {
            id        = "finrx3k4j3"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 1650
            y = 1260
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
        "gu8aplq3ou" = {
          data = {
            id        = "gu8aplq3ou"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 450
            y = 930
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
        "hi7kk8r9qk" = {
          data = {
            id              = "hi7kk8r9qk"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.pingcli__Annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "annotation" : {
                "value" : "Forgot Password"
              },
              "annotationTextColor" : {
                "value" : "#ffffffff"
              },
              "backgroundColor" : {
                "value" : "#5D00D6ff"
              },
              "cornerRadius" : {
                "value" : 8
              },
              "fontFamily" : {
                "value" : "sans-serif"
              },
              "fontSize" : {
                "value" : 14
              },
              "fontStyle" : {
                "value" : "bold"
              },
              "width" : {
                "value" : 2600
              }
            })
          }
          position = {
            x = 239
            y = 732
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
        "hoy0v6fkrb" = {
          data = {
            id               = "hoy0v6fkrb"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.pingcli__Functions.id
            connector_id     = "functionsConnector"
            capability_class = "backend"
            name             = "Functions"
            label            = "Functions"
            capability_name  = "customFunction"
            type             = "trigger"
            status           = "configured"
            id_unique        = "sxnpkmd89m"
            properties = jsonencode({
              "code" : {
                "value" : "module.exports = a = async ({params}) =\u003e {\n\tconst { p1UserId } = params;\n\n\tif (!p1UserId) {\n\t\treturn false;\n\t}\n\n\treturn \n}"
              },
              "nodeDescription" : {
                "value" : "Check If P1 User Exists"
              },
              "nodeTitle" : {
                "value" : "Verify User Found"
              },
              "variableInputList" : {
                "value" : [
                  {
                    "name" : "p1UserId",
                    "preferredDataType" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"id\",\n        \"data\": \"{{local.v9adm9ez5d.payload.output.matchedUser.id}}\",\n        \"tooltip\": \"{{local.v9adm9ez5d.payload.output.matchedUser.id}}\",\n        \"children\": [\n          {\n            \"text\": \"id\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 2130
            y = 930
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
        "j9siq0mzgn" = {
          data = {
            id        = "j9siq0mzgn"
            node_type = "EVAL"
          }
          position = {
            x = 754
            y = 514
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
        "kj7dlai63b" = {
          data = {
            id        = "kj7dlai63b"
            node_type = "EVAL"
          }
          position = {
            x = 454
            y = 364
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
        "m9l9y9m4jw" = {
          data = {
            id              = "m9l9y9m4jw"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingcli__PingOne.id
            connector_id    = "pingOneSSOConnector"
            name            = "PingOne"
            label           = "PingOne"
            capability_name = "sendRecoveryCode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "identifier" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"id\",\n        \"data\": \"{{local.v9adm9ez5d.payload.output.matchedUser.id}}\",\n        \"tooltip\": \"{{local.v9adm9ez5d.payload.output.matchedUser.id}}\",\n        \"children\": [\n          {\n            \"text\": \"id\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeTitle" : {
                "value" : "Send Recovery Code"
              }
            })
          }
          position = {
            x = 930
            y = 930
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
        "mgyrsc3iyb" = {
          data = {
            id        = "mgyrsc3iyb"
            node_type = "EVAL"
          }
          position = {
            x = 454
            y = 514
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
        "mmzegoy7gw" = {
          data = {
            id              = "mmzegoy7gw"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingcli__Teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "startNode"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "inputSchema" : {
                "value" : "{\n\t\"type\": \"object\",\n\t\"properties\": {\n\t\t\"resendMessage\": {\n\t\t\t\"type\": \"string\",\n\t\t\t\"displayName\": \"Resend Message\",\n\t\t\t\"preferredControlType\": \"textField\",\n\t\t\t\"enableParameters\": true,\n\t\t\t\"propertyName\": \"resendMessage\"\n\t\t}\n\t}\n}"
              },
              "nodeTitle" : {
                "value" : "Resend Recovery"
              }
            })
          }
          position = {
            x = 630
            y = 1080
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
        "omlw87ycb5" = {
          data = {
            id        = "omlw87ycb5"
            node_type = "EVAL"
          }
          position = {
            x = 1350
            y = 930
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
        "pbv7legq3o" = {
          data = {
            id              = "pbv7legq3o"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.pingcli__Annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            id_unique       = "940rm8qjb1"
            properties = jsonencode({
              "annotation" : {
                "value" : "Input Schema: email"
              },
              "annotationTextColor" : {
                "value" : "#000000"
              },
              "backgroundColor" : {
                "value" : "#f7f7adff"
              },
              "cornerRadius" : {
                "value" : 8
              },
              "fontFamily" : {
                "value" : "sans-serif"
              },
              "fontSize" : {
                "value" : 14
              },
              "strokeColor" : {
                "value" : "#181818ff"
              },
              "strokeEnabled" : {
                "value" : false
              },
              "strokeWidth" : {
                "value" : 1
              },
              "width" : {
                "value" : 400
              }
            })
          }
          position = {
            x = 239
            y = 792
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
        "qllc4q0rvz" = {
          data = {
            id        = "qllc4q0rvz"
            node_type = "EVAL"
            properties = jsonencode({
              "m9l9y9m4jw" : {
                "value" : "always"
              },
              "undefined" : {
                "value" : "always"
              }
            })
          }
          position = {
            x = 750
            y = 930
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
        "uvr5vj2oqi" = {
          data = {
            id        = "uvr5vj2oqi"
            node_type = "EVAL"
            properties = jsonencode({
              "emqskruuft" : {
                "value" : "anyTriggersFalse"
              }
            })
          }
          position = {
            x = 2550
            y = 930
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
        "v9adm9ez5d" = {
          data = {
            id              = "v9adm9ez5d"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingcli__PingOne.id
            connector_id    = "pingOneSSOConnector"
            name            = "PingOne"
            label           = "PingOne"
            capability_name = "userLookup"
            type            = "action"
            status          = "configured"
            id_unique       = "576fmtfv7p"
            properties = jsonencode({
              "matchAttributes" : {
                "value" : [
                  "email"
                ]
              },
              "nodeTitle" : {
                "value" : "Lookup User"
              },
              "userIdentifierForFindUser" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"teleport.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{local.v9puwtns1t.payload.output.email}}\",\n        \"tooltip\": \"{{local.v9puwtns1t.payload.output.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 630
            y = 930
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
        "v9puwtns1t" = {
          data = {
            id              = "v9puwtns1t"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingcli__Teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "startNode"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "inputSchema" : {
                "value" : "{\n\t\"type\": \"object\",\n\t\"properties\": {\n\t\t\"email\": {\n\t\t\t\"type\": \"string\",\n\t\t\t\"displayName\": \"Email Address\",\n\t\t\t\"preferredControlType\": \"textField\",\n\t\t\t\"enableParameters\": true,\n\t\t\t\"propertyName\": \"email\"\n\t\t}\n\t}\n}"
              },
              "nodeTitle" : {
                "value" : "Forgot Password"
              }
            })
          }
          position = {
            x = 330
            y = 930
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
        "vfdw439zp2" = {
          data = {
            id               = "vfdw439zp2"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.pingcli__Http.id
            connector_id     = "httpConnector"
            capability_class = "render"
            name             = "Http"
            label            = "Http"
            capability_name  = "customHTMLTemplate"
            type             = "trigger"
            status           = "configured"
            id_unique        = "ao8b3p5f11"
            properties = jsonencode({
              "buttonText" : {
                "value" : null
              },
              "cancelButtonLabel" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Cancel\"\n      }\n    ]\n  }\n]"
              },
              "continueButtonLabel" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Continue\"\n      }\n    ]\n  }\n]"
              },
              "customCSS" : {},
              "customHTML" : {
                "value" : "\u003cdiv class=\"end-user-nano\"\u003e\n  \u003cdiv\n    class=\"bg-light d-flex flex-column justify-content-center align-items-center position-absolute top-0 start-0 bottom-0 end-0 overflow-auto\"\u003e\n    \u003cdiv style=\"max-width: 400px; min-width: 400px; width: 100%\"\u003e\n      \u003cdiv class=\"card shadow mb-5\"\u003e\n        \u003cmain aria-labelledby=\"title\"\u003e\n          \u003cdiv class=\"card-body p-5 d-flex flex-column\"\u003e\n            \u003cimg class=\"companyLogo align-self-center mb-5\" src=\"{{global.variables.companyLogo}}\" alt=\"{{global.variables.companyName}}\" /\u003e\n\n            {{#if title}}\n            \u003ch1 id=\"title\" class=\"text-center mb-4\"\u003e{{title}}\u003c/h1\u003e\n            {{/if}}\n\n            {{#if textOne}}\n            \u003cp class=\"text-muted text-center\"\u003e{{textOne}}\u003c/p\u003e\n            {{/if}}\n\n            \u003c!-- Generic Error Message --\u003e\n            \u003cp class=\"text-danger mdi mdi-alert-circle text-center icon-padding\" data-id=\"feedback\" data-skcomponent=\"skerror\"\n              aria-live=\"assertive\"\u003e\u003c/p\u003e\n\n            \u003c!-- Field Validation Error Messages --\u003e\n            \u003cp class=\"text-danger mdi mdi-alert-circle text-center icon-padding\" data-skerrorid=\"recoveryCode\"\n              data-skcomponent=\"skerrormessage\" aria-live=\"assertive\"\u003e\u003c/p\u003e\n            \u003cp class=\"text-danger mdi mdi-alert-circle text-center icon-padding\" data-skerrorid=\"newPassword\"\n              data-skcomponent=\"skerrormessage\" aria-live=\"assertive\"\u003e\u003c/p\u003e\n            \u003cp class=\"text-danger mdi mdi-alert-circle text-center icon-padding\" data-skerrorid=\"verifyNewPassword\"\n              data-skcomponent=\"skerrormessage\" aria-live=\"assertive\"\u003e\u003c/p\u003e\n\n            \u003cp id=\"resendMessage\" class=\"text-success mdi mdi-check-circle text-center\"  \n              style=\"display: {{#if resendMessage}} block; {{else}} none; {{/if}}\"aria-live=\"assertive\"\u003e\n              \u003cspan class=\"ms-2\"\u003e{{resendMessage}}\u003c/span\u003e\u003c/p\u003e\n\n            \u003cform id=\"recoveryCodeForm\" data-id=\"recoveryCodeForm\"\u003e\n              \u003cdiv class=\"mb-4 form-floating\"\u003e\n                \u003cinput id=\"recoveryCode\" data-id=\"recoveryCode\" class=\"form-control\" type=\"text\" name=\"recoveryCode\"\n                    placeholder=\"Recovery Code\" autocomplete=\"one-time-code\" aria-describedby=\"recoveryCodeLabel\" /\u003e\n                \u003clabel id=\"recoveryCodeLabel\" data-id=\"recoveryCodeLabel\" class=\"form-label\" for=\"recoveryCode\"\u003e\n                    Recovery Code\n                  \u003c/label\u003e\n              \u003c/div\u003e\n              \u003cdiv id=\"newPasswordContainer\" class=\"mb-4 form-floating\"\u003e\n                \u003cinput id=\"newPassword\" data-id=\"newPassword\" class=\"form-control\" type=\"password\" name=\"newPassword\"\n                    placeholder=\"New Password\" autocomplete=\"new-password\" aria-describedby=\"newPasswordLabel\" /\u003e\n                \u003clabel id=\"newPasswordLabel\" data-id=\"newPasswordLabel\" class=\"form-label\" for=\"newPassword\"\u003e\n                    New Password\n                  \u003c/label\u003e\n              \u003c/div\u003e\n              \u003cdiv id=\"verifyPasswordContainer\" class=\"mb-4 form-floating\"\u003e\n                \u003cinput id=\"verifyNewPassword\" data-id=\"verifyNewPassword\" class=\"form-control\" type=\"password\"\n                    name=\"verifyNewPassword\" placeholder=\"Verify New Password\" autocomplete=\"new-password\"\n                    aria-describedby=\"verifyNewPasswordLabel\" /\u003e\n                \u003clabel id=\"verifyNewPasswordLabel\" class=\"form-label\" for=\"verifyNewPassword\"\u003eVerify New\n                    Password\u003c/label\u003e\n              \u003c/div\u003e\n              \u003cdiv class=\"d-flex flex-column\"\u003e\n                {{#if continueButtonLabel}}\n                \u003cbutton id=\"submitBtn\" data-id=\"submitBtn\" class=\"btn btn-primary mb-3\" data-skcomponent=\"skbutton\"\n                    data-skbuttontype=\"form-submit\" data-skform=\"recoveryCodeForm\" data-skbuttonvalue=\"UPDATE\"\u003e\n                    {{continueButtonLabel}}\n                \u003c/button\u003e\n                {{/if}}\n                {{#if resendButtonLabel}}\n                \u003cbutton id=\"resendBtn\" class=\"btn btn-link\" data-skcomponent=\"skbutton\"\n                    data-skbuttontype=\"next-event\" data-skbuttonvalue=\"RESEND\" type=\"button\"\u003e\n                    {{resendButtonLabel}}\n                \u003c/button\u003e\n                {{/if}}\n                {{#if cancelButtonLabel}}\n                \u003cbutton id=\"backBtn\" data-id=\"backBtn\" class=\"btn btn-link\" data-skcomponent=\"skbutton\"\n                    data-skbuttontype=\"next-event\" data-skform=\"recoveryCodeForm\" data-skbuttonvalue=\"CANCEL\" type=\"button\"\u003e\n                    {{cancelButtonLabel}}\n                \u003c/button\u003e\n                {{/if}}\n              \u003c/div\u003e\n            \u003c/form\u003e\n          \u003c/div\u003e\n        \u003c/main\u003e\n      \u003c/div\u003e\n    \u003c/div\u003e\n  \u003c/div\u003e\n\u003c/div\u003e"
              },
              "customScript" : {
                "value" : "const setFieldFocus = (id) =\u003e {\n    const element = document.getElementById(id);\n    if (element) {\n        element.focus();\n    }\n}\n\nconst makePasswordToggle = (id) =\u003e {\n    let container = document.getElementById(id);\n\n    if (container) {\n        let password = container.getElementsByTagName(\"input\")[0];\n        let toggler = document.createElement(\"button\");\n        toggler.setAttribute(\"type\", \"button\");\n        toggler.setAttribute(\"aria-label\", \"Show/Hide Password\");\n        toggler.className = \"btn mdi mdi-eye-off-outline position-absolute end-0 top-50 translate-middle-y\";\n        container.appendChild(toggler);\n\n        function showHidePassword() {\n            if (password.type == \"password\") {\n                password.setAttribute(\"type\", \"text\");\n                toggler.classList.add(\"mdi-eye-outline\");\n                toggler.classList.remove(\"mdi-eye-off-outline\");\n            } else {\n                toggler.classList.add(\"mdi-eye-off-outline\");\n                toggler.classList.remove(\"mdi-eye-outline\");\n                password.setAttribute(\"type\", \"password\");\n            }\n            password.focus();\n        };\n\n        toggler.addEventListener(\"click\", showHidePassword);\n    }\n}\n\nconst createChangeObserver = (id) =\u003e {\n    const targetNode = document.getElementById(id);\n\n    if (targetNode) {\n        // Observer options\n        const config = { childList: true, characterData: true, subtree: true };\n\n        const callback = function (mutationsList, observer) {\n            for (let mutation of mutationsList) {\n                if (mutation.type === 'characterData' || (mutation.type === 'childList' \u0026\u0026 mutation.addedNodes.length \u003e 0)) {\n                    // Form has reloaded, recreate the password toggle icons\n                    makePasswordToggle(\"newPasswordContainer\");\n                    makePasswordToggle(\"verifyPasswordContainer\");\n                    setFieldFocus(\"recoveryCode\");\n                }\n            }\n        };\n\n        const observer = new MutationObserver(callback);\n\n        observer.observe(targetNode, config);\n    }\n}\n\nconst start = () =\u003e {\n    makePasswordToggle(\"newPasswordContainer\");\n    makePasswordToggle(\"verifyPasswordContainer\");\n    setFieldFocus(\"recoveryCode\");\n    createChangeObserver('resendMessage');\n}\n\nif (document.readyState === \"loading\") {\n    // Loading hasn't finished yet\n    document.addEventListener(\"DOMContentLoaded\", start);\n} else {\n    // `DOMContentLoaded` has already fired\n    start();\n}\n"
              },
              "formFieldsList" : {
                "value" : [
                  {
                    "displayName" : "Recovery Code",
                    "hashedVisibility" : false,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "recoveryCode",
                    "value" : ""
                  },
                  {
                    "displayName" : "New Password",
                    "hashedVisibility" : true,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "newPassword",
                    "value" : ""
                  },
                  {
                    "displayName" : "Verify New Password",
                    "hashedVisibility" : true,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "verifyNewPassword",
                    "value" : ""
                  },
                  {
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "buttonValue"
                  }
                ]
              },
              "inputSchema" : {
                "value" : "{\n  \"type\": \"object\",\n  \"properties\": {\n    \"title\": {\n      \"type\": \"string\",\n      \"displayName\": \"Title\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    },\n    \"textOne\": {\n      \"type\": \"string\",\n      \"displayName\": \"Text One\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    },\n    \"resendMessage\": {\n      \"type\": \"string\",\n      \"displayName\": \"Resend Message\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    },\n    \"continueButtonLabel\": {\n      \"type\": \"string\",\n      \"displayName\": \"Continue Button Label\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    },\n    \"resendButtonLabel\": {\n      \"type\": \"string\",\n      \"displayName\": \"Resend Button Label\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    },\n    \"cancelButtonLabel\": {\n      \"type\": \"string\",\n      \"displayName\": \"Cancel Button Label\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    }\n  }\n}"
              },
              "nodeDescription" : {
                "value" : "Enter The Recovery Code and Set New Password"
              },
              "nodeTitle" : {
                "value" : "Password Recovery Form"
              },
              "outputSchema" : {
                "value" : {}
              },
              "resendButtonLabel" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Resend Code\"\n      }\n    ]\n  }\n]"
              },
              "resendMessage" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"teleport.svg\",\n        \"url\": \"resendMessage\",\n        \"data\": \"{{local.mmzegoy7gw.payload.output.resendMessage}}\",\n        \"tooltip\": \"{{local.mmzegoy7gw.payload.output.resendMessage}}\",\n        \"children\": [\n          {\n            \"text\": \"resendMessage\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "subtitle" : {
                "value" : null
              },
              "textOne" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"Create and verify a new password.\"\n      }\n    ]\n  }\n]"
              },
              "title" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Enter New Password\"\n      }\n    ]\n  }\n]"
              },
              "validationRules" : {
                "value" : [
                  {
                    "propertyName" : "recoveryCode",
                    "rules" : [
                      {
                        "message" : "Enter recovery code",
                        "ruleName" : "presence"
                      }
                    ]
                  },
                  {
                    "propertyName" : "newPassword",
                    "rules" : [
                      {
                        "message" : "Enter new password",
                        "ruleName" : "presence"
                      }
                    ]
                  },
                  {
                    "propertyName" : "verifyNewPassword",
                    "rules" : [
                      {
                        "message" : "Verify new password",
                        "ruleName" : "presence"
                      }
                    ]
                  }
                ]
              }
            })
          }
          position = {
            x = 1230
            y = 930
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
        "w2nqndopri" = {
          data = {
            id               = "w2nqndopri"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.pingcli__Error-0020-Message.id
            connector_id     = "errorConnector"
            capability_class = "backend"
            name             = "Error Message"
            label            = "Error Customize"
            capability_name  = "customErrorMessage"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "errorMessage" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Passwords do not match.\"\n      }\n    ]\n  }\n]"
              },
              "nodeTitle" : {
                "value" : "Passwords do not match error"
              }
            })
          }
          position = {
            x = 2130
            y = 1110
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
        "wz25oki6qd" = {
          data = {
            id               = "wz25oki6qd"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.pingcli__Variables.id
            connector_id     = "variablesConnector"
            capability_class = "backend"
            name             = "Variables"
            label            = "Variables"
            capability_name  = "saveValue"
            type             = "trigger"
            status           = "configured"
            id_unique        = "3gttj24txo"
            properties = jsonencode({
              "nodeTitle" : {
                "value" : "Set Company \u0026 Logo"
              },
              "saveVariables" : {
                "value" : [
                  {
                    "key" : 0.3651977481717872,
                    "label" : "companyLogo (string - flowInstance)",
                    "name" : "companyLogo",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"https://assets.pingone.com/ux/ui-library/5.0.2/images/logo-pingidentity.png\"\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "key" : 0.2827866731051578,
                    "label" : "companyName (string - flowInstance)",
                    "name" : "companyName",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Ping Identity\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 334
            y = 514
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
        "xaeamokdef" = {
          data = {
            id        = "xaeamokdef"
            node_type = "EVAL"
            label     = "Evaluator"
            properties = jsonencode({
              "w2nqndopri" : {
                "value" : "anyTriggersFalse"
              }
            })
          }
          position = {
            x = 1950
            y = 930
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
        "xdekxjajju" = {
          data = {
            id        = "xdekxjajju"
            node_type = "EVAL"
            properties = jsonencode({
              "vfdw439zp2" : {
                "value" : "always"
              }
            })
          }
          position = {
            x = 1050
            y = 930
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
        "zmbz1kvrbb" = {
          data = {
            id        = "zmbz1kvrbb"
            node_type = "EVAL"
          }
          position = {
            x = 750
            y = 1080
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
        "2txga2suu5" = {
          data = {
            id     = "2txga2suu5"
            source = "finrx3k4j3"
            target = "4awm7e93pi"
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
        "2y1rl0w5bn" = {
          data = {
            id     = "2y1rl0w5bn"
            source = "b5c3emwd8q"
            target = "emqskruuft"
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
        "3dzxiduywp" = {
          data = {
            id     = "3dzxiduywp"
            source = "zmbz1kvrbb"
            target = "m9l9y9m4jw"
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
        "41zhtjh0q6" = {
          data = {
            id     = "41zhtjh0q6"
            source = "v9puwtns1t"
            target = "gu8aplq3ou"
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
        "4qmjzn5uli" = {
          data = {
            id     = "4qmjzn5uli"
            source = "uvr5vj2oqi"
            target = "emqskruuft"
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
        "89dm3ouu5d" = {
          data = {
            id     = "89dm3ouu5d"
            source = "kj7dlai63b"
            target = "d3gppfo315"
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
        "al6jiijkke" = {
          data = {
            id     = "al6jiijkke"
            source = "omlw87ycb5"
            target = "autvsbla1a"
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
        "btmqq3n3k8" = {
          data = {
            id     = "btmqq3n3k8"
            source = "6geqqycejl"
            target = "acknzwphjw"
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
        "cdvgo67i30" = {
          data = {
            id     = "cdvgo67i30"
            source = "hoy0v6fkrb"
            target = "b5c3emwd8q"
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
        "ch6my1h0ry" = {
          data = {
            id                    = "ch6my1h0ry"
            source                = "autvsbla1a"
            target                = "6geqqycejl"
            multi_value_source_id = "vgii63uk2p"
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
        "eecye07zy3" = {
          data = {
            id                    = "eecye07zy3"
            source                = "autvsbla1a"
            target                = "0ksm35m5qb"
            multi_value_source_id = "3a7tpbhtep"
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
        "ek3q7ykllj" = {
          data = {
            id     = "ek3q7ykllj"
            source = "xdekxjajju"
            target = "vfdw439zp2"
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
        "ew17vwfa1u" = {
          data = {
            id     = "ew17vwfa1u"
            source = "9pkno982vy"
            target = "uvr5vj2oqi"
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
        "h52692wjs" = {
          data = {
            id     = "h52692wjs"
            source = "j9siq0mzgn"
            target = "0btbsj8ijk"
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
        "hz0u2ahfn5" = {
          data = {
            id     = "hz0u2ahfn5"
            source = "acknzwphjw"
            target = "xaeamokdef"
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
        "j4lxi6y9us" = {
          data = {
            id     = "j4lxi6y9us"
            source = "m9l9y9m4jw"
            target = "xdekxjajju"
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
        "jlyh3xku2s" = {
          data = {
            id     = "jlyh3xku2s"
            source = "wz25oki6qd"
            target = "mgyrsc3iyb"
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
        "jna6k429u3" = {
          data = {
            id     = "jna6k429u3"
            source = "vfdw439zp2"
            target = "omlw87ycb5"
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
        "mb5magj5md" = {
          data = {
            id     = "mb5magj5md"
            source = "xaeamokdef"
            target = "w2nqndopri"
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
        "mkd3v2tzqv" = {
          data = {
            id                    = "mkd3v2tzqv"
            source                = "autvsbla1a"
            target                = "finrx3k4j3"
            multi_value_source_id = "j2d7ax008r"
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
        "u4i3cam8vu" = {
          data = {
            id     = "u4i3cam8vu"
            source = "d3gppfo315"
            target = "j9siq0mzgn"
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
        "uca5z0vl12" = {
          data = {
            id     = "uca5z0vl12"
            source = "mgyrsc3iyb"
            target = "d3gppfo315"
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
        "uwqn3flhw0" = {
          data = {
            id     = "uwqn3flhw0"
            source = "0bpfvjlfvh"
            target = "kj7dlai63b"
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
        "w9shv1uoua" = {
          data = {
            id     = "w9shv1uoua"
            source = "uvr5vj2oqi"
            target = "4a669r77c3"
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
        "wcbyn8ajih" = {
          data = {
            id     = "wcbyn8ajih"
            source = "0ksm35m5qb"
            target = "7e8jehllq9"
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
        "x9pa6qlas2" = {
          data = {
            id     = "x9pa6qlas2"
            source = "b5c3emwd8q"
            target = "9pkno982vy"
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
        "xcr1yrj63f" = {
          data = {
            id     = "xcr1yrj63f"
            source = "xaeamokdef"
            target = "hoy0v6fkrb"
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
        "xvbeorriob" = {
          data = {
            id     = "xvbeorriob"
            source = "gu8aplq3ou"
            target = "v9adm9ez5d"
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
        "y4sxxcjnjm" = {
          data = {
            id     = "y4sxxcjnjm"
            source = "mmzegoy7gw"
            target = "zmbz1kvrbb"
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
        "z3sp5doadd" = {
          data = {
            id     = "z3sp5doadd"
            source = "v9adm9ez5d"
            target = "qllc4q0rvz"
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
        "zzze39yroz" = {
          data = {
            id     = "zzze39yroz"
            source = "qllc4q0rvz"
            target = "m9l9y9m4jw"
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

  depends_on = [
    pingone_davinci_variable.pingcli__companyLogo_flowInstance,
    pingone_davinci_variable.pingcli__companyName_flowInstance,
  ]
}


resource "pingone_davinci_flow" "pingcli__PingOne-0020-DaVinci-0020-API-0020-Protect-0020-Example" {
  environment_id = var.pingone_environment_id
  name           = "PingOne DaVinci API Protect Example"
  description    = "Imported on Tue May 16 2023 19:35:07 GMT+0000 (Coordinated Universal Time)"
  color          = "#CACED3"

  settings = {
    csp                              = "worker-src 'self' blob:; script-src 'self' https://cdn.jsdelivr.net https://code.jquery.com https://devsdk.singularkey.com http://cdnjs.cloudflare.com 'unsafe-inline' 'unsafe-eval';"
    log_level                        = 2
    intermediate_loading_screen_css  = ""
    intermediate_loading_screen_html = ""
  }

  graph_data = {
    renderer = jsonencode({
      "name" : "null"
    })
    elements = {
      nodes = {
        "09anefv002" = {
          data = {
            id            = "09anefv002"
            node_type     = "EVAL"
            connection_id = ""
            name          = ""
            id_unique     = ""
            properties = jsonencode({
              "7h8bs4vxuo" : {
                "value" : "allTriggersFalse"
              },
              "u6w4ob97dt" : {
                "value" : "allTriggersFalse"
              }
            })
          }
          position = {
            x = 1357
            y = 326
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
        "0mqv2pv49t" = {
          data = {
            id              = "0mqv2pv49t"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingcli__Variables.id
            connector_id    = "variablesConnector"
            name            = "Variables"
            label           = "Variables"
            capability_name = "saveValue"
            type            = "trigger"
            status          = "configured"
            id_unique       = ""
            properties = jsonencode({
              "saveVariables" : {
                "value" : [
                  {
                    "key" : 0.5428342378678097,
                    "label" : "userId (string - flowInstance)",
                    "name" : "userId",
                    "nameDefault" : "id",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"id\",\n        \"data\": \"{{local.6i7lwwrw94.payload.output.user.id}}\",\n        \"tooltip\": \"{{local.6i7lwwrw94.payload.output.user.id}}\",\n        \"children\": [\n          {\n            \"text\": \"id\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 877
            y = 476
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
        "1jf93tyrvi" = {
          data = {
            id              = "1jf93tyrvi"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingcli__Variables.id
            connector_id    = "variablesConnector"
            name            = "Variables"
            label           = "Variables"
            capability_name = "saveValue"
            type            = "trigger"
            status          = "configured"
            id_unique       = ""
            properties = jsonencode({
              "saveVariables" : {
                "value" : [
                  {
                    "key" : 0.8779096515773732,
                    "label" : "userId (string - flowInstance)",
                    "name" : "userId",
                    "nameDefault" : "id",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"id\",\n        \"data\": \"{{local.m4sfmek769.payload.output.matchedUser.id}}\",\n        \"tooltip\": \"{{local.m4sfmek769.payload.output.matchedUser.id}}\",\n        \"children\": [\n          {\n            \"text\": \"id\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 877
            y = 236
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
        "6i7lwwrw94" = {
          data = {
            id              = "6i7lwwrw94"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingcli__PingOne.id
            connector_id    = "pingOneSSOConnector"
            name            = "PingOne"
            label           = "PingOne"
            capability_name = "createUser"
            type            = "action"
            status          = "configured"
            id_unique       = ""
            properties = jsonencode({
              "additionalUserProperties" : {
                "value" : []
              },
              "email" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{global.parameters.email}}\",\n        \"tooltip\": \"{{global.parameters.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "passwordForCreateUser" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"password\",\n        \"data\": \"{{global.parameters.password}}\",\n        \"tooltip\": \"{{global.parameters.password}}\",\n        \"children\": [\n          {\n            \"text\": \"password\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "population" : {
                "value" : "useDefaultPopulation"
              },
              "username" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{global.parameters.email}}\",\n        \"tooltip\": \"{{global.parameters.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 577
            y = 476
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
        "75k6wc3j9i" = {
          data = {
            id            = "75k6wc3j9i"
            node_type     = "EVAL"
            connection_id = ""
            name          = ""
            id_unique     = ""
            properties = jsonencode({
              "jr1f287nlq" : {
                "value" : "allTriggersFalse"
              }
            })
          }
          position = {
            x = 697
            y = 266
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
        "87jn430mui" = {
          data = {
            id            = "87jn430mui"
            node_type     = "EVAL"
            connection_id = ""
            name          = ""
            id_unique     = ""
            properties = jsonencode({
              "kc7wrmpc93" : {
                "value" : "allTriggersFalse"
              }
            })
          }
          position = {
            x = 727
            y = 476
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
        "a6rirjd0m2" = {
          data = {
            id            = "a6rirjd0m2"
            node_type     = "EVAL"
            connection_id = ""
            name          = ""
            id_unique     = ""
          }
          position = {
            x = 1072
            y = 401
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
        "c9u3f1nyw7" = {
          data = {
            id              = "c9u3f1nyw7"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingcli__Http.id
            connector_id    = "httpConnector"
            name            = "Http"
            label           = "Http"
            capability_name = "createSuccessResponse"
            type            = "action"
            status          = "configured"
            id_unique       = ""
            properties = jsonencode({
              "claimsNameValuePairs" : {
                "value" : [
                  {
                    "key" : 0.3076393052734512,
                    "name" : null,
                    "nameDefault" : "level",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"level\",\n        \"data\": \"{{local.l9q5mxjjtm.payload.output.rawResponse.result.level}}\",\n        \"tooltip\": \"{{local.l9q5mxjjtm.payload.output.rawResponse.result.level}}\",\n        \"children\": [\n          {\n            \"text\": \"level\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "key" : 0.18337199639822654,
                    "name" : null,
                    "nameDefault" : "score",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"score\",\n        \"data\": \"{{local.l9q5mxjjtm.payload.output.rawResponse.result.score}}\",\n        \"tooltip\": \"{{local.l9q5mxjjtm.payload.output.rawResponse.result.score}}\",\n        \"children\": [\n          {\n            \"text\": \"score\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "key" : 0.5430462947447765,
                    "name" : null,
                    "nameDefault" : "rawResponse",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"rawResponse\",\n        \"data\": \"{{local.l9q5mxjjtm.payload.output.rawResponse}}\",\n        \"tooltip\": \"{{local.l9q5mxjjtm.payload.output.rawResponse}}\",\n        \"children\": [\n          {\n            \"text\": \"rawResponse\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "key" : 0.10159057010255945,
                    "label" : null,
                    "name" : null,
                    "nameDefault" : "success",
                    "type" : null,
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"success\",\n        \"data\": \"{{local.6i7lwwrw94.payload.success}}\",\n        \"tooltip\": \"{{local.6i7lwwrw94.payload.success}}\",\n        \"children\": [\n          {\n            \"text\": \"success\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              },
              "returnRequestParameters" : {
                "value" : true
              }
            })
          }
          position = {
            x = 1860
            y = 270
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
        "gznrygimzf" = {
          data = {
            id              = "gznrygimzf"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingcli__Http.id
            connector_id    = "httpConnector"
            name            = "Http"
            label           = "Http"
            capability_name = "createErrorResponse"
            type            = "action"
            status          = "configured"
            id_unique       = ""
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#d0021bff"
              },
              "claimsNameValuePairs" : {
                "value" : [
                  {
                    "key" : 0.8800805675019314,
                    "name" : null,
                    "nameDefault" : "message",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"message\",\n        \"data\": \"{{local.sxdpclcyko.payload.error.message}}\",\n        \"tooltip\": \"{{local.sxdpclcyko.payload.error.message}}\",\n        \"children\": [\n          {\n            \"text\": \"message\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 1860
            y = 420
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
        "jr1f287nlq" = {
          data = {
            id              = "jr1f287nlq"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingcli__Http.id
            connector_id    = "httpConnector"
            name            = "Http"
            label           = "Http"
            capability_name = "createErrorResponse"
            type            = "action"
            status          = "configured"
            id_unique       = ""
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#d0021bff"
              },
              "claimsNameValuePairs" : {
                "value" : [
                  {
                    "key" : 0.617681003488906,
                    "name" : null,
                    "nameDefault" : "message",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"message\",\n        \"data\": \"{{local.p53gq7n410.payload.error.message}}\",\n        \"tooltip\": \"{{local.p53gq7n410.payload.error.message}}\",\n        \"children\": [\n          {\n            \"text\": \"message\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 877
            y = 386
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
        "kc7wrmpc93" = {
          data = {
            id              = "kc7wrmpc93"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingcli__Http.id
            connector_id    = "httpConnector"
            name            = "Http"
            label           = "Http"
            capability_name = "createErrorResponse"
            type            = "action"
            status          = "configured"
            id_unique       = ""
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#d0021bff"
              },
              "claimsNameValuePairs" : {
                "value" : [
                  {
                    "key" : 0.578323540163898,
                    "name" : null,
                    "nameDefault" : "message",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"message\",\n        \"data\": \"{{local.6i7lwwrw94.payload.error.message}}\",\n        \"tooltip\": \"{{local.6i7lwwrw94.payload.error.message}}\",\n        \"children\": [\n          {\n            \"text\": \"message\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 877
            y = 596
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
        "l9q5mxjjtm" = {
          data = {
            id              = "l9q5mxjjtm"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingcli__PingOne-0020-Protect.id
            connector_id    = "pingOneRiskConnector"
            name            = "PingOne Protect"
            label           = "PingOne Protect"
            capability_name = "createRiskEvaluation"
            type            = "action"
            status          = "configured"
            id_unique       = ""
            properties = jsonencode({
              "additionalUserProperties" : {
                "value" : []
              },
              "cookie" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"cookies\",\n        \"data\": \"{{global.cookies}}\",\n        \"tooltip\": \"{{global.cookies}}\",\n        \"children\": [\n          {\n            \"text\": \"cookies\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "ipAddress" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"ip\",\n        \"data\": \"{{global.ip}}\",\n        \"tooltip\": \"{{global.ip}}\",\n        \"children\": [\n          {\n            \"text\": \"ip\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "password" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"password\",\n        \"data\": \"{{global.parameters.password}}\",\n        \"tooltip\": \"{{global.parameters.password}}\",\n        \"children\": [\n          {\n            \"text\": \"password\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "skRiskFP" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"riskData\",\n        \"data\": \"{{global.parameters.riskData}}\",\n        \"tooltip\": \"{{global.parameters.riskData}}\",\n        \"children\": [\n          {\n            \"text\": \"riskData\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "targetResourceName" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"DaVinci API Protect Sample App\"\n      }\n    ]\n  }\n]"
              },
              "userAgent" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"userAgent\",\n        \"data\": \"{{global.userAgent}}\",\n        \"tooltip\": \"{{global.userAgent}}\",\n        \"children\": [\n          {\n            \"text\": \"userAgent\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "userId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"variable.svg\",\n        \"url\": \"userId\",\n        \"data\": \"{{global.variables.userId}}\",\n        \"tooltip\": \"{{global.variables.userId}}\",\n        \"children\": [\n          {\n            \"text\": \"userId\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "userName" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{global.parameters.email}}\",\n        \"tooltip\": \"{{global.parameters.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "userType" : {
                "value" : "PING_ONE"
              }
            })
          }
          position = {
            x = 1237
            y = 326
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
        "m4sfmek769" = {
          data = {
            id              = "m4sfmek769"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingcli__PingOne.id
            connector_id    = "pingOneSSOConnector"
            name            = "PingOne"
            label           = "PingOne"
            capability_name = "userLookup"
            type            = "action"
            status          = "configured"
            id_unique       = ""
            properties = jsonencode({
              "matchAttributes" : {
                "value" : [
                  "email"
                ]
              },
              "userIdentifierForFindUser" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{global.parameters.email}}\",\n        \"tooltip\": \"{{global.parameters.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 277
            y = 266
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
        "n6js2rcdqf" = {
          data = {
            id            = "n6js2rcdqf"
            node_type     = "EVAL"
            connection_id = ""
            name          = ""
            id_unique     = ""
            properties = jsonencode({
              "gznrygimzf" : {
                "value" : "allTriggersFalse"
              }
            })
          }
          position = {
            x = 1695
            y = 270
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
        "p53gq7n410" = {
          data = {
            id              = "p53gq7n410"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingcli__PingOne.id
            connector_id    = "pingOneSSOConnector"
            name            = "PingOne"
            label           = "PingOne"
            capability_name = "checkPassword"
            type            = "action"
            status          = "configured"
            id_unique       = ""
            properties = jsonencode({
              "identifier" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{global.parameters.email}}\",\n        \"tooltip\": \"{{global.parameters.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "matchAttribute" : {
                "value" : "email"
              },
              "password" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"auth.svg\",\n        \"url\": \"password\",\n        \"data\": \"{{global.parameters.password}}\",\n        \"tooltip\": \"{{global.parameters.password}}\",\n        \"children\": [\n          {\n            \"text\": \"password\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 577
            y = 266
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
        "rvgypb5svi" = {
          data = {
            id            = "rvgypb5svi"
            node_type     = "EVAL"
            connection_id = ""
            name          = ""
            id_unique     = ""
          }
          position = {
            x = 1072
            y = 281
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
        "sxdpclcyko" = {
          data = {
            id              = "sxdpclcyko"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingcli__PingOne-0020-Protect.id
            connector_id    = "pingOneRiskConnector"
            name            = "PingOne Protect"
            label           = "PingOne Protect"
            capability_name = "updateRiskEvaluation"
            type            = "action"
            status          = "configured"
            id_unique       = ""
            properties = jsonencode({
              "completionStatus" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"SUCCESS\"\n      }\n    ]\n  }\n]"
              },
              "riskId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"id\",\n        \"data\": \"{{local.l9q5mxjjtm.payload.output.rawResponse.id}}\",\n        \"tooltip\": \"{{local.l9q5mxjjtm.payload.output.rawResponse.id}}\",\n        \"children\": [\n          {\n            \"text\": \"id\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 1560
            y = 270
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
        "u6w4ob97dt" = {
          data = {
            id              = "u6w4ob97dt"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingcli__Http.id
            connector_id    = "httpConnector"
            name            = "Http"
            label           = "Http"
            capability_name = "createErrorResponse"
            type            = "action"
            status          = "configured"
            id_unique       = ""
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#d0021bff"
              },
              "claimsNameValuePairs" : {
                "value" : [
                  {
                    "key" : 0.7318766750020025,
                    "name" : null,
                    "nameDefault" : "message",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"message\",\n        \"data\": \"{{local.l9q5mxjjtm.payload.error.message}}\",\n        \"tooltip\": \"{{local.l9q5mxjjtm.payload.error.message}}\",\n        \"children\": [\n          {\n            \"text\": \"message\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 1560
            y = 420
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
        "yqi3iaujxx" = {
          data = {
            id            = "yqi3iaujxx"
            node_type     = "EVAL"
            connection_id = ""
            name          = ""
            label         = "Evaluator"
            id_unique     = ""
            properties = jsonencode({
              "0di26c5iy7" : {
                "value" : "anyTriggersFalse"
              },
              "6i7lwwrw94" : {
                "value" : "allTriggersFalse"
              }
            })
          }
          position = {
            x = 427
            y = 266
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
        "05t56lofq2" = {
          data = {
            id     = "05t56lofq2"
            source = "09anefv002"
            target = "sxdpclcyko"
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
        "06eo6sq6c8" = {
          data = {
            id     = "06eo6sq6c8"
            source = "0mqv2pv49t"
            target = "a6rirjd0m2"
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
        "07z104pd2b" = {
          data = {
            id     = "07z104pd2b"
            source = "75k6wc3j9i"
            target = "1jf93tyrvi"
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
        "53h4nrs4u0" = {
          data = {
            id     = "53h4nrs4u0"
            source = "n6js2rcdqf"
            target = "gznrygimzf"
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
        "6n86yrphlt" = {
          data = {
            id     = "6n86yrphlt"
            source = "a6rirjd0m2"
            target = "l9q5mxjjtm"
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
        "6uwzgd9xgy" = {
          data = {
            id     = "6uwzgd9xgy"
            source = "1jf93tyrvi"
            target = "rvgypb5svi"
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
        "7mi39hz4x5" = {
          data = {
            id     = "7mi39hz4x5"
            source = "87jn430mui"
            target = "kc7wrmpc93"
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
        "8cy8txv5dv" = {
          data = {
            id     = "8cy8txv5dv"
            source = "l9q5mxjjtm"
            target = "09anefv002"
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
        "apual4vawu" = {
          data = {
            id     = "apual4vawu"
            source = "m4sfmek769"
            target = "yqi3iaujxx"
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
        "cygeg7p11i" = {
          data = {
            id     = "cygeg7p11i"
            source = "yqi3iaujxx"
            target = "p53gq7n410"
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
        "gjatfkco0t" = {
          data = {
            id     = "gjatfkco0t"
            source = "09anefv002"
            target = "u6w4ob97dt"
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
        "jqobmjbxm9" = {
          data = {
            id     = "jqobmjbxm9"
            source = "p53gq7n410"
            target = "75k6wc3j9i"
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
        "jsl67wfxc3" = {
          data = {
            id     = "jsl67wfxc3"
            source = "75k6wc3j9i"
            target = "jr1f287nlq"
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
        "jwovpclfvp" = {
          data = {
            id     = "jwovpclfvp"
            source = "rvgypb5svi"
            target = "l9q5mxjjtm"
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
        "poco6s1p07" = {
          data = {
            id     = "poco6s1p07"
            source = "yqi3iaujxx"
            target = "6i7lwwrw94"
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
        "tr8r1rok8t" = {
          data = {
            id     = "tr8r1rok8t"
            source = "6i7lwwrw94"
            target = "87jn430mui"
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
        "vsise0s8iw" = {
          data = {
            id     = "vsise0s8iw"
            source = "87jn430mui"
            target = "0mqv2pv49t"
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
        "wv1og0m5r3" = {
          data = {
            id     = "wv1og0m5r3"
            source = "sxdpclcyko"
            target = "n6js2rcdqf"
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
        "zwftxnuob4" = {
          data = {
            id     = "zwftxnuob4"
            source = "n6js2rcdqf"
            target = "c9u3f1nyw7"
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

  input_schema = [
    {
      property_name          = "email"
      preferred_data_type    = "string"
      preferred_control_type = "textField"
      required               = true
      is_expanded            = true
      description            = ""
    },
    {
      property_name          = "password"
      preferred_data_type    = "string"
      preferred_control_type = "textField"
      required               = true
      is_expanded            = true
      description            = ""
    },
    {
      property_name          = "riskData"
      preferred_data_type    = "string"
      preferred_control_type = "textField"
      required               = true
      is_expanded            = true
      description            = ""
    }
  ]
}