
resource "pingone_davinci_flow" "session_main" {
  environment_id = pingone_environment.brand.id
  name           = "PingOne Session Main Flow"
  description    = "Imported on Wed Sep 30 2026 15:44:26 GMT+0000 (Coordinated Universal Time)"
  color          = "#ff661c"

  settings = {
    csp                              = "worker-src 'self' blob:; script-src 'self' https://cdn.jsdelivr.net https://code.jquery.com https://devsdk.singularkey.com http://cdnjs.cloudflare.com 'unsafe-inline' 'unsafe-eval';"
    css                              = ".companyLogo {\n    height: 65px;\n}"
    custom_favicon_link              = "https://assets.pingone.com/ux/ui-library/5.0.2/images/logo-pingidentity.png"
    custom_title                     = "Sign On"
    log_level                        = 4
    scrub_sensitive_info             = false
    use_custom_css                   = true
    intermediate_loading_screen_css  = ""
    intermediate_loading_screen_html = ""
    css_links                        = ["https://assets.pingone.com/ux/end-user-nano/0.1.0-alpha.9/end-user-nano.css", "https://assets.pingone.com/ux/astro-nano/0.1.0-alpha.11/icons.css"]
    sensitive_info_fields            = []
  }

  graph_data = {
    data = jsonencode({})
    renderer = jsonencode({
      "name" : "null"
    })
    elements = {
      nodes = {
        "9b7cgoyv9z" = {
          data = {
            id        = "9b7cgoyv9z"
            node_type = "EVAL"
            label     = "Evaluator"
            properties = jsonencode({
              "howu8n9hsc" : {
                "value" : "anyTriggersFalse"
              },
              "z98ot8mzk7" : {
                "value" : "anyTriggersFalse"
              }
            })
          }
          position = {
            x = 454
            y = 484
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
        "dbcjwy026h" = {
          data = {
            id              = "dbcjwy026h"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingone_authentication.id
            connector_id    = "pingOneAuthenticationConnector"
            name            = "PingOne Authentication"
            label           = "PingOne Authentication 2"
            capability_name = "checkSession"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "authenticationMethodLastUsedIn" : {
                "value" : 480
              },
              "authenticatorLastSignOnQuantity" : {
                "value" : "1"
              },
              "authenticatorLastSignOnUnit" : {
                "value" : "minute"
              },
              "checkSessionAuthenticator" : {
                "value" : "pwd"
              },
              "nodeDescription" : {
                "value" : "Checks If The User Has Logged In With A Password In The Last 8 Hours"
              },
              "nodeTitle" : {
                "value" : "Check for a session"
              }
            })
          }
          position = {
            x = 334
            y = 484
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
        "df9ia9vsmb" = {
          data = {
            id              = "df9ia9vsmb"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "annotation" : {
                "value" : "Sign On Success"
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
                "value" : 700
              }
            })
          }
          position = {
            x = 218
            y = 848
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
        "fbx7x6gnus" = {
          data = {
            id              = "fbx7x6gnus"
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
              "backgroundColor" : {
                "value" : "#9dc967ff"
              },
              "customAuthenticationMethods" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"teleport.svg\",\n        \"url\": \"authMethod\",\n        \"data\": \"{{local.ofk8hitz8r.payload.output.authMethod}}\",\n        \"tooltip\": \"{{local.ofk8hitz8r.payload.output.authMethod}}\",\n        \"children\": [\n          {\n            \"text\": \"authMethod\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "idleTimeout" : {
                "value" : 43200
              },
              "nodeDescription" : {
                "value" : "Returns Successful Flow Completion Back To The PingOne Application Connection"
              },
              "nodeTitle" : {
                "value" : "Return success"
              },
              "oeInteractionCacheExpire" : {
                "value" : true
              },
              "userId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"teleport.svg\",\n        \"url\": \"p1UserId\",\n        \"data\": \"{{local.ofk8hitz8r.payload.output.p1UserId}}\",\n        \"tooltip\": \"{{local.ofk8hitz8r.payload.output.p1UserId}}\",\n        \"children\": [\n          {\n            \"text\": \"p1UserId\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 634
            y = 1054
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
        "fzhvaepr0k" = {
          data = {
            id              = "fzhvaepr0k"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            id_unique       = "xefq4liuut"
            properties = jsonencode({
              "annotation" : {
                "value" : "Input Schema: p1UserId, authMethod (optional)"
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
                "value" : 0
              }
            })
          }
          position = {
            x = 214
            y = 904
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
        "gad1f2fltk" = {
          data = {
            id              = "gad1f2fltk"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "annotation" : {
                "value" : "PingOne Session Main Flow"
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
                "value" : 1000
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
        "h9zati6tdm" = {
          data = {
            id              = "h9zati6tdm"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Teleport"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "nodeInstanceId" : {
                "value" : "ofk8hitz8r"
              },
              "nodeTitle" : {
                "value" : "Go to Sign On Success"
              },
              "p1UserId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"moustache\",\n        \"data\": \"{{local.dbcjwy026h.payload.output.session.user.id}}\",\n        \"name\": \"id\",\n        \"children\": [\n          {\n            \"text\": \"\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 934
            y = 484
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
        "lawat0pk0m" = {
          data = {
            id              = "lawat0pk0m"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            id_unique       = "o2v5xhdcbc"
            properties = jsonencode({
              "annotation" : {
                "value" : "Last Updated: October 8th, 2024"
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
        "ofk8hitz8r" = {
          data = {
            id              = "ofk8hitz8r"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node [2023-01-09]"
            capability_name = "startNode"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "inputSchema" : {
                "value" : "{\n\t\"type\": \"object\",\n\t\"properties\": {\n\t\t\"p1UserId\": {\n\t\t\t\"type\": \"string\",\n\t\t\t\"displayName\": \"PingOne User Id\",\n\t\t\t\"preferredControlType\": \"textField\",\n\t\t\t\"enableParameters\": true,\n\t\t\t\"propertyName\": \"p1UserId\"\n\t\t},\n\t\t\"authMethod\": {\n\t\t\t\"type\": \"string\",\n\t\t\t\"displayName\": \"Authentication Method\",\n\t\t\t\"preferredControlType\": \"textField\",\n\t\t\t\"enableParameters\": true,\n\t\t\t\"propertyName\": \"authMethod\"\n\t\t}\n\t}\n}"
              },
              "nodeTitle" : {
                "value" : "Sign On Success"
              }
            })
          }
          position = {
            x = 334
            y = 1054
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
        "qklq9dhol4" = {
          data = {
            id              = "qklq9dhol4"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "authMethod" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"flow-connector.svg\",\n        \"url\": \"authMethod\",\n        \"data\": \"{{local.z98ot8mzk7.payload.output.authMethod}}\",\n        \"tooltip\": \"{{local.z98ot8mzk7.payload.output.authMethod}}\",\n        \"children\": [\n          {\n            \"text\": \"authMethod\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeInstanceId" : {
                "value" : "ofk8hitz8r"
              },
              "nodeTitle" : {
                "value" : "Go to Sign On Success"
              },
              "p1UserId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"flow-connector.svg\",\n        \"url\": \"p1UserId\",\n        \"data\": \"{{local.z98ot8mzk7.payload.output.p1UserId}}\",\n        \"tooltip\": \"{{local.z98ot8mzk7.payload.output.p1UserId}}\",\n        \"children\": [\n          {\n            \"text\": \"p1UserId\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 934
            y = 694
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
        "t0im3zjpdh" = {
          data = {
            id        = "t0im3zjpdh"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 754
            y = 694
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
        "tbhg5pamsd" = {
          data = {
            id              = "tbhg5pamsd"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "annotation" : {
                "value" : "No Active Session, Go to Sign In"
              },
              "annotationTextColor" : {
                "value" : "#000000"
              },
              "backgroundColor" : {
                "value" : "#f2f3f4ff"
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
                "value" : true
              },
              "strokeWidth" : {
                "value" : 1
              },
              "width" : {
                "value" : 250
              }
            })
          }
          position = {
            x = 510
            y = 570
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
        "ubm8paq1y5" = {
          data = {
            id              = "ubm8paq1y5"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "annotation" : {
                "value" : "Session Exists, Go to Sign On Success"
              },
              "annotationTextColor" : {
                "value" : "#000000"
              },
              "backgroundColor" : {
                "value" : "#f2f3f4ff"
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
                "value" : true
              },
              "strokeWidth" : {
                "value" : 1
              },
              "width" : {
                "value" : 300
              }
            })
          }
          position = {
            x = 784
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
        "z98ot8mzk7" = {
          data = {
            id              = "z98ot8mzk7"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.flow_connector.id
            connector_id    = "flowConnector"
            name            = "Flow Connector"
            label           = "Flow"
            capability_name = "startUiSubFlow"
            type            = "trigger"
            status          = "configured"
            id_unique       = "vfcvshnz3c"
            properties = jsonencode({
              "nodeTitle" : {
                "value" : "Sign On Flow"
              },
              "subFlowId" : {
                "value" : {
                  "label" : "PingOne Sign On with Registration, Password Reset and Recovery",
                  "value" : pingone_davinci_flow.sign_on_registration.id
                }
              },
              "subFlowVersionId" : {
                "value" : -1
              }
            })
          }
          position = {
            x = 634
            y = 694
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
        "zkumd1hvz" = {
          data = {
            id        = "zkumd1hvz"
            node_type = "EVAL"
          }
          position = {
            x = 454
            y = 1054
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
        "2to7volmnk" = {
          data = {
            id     = "2to7volmnk"
            source = "dbcjwy026h"
            target = "9b7cgoyv9z"
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
        "7xytgqexja" = {
          data = {
            id     = "7xytgqexja"
            source = "z98ot8mzk7"
            target = "t0im3zjpdh"
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
        "9elw1pkfp4" = {
          data = {
            id     = "9elw1pkfp4"
            source = "9b7cgoyv9z"
            target = "h9zati6tdm"
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
        "c7trfkylri" = {
          data = {
            id     = "c7trfkylri"
            source = "t0im3zjpdh"
            target = "qklq9dhol4"
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
        "emucb01so1" = {
          data = {
            id     = "emucb01so1"
            source = "ofk8hitz8r"
            target = "zkumd1hvz"
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
        "jt1ukcyycl" = {
          data = {
            id     = "jt1ukcyycl"
            source = "zkumd1hvz"
            target = "fbx7x6gnus"
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
        "mwnduzih46" = {
          data = {
            id     = "mwnduzih46"
            source = "9b7cgoyv9z"
            target = "z98ot8mzk7"
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

  trigger = {
    type = "AUTHENTICATION"
  }
}


resource "pingone_davinci_flow" "sign_on_registration" {
  environment_id = pingone_environment.brand.id
  name           = "PingOne Sign On with Registration, Password Reset and Recovery"
  description    = "Imported on Wed Sep 30 2026 15:44:25 GMT+0000 (Coordinated Universal Time)"
  color          = "#CACED3"

  settings = {
    csp                              = "worker-src 'self' blob:; script-src 'self' https://cdn.jsdelivr.net https://code.jquery.com https://devsdk.singularkey.com http://cdnjs.cloudflare.com 'unsafe-inline' 'unsafe-eval';"
    css                              = ".companyLogo {\n    height: 65px;\n}\n\n.icon-padding::before {\n  padding-right: 5px;\n}"
    custom_favicon_link              = "https://assets.pingone.com/ux/ui-library/5.0.2/images/logo-pingidentity.png"
    custom_title                     = "Sign On"
    log_level                        = 4
    scrub_sensitive_info             = false
    use_custom_css                   = true
    intermediate_loading_screen_css  = ""
    intermediate_loading_screen_html = ""
    css_links                        = ["https://assets.pingone.com/ux/end-user-nano/0.1.0-alpha.9/end-user-nano.css", "https://assets.pingone.com/ux/astro-nano/0.1.0-alpha.11/icons.css"]
    sensitive_info_fields            = []
  }

  graph_data = {
    data = jsonencode({})
    renderer = jsonencode({
      "name" : "null"
    })
    elements = {
      nodes = {
        "0c41v9ejkb" = {
          data = {
            id              = "0c41v9ejkb"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingone.id
            connector_id    = "pingOneSSOConnector"
            name            = "PingOne"
            label           = "PingOne"
            capability_name = "resetPassword"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "currentPassword" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"currentPassword\",\n        \"data\": \"{{local.yscz5j5r84.payload.output.currentPassword}}\",\n        \"tooltip\": \"{{local.yscz5j5r84.payload.output.currentPassword}}\",\n        \"children\": [\n          {\n            \"text\": \"currentPassword\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "identifier" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"teleport.svg\",\n        \"url\": \"p1UserId\",\n        \"data\": \"{{local.ercttap70x.payload.output.p1UserId}}\",\n        \"tooltip\": \"{{local.ercttap70x.payload.output.p1UserId}}\",\n        \"children\": [\n          {\n            \"text\": \"p1UserId\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "newPassword" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"newPassword\",\n        \"data\": \"{{local.yscz5j5r84.payload.output.newPassword}}\",\n        \"tooltip\": \"{{local.yscz5j5r84.payload.output.newPassword}}\",\n        \"children\": [\n          {\n            \"text\": \"newPassword\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeDescription" : {
                "value" : "Updates the user's password to the new one submitted if current password was validated"
              },
              "nodeTitle" : {
                "value" : "Update password"
              },
              "resetPassword_localizedErrors" : {
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
                        "key" : "noUserMatch",
                        "value" : ""
                      },
                      {
                        "key" : "requiredValue",
                        "value" : ""
                      },
                      {
                        "key" : "passwordLockedOut",
                        "value" : ""
                      },
                      {
                        "key" : "passwordTooYoung",
                        "value" : ""
                      },
                      {
                        "key" : "userDisabled",
                        "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                      },
                      {
                        "key" : "currentPasswordNotValid",
                        "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Current password is not valid.\"\n      }\n    ]\n  }\n]"
                      },
                      {
                        "key" : "newPasswordNotValid",
                        "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"New password does not meet requirements.\"\n      }\n    ]\n  }\n]"
                      }
                    ]
                  }
                }
              }
            })
          }
          position = {
            x = 1534
            y = 1410
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
        "0mkskx7cez" = {
          data = {
            id               = "0mkskx7cez"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.error_message.id
            connector_id     = "errorConnector"
            capability_class = "backend"
            name             = "Error Message"
            label            = "Error Customize"
            capability_name  = "customErrorMessage"
            type             = "action"
            status           = "configured"
            id_unique        = "upt2qd07bj"
            properties = jsonencode({
              "errorCode" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Unexpected value received\"\n      }\n    ]\n  }\n]"
              },
              "errorDescription" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Could not determine which button was selected\"\n      }\n    ]\n  }\n]"
              },
              "errorMessage" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"An unexpected error has occurred\"\n      }\n    ]\n  }\n]"
              },
              "errorReason" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"An unexpected value was received for button selection\"\n      }\n    ]\n  }\n]"
              },
              "nodeDescription" : {
                "value" : "Received an unexpected value for the button selected to submit the form"
              },
              "nodeTitle" : {
                "value" : "Received an unexpected value"
              }
            })
          }
          position = {
            x = 1234
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
        "1k5y98i1v1" = {
          data = {
            id               = "1k5y98i1v1"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.http.id
            connector_id     = "httpConnector"
            capability_class = "render"
            name             = "Http"
            label            = "Http (Use this for form + custom messages)"
            capability_name  = "customHTMLTemplate"
            type             = "trigger"
            status           = "configured"
            id_unique        = "l8yfg8n7hn"
            properties = jsonencode({
              "customCSS" : {},
              "customHTML" : {
                "value" : "\u003cdiv class=\"end-user-nano\"\u003e\n  \u003cdiv\n    class=\"bg-light d-flex flex-column justify-content-center align-items-center position-absolute top-0 start-0 bottom-0 end-0\"\u003e\n    \u003cdiv style=\"max-width: 400px; width: 100%\"\u003e\n      \u003cdiv class=\"card shadow mb-5\"\u003e\n        \u003cmain aria-labelledby=\"title\"\u003e\n          \u003cdiv class=\"card-body p-5 d-flex flex-column\"\u003e\n            \u003cimg class=\"companyLogo align-self-center mb-5\" src=\"{{global.variables.companyLogo}}\" alt=\"{{global.variables.companyName}}\" /\u003e\n\n            {{#if title}}\n            \u003ch1 id=\"title\" class=\"text-center mb-4\"\u003e{{title}}\u003c/h1\u003e\n            {{/if}}\n\n            {{#if textOne}}\n            \u003cp class=\"text-muted text-center\"\u003e{{textOne}}\u003c/p\u003e\n            {{/if}}\n\n            {{#if textTwo}}\n            \u003cp class=\"text-muted text-center\"\u003e{{textTwo}}\u003c/p\u003e\n            {{/if}}\n\n            \u003c!-- Generic Error Message --\u003e\n            \u003cp id=\"feedback\" data-id=\"feedback\" class=\"text-danger mdi mdi-alert-circle text-center icon-padding\"\n              data-skcomponent=\"skerror\" aria-live=\"assertive\"\u003e\u003c/p\u003e\n\n            \u003c!-- Field Validation Error Messages --\u003e\n            \u003cp class=\"text-danger mdi mdi-alert-circle text-center icon-padding\" data-skerrorid=\"password\"\n              data-skcomponent=\"skerrormessage\" aria-live=\"assertive\"\u003e\u003c/p\u003e\n\n            \u003cform id=\"registrationForm\" data-id=\"registrationForm\" class=\"form\"\u003e\n              \u003cdiv class=\"mb-4 form-floating\"\u003e\n                \u003cinput id=\"email\" data-id=\"email\" class=\"form-control\" type=\"text\" name=\"email\" placeholder=\"Email\"\n                autocomplete=\"off\" aria-required=\"true\" /\u003e\n                \u003clabel id=\"emailLabel\" data-id=\"emailLabel\" class=\"form-label\" for=\"email\"\u003eEmail\u003c/label\u003e\n              \u003c/div\u003e\n              \u003cdiv class=\"mb-4 form-floating\"\u003e\n                \u003cinput id=\"givenName\" data-id=\"givenName\" class=\"form-control\" type=\"text\" name=\"givenName\" placeholder=\"First Name\" autocomplete=\"given-name\" /\u003e\n                \u003clabel id=\"givenNameLabel\" data-id=\"givenNameLabel\" class=\"form-label\" for=\"givenName\"\u003eFirst Name\u003c/label\u003e\n              \u003c/div\u003e\n              \u003cdiv class=\"mb-4 form-floating\"\u003e\n                \u003cinput id=\"familyName\" data-id=\"familyName\" class=\"form-control\" type=\"text\" placeholder=\"Last Name\" autocomplete=\"family-name\" name=\"familyName\" /\u003e\n                \u003clabel id=\"familyNameLabel\" data-id=\"familyNameLabel\" class=\"form-label\" for=\"familyName\"\u003eLast Name\u003c/label\u003e\n              \u003c/div\u003e\n              \u003cdiv id=\"passwordContainer\" class=\"mb-4 form-floating\"\u003e\n                \u003cinput id=\"password\" data-id=\"password\" class=\"form-control\" type=\"password\" placeholder=\"Password\"\n                autocomplete=\"off\" name=\"password\" aria-required=\"true\" /\u003e\n                \u003clabel id=\"passwordLabel\" data-id=\"passwordLabel\" class=\"form-label\" for=\"password\"\u003ePassword\u003c/label\u003e\n              \u003c/div\u003e\n              \u003cdiv class=\"d-flex flex-column\"\u003e\n              \n                \u003cbutton id=\"submitBtn\" data-id=\"submitBtn\" class=\"btn btn-primary mb-3\" type=\"submit\"\n                  data-skcomponent=\"skbutton\" data-skbuttontype=\"form-submit\" data-skform=\"registrationForm\"\n                  data-skbuttonvalue=\"REGISTER\"\u003e\n                  Continue\n                \u003c/button\u003e\n               \n                \u003cbutton class=\"btn btn-link\" data-skcomponent=\"skbutton\" data-skbuttontype=\"next-event\"\n                  data-skbuttonvalue=\"CANCEL\" id=\"btnCancel\"\u003e\n                  Already have an account? Sign On\n                \u003c/button\u003e\n               \n              \u003c/div\u003e\n            \u003c/form\u003e\n          \u003c/div\u003e\n        \u003c/main\u003e\n      \u003c/div\u003e\n    \u003c/div\u003e\n  \u003c/div\u003e\n\u003c/div\u003e"
              },
              "customScript" : {
                "value" : "const setFieldFocus = (id) =\u003e {\r\n    const element = document.getElementById(id);\r\n    if (element) {\r\n        element.focus();\r\n    }\r\n}\r\n\r\nconst makePasswordToggle = (id) =\u003e {\r\n    let container = document.getElementById(id);\r\n\r\n    if (container) {\r\n        let password = container.getElementsByTagName(\"input\")[0];\r\n        let toggler = document.createElement(\"button\");\r\n        toggler.setAttribute(\"type\", \"button\");\r\n        toggler.setAttribute(\"aria-label\", \"Show/Hide Password\");\r\n        toggler.className = \"btn mdi mdi-eye-off-outline position-absolute end-0 top-50 translate-middle-y\";\r\n        container.appendChild(toggler);\r\n\r\n        function showHidePassword() {\r\n            if (password.type == \"password\") {\r\n                password.setAttribute(\"type\", \"text\");\r\n                toggler.classList.add(\"mdi-eye-outline\");\r\n                toggler.classList.remove(\"mdi-eye-off-outline\");\r\n            } else {\r\n                toggler.classList.add(\"mdi-eye-off-outline\");\r\n                toggler.classList.remove(\"mdi-eye-outline\");\r\n                password.setAttribute(\"type\", \"password\");\r\n            }\r\n            password.focus();\r\n        };\r\n\r\n        toggler.addEventListener(\"click\", showHidePassword);\r\n    }\r\n}\r\n\r\nconst start = () =\u003e {\r\n    makePasswordToggle(\"passwordContainer\");\r\n    setFieldFocus(\"email\")\r\n}\r\n\r\nif (document.readyState === \"loading\") {\r\n    // Loading hasn't finished yet\r\n    document.addEventListener(\"DOMContentLoaded\", start);\r\n} else {\r\n    // `DOMContentLoaded` has already fired\r\n    start();\r\n}"
              },
              "formFieldsList" : {
                "value" : [
                  {
                    "displayName" : "Email",
                    "hashedVisibility" : false,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "email",
                    "value" : ""
                  },
                  {
                    "displayName" : "Password",
                    "hashedVisibility" : true,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "password",
                    "value" : ""
                  },
                  {
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "buttonValue"
                  },
                  {
                    "displayName" : "Given Name",
                    "hashedVisibility" : false,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "givenName",
                    "value" : ""
                  },
                  {
                    "displayName" : "Family Name",
                    "hashedVisibility" : false,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "familyName",
                    "value" : ""
                  }
                ]
              },
              "inputSchema" : {
                "value" : "{\n  \"type\": \"object\",\n  \"properties\": {\n    \"title\": {\n      \"type\": \"string\",\n      \"displayName\": \"Title\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true,\n      \"propertyName\": \"title\"\n    },\n    \"textOne\": {\n      \"type\": \"string\",\n      \"displayName\": \"Text One\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true,\n      \"propertyName\": \"textOne\"\n    },\n    \"textTwo\": {\n      \"type\": \"string\",\n      \"displayName\": \"Text Two\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    }\n  }\n}"
              },
              "nodeDescription" : {
                "value" : "Enter name, email, and password to create a new account"
              },
              "nodeTitle" : {
                "value" : "Create Profile"
              },
              "title" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Create Your Profile\"\n      }\n    ]\n  }\n]"
              },
              "validationRules" : {
                "value" : [
                  {
                    "propertyName" : "password",
                    "rules" : [
                      {
                        "message" : "Set a password for your account",
                        "ruleName" : "presence"
                      }
                    ]
                  }
                ]
              }
            })
          }
          position = {
            x = 634
            y = 2700
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
        "1wq4ux6rcq" = {
          data = {
            id              = "1wq4ux6rcq"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            id_unique       = "o2v5xhdcbc"
            properties = jsonencode({
              "annotation" : {
                "value" : "Last Updated: October 8th, 2024"
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
            x = 248
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
        "222zm3asev" = {
          data = {
            id        = "222zm3asev"
            node_type = "EVAL"
          }
          position = {
            x = 2584
            y = 870
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
        "273gpisk0t" = {
          data = {
            id              = "273gpisk0t"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
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
            x = 1234
            y = 1920
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
        "2otm488snv" = {
          data = {
            id              = "2otm488snv"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "nodeInstanceId" : {
                "value" : "dpo5892st9"
              }
            })
          }
          position = {
            x = 1234
            y = 1620
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
        "2xzcvx1gll" = {
          data = {
            id              = "2xzcvx1gll"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "startNode"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "inputSchema" : {
                "value" : "{\n\t\"type\": \"object\",\n\t\"properties\": {\n\t\t\"errorDetails\": {\n\t\t\t\"type\": \"object\",\n\t\t\t\"displayName\": \"Error Details\",\n\t\t\t\"preferredControlType\": \"textField\",\n\t\t\t\"enableParameters\": true,\n\t\t\t\"propertyName\": \"errorDetails\"\n\t\t}\n\t}\n}"
              },
              "nodeTitle" : {
                "value" : "Account Locked"
              }
            })
          }
          position = {
            x = 334
            y = 3810
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
        "3rcqks6t1v" = {
          data = {
            id               = "3rcqks6t1v"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.http.id
            connector_id     = "httpConnector"
            capability_class = "render"
            name             = "Http"
            label            = "Http"
            capability_name  = "customHTMLTemplate"
            type             = "trigger"
            status           = "configured"
            id_unique        = "bx2zrn8tre"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#afd5ffff"
              },
              "customCSS" : {
                "value" : ":root {\n  --animation-dimension: 100px;\n  --animation-start-color: #71e171;\n  --animation-midway-color: #67d067;\n  --animation-finish-color: #59b259;\n}\n\n.checkmark {\n  width: var(--animation-dimension);\n  height: var(--animation-dimension);\n  border-radius: 50%;\n  display: block;\n  stroke-width: 5;\n  stroke: #ffffff;\n  stroke-miterlimit: 10;\n  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);\n  animation: fill 0.4s ease-in-out 0.4s forwards,\n    scale 0.3s ease-in-out 0.9s both;\n}\n\n.checkmarkCircle {\n  stroke-dasharray: 166;\n  stroke-dashoffset: 166;\n  stroke-width: 5;\n  stroke-miterlimit: 10;\n  stroke: var(--animation-finish-color);\n  fill: none;\n  animation: stroke 0.6s cubic-bezier(0.65, 0, 0.45, 1) forwards,\n    colorChange 1.2s ease-in-out forwards;\n}\n\n.checkmarkCheck {\n  transform-origin: 50% 50%;\n  stroke-dasharray: 48;\n  stroke-dashoffset: 48;\n  animation: stroke 0.3s cubic-bezier(0.65, 0, 0.45, 1) 0.8s forwards,\n    colorChange 0.6s ease-in-out 0.8s forwards;\n}\n\n@keyframes colorChange {\n  0% {\n    stroke: var(--animation-start-color);\n  }\n  50% {\n    stroke: var(--animation-midway-color);\n  } \n  100% {\n    stroke: var(--animation-finish-color);\n  }\n}\n\n@keyframes stroke {\n  100% {\n    stroke-dashoffset: 0;\n  }\n}\n@keyframes scale {\n  0%,\n  100% {\n    transform: none;\n  }\n  50% {\n    transform: scale3d(1.1, 1.1, 1);\n  }\n  70% {\n    transform: scale3d(0.98, 0.98, 1);\n  }\n  85% {\n    transform: scale3d(1.02, 1.02, 1);\n  }\n}\n@keyframes fill {\n  100% {\n    box-shadow: inset 0px 0px 0px 0px var(--animation-finish-color);\n  }\n}"
              },
              "customHTML" : {
                "value" : "\u003cdiv class=\"end-user-nano\"\u003e\n    \u003cdiv\n        class=\"bg-light d-flex flex-column justify-content-center align-items-center position-absolute top-0 start-0 bottom-0 end-0 overflow-auto\"\u003e\n        \u003cdiv style=\"max-width: 400px; min-width: 400px; width: 100%\"\u003e\n            \u003cdiv class=\"card shadow mb-5\"\u003e\n                \u003cdiv class=\"card-body p-5 d-flex flex-column\"\u003e\n                    \u003cimg class=\"companyLogo align-self-center mb-5\" src=\"{{global.variables.companyLogo}}\" alt=\"{{global.variables.companyName}}\" /\u003e\n\n                    {{#if title}}\n                    \u003ch1 class=\"text-center mb-4\"\u003e{{title}}\u003c/h1\u003e\n                    {{/if}}\n\n                    \u003cdiv class=\"mx-auto mt-3 mb-4\"\u003e\n                        \u003csvg class=\"checkmark\" xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 52 52\"\u003e\n                            \u003ccircle class=\"checkmarkCircle\" cx=\"26\" cy=\"26\" r=\"25\" fill=\"none\" /\u003e\n                            \u003cpath class=\"checkmarkCheck\" fill=\"none\" d=\"M14.1 27.2l7.1 7.2 16.7-16.8\" /\u003e\n                        \u003c/svg\u003e\n                    \u003c/div\u003e\n\n                    {{#if textOne}}\n                    \u003cp class=\"text-muted text-center\"\u003e{{textOne}}\u003c/p\u003e\n                    {{/if}}\n\n                    {{#if textTwo}}\n                    \u003cp class=\"text-muted text-center\"\u003e{{textTwo}}\u003c/p\u003e\n                    {{/if}}\n\n                    \u003cp class=\"text-danger mdi mdi-alert-circle icon-padding\" data-id=\"feedback\" data-skcomponent=\"skerror\"\u003e\u003c/p\u003e\n\n                    \u003cdiv class=\"d-flex flex-column\"\u003e\n                        \u003cbutton id=\"submitBtn\" data-id=\"submitBtn\" class=\"btn btn-primary mb-3\" data-skcomponent=\"skbutton\"\n                            data-skbuttontype=\"next-event\" data-skbuttonvalue=\"NEXT\" \u003e\n                            Continue  \n                        \u003c/button\u003e\n                    \u003c/div\u003e\n                    \n                \u003c/div\u003e\n            \u003c/div\u003e\n        \u003c/div\u003e\n    \u003c/div\u003e\n\u003c/div\u003e"
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
                "value" : "Password has been reset successfully"
              },
              "nodeTitle" : {
                "value" : "Password Reset Success"
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
            x = 1834
            y = 1410
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
        "458pe5w5g4" = {
          data = {
            id        = "458pe5w5g4"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 754
            y = 3810
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
        "4bhd6f955t" = {
          data = {
            id        = "4bhd6f955t"
            node_type = "EVAL"
            label     = "Evaluator"
            properties = jsonencode({
              "9m6zkvt6lt" : {
                "value" : "anyTriggersFalse"
              },
              "jmzjeq5oev" : {
                "value" : "anyTriggersFalse"
              }
            })
          }
          position = {
            x = 3154
            y = 2070
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
        "4fqij2fbjt" = {
          data = {
            id              = "4fqij2fbjt"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
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
                "value" : 3800
              }
            })
          }
          position = {
            x = 244
            y = 1830
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
        "4p1hxq7p98" = {
          data = {
            id               = "4p1hxq7p98"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.error_message.id
            connector_id     = "errorConnector"
            capability_class = "backend"
            name             = "Error Message"
            label            = "Error Customize"
            capability_name  = "customErrorMessage"
            type             = "action"
            status           = "configured"
            id_unique        = "f6c6klxo7e"
            properties = jsonencode({
              "errorMessage" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"message\",\n        \"data\": \"{{local.x0txd3bdfn.payload.error.message}}\",\n        \"tooltip\": \"{{local.x0txd3bdfn.payload.error.message}}\",\n        \"children\": [\n          {\n            \"text\": \"message\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeDescription" : {
                "value" : "User Create Error Message"
              },
              "nodeTitle" : {
                "value" : "Unable to Create User"
              }
            })
          }
          position = {
            x = 1534
            y = 2910
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
        "4qxu8ofxjj" = {
          data = {
            id              = "4qxu8ofxjj"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node [2023-01-09]"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            id_unique       = "efipo9nts6"
            properties = jsonencode({
              "nodeInstanceId" : {
                "value" : "ercttap70x"
              },
              "nodeTitle" : {
                "value" : "Go to Reset Password"
              },
              "p1UserId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"id\",\n        \"data\": \"{{local.cqm26fxq1v.payload.output.matchedUser.id}}\",\n        \"tooltip\": \"{{local.cqm26fxq1v.payload.output.matchedUser.id}}\",\n        \"children\": [\n          {\n            \"text\": \"id\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 2764
            y = 870
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
        "5y9f2f02rr" = {
          data = {
            id        = "5y9f2f02rr"
            node_type = "EVAL"
          }
          position = {
            x = 1354
            y = 1920
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
        "65u7m8cm28" = {
          data = {
            id               = "65u7m8cm28"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.http.id
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
              "customCSS" : {
                "value" : ""
              },
              "customHTML" : {
                "value" : "\u003cdiv class=\"end-user-nano\"\u003e\n  \u003cdiv\n    class=\"bg-light d-flex flex-column justify-content-center align-items-center position-absolute top-0 start-0 bottom-0 end-0 overflow-auto\"\u003e\n    \u003cdiv style=\"max-width: 400px; min-width: 400px; width: 100%\"\u003e\n      \u003cdiv class=\"card shadow mb-2\"\u003e\n        \u003cmain aria-labelledby=\"title\"\u003e\n          \u003cdiv class=\"card-body p-5 d-flex flex-column\"\u003e\n            \u003cimg class=\"companyLogo align-self-center mb-5\" src=\"{{global.variables.companyLogo}}\" alt=\"{{global.variables.companyName}}\"\u003e\n\n            {{#if title}}\n            \u003ch1 id=\"title\" class=\"text-center mb-4\"\u003e{{title}}\u003c/h1\u003e\n            {{/if}}\n\n            {{#if textOne}}\n            \u003cp class=\"text-muted text-center\"\u003e{{textOne}}\u003c/p\u003e\n            {{/if}}\n\n            {{#if textTwo}}\n            \u003cp class=\"text-muted text-center\"\u003e{{textTwo}}\u003c/p\u003e\n            {{/if}}\n\n            \u003c!-- Generic Error Message --\u003e\n            \u003cp class=\"text-danger mdi mdi-alert-circle text-center icon-padding\" id=\"feedbackError\" data-id=\"feedback\"\n              data-skcomponent=\"skerror\" aria-live=\"assertive\"\u003e\u003c/p\u003e\n\n            \u003cform id=\"signonForm\" aria-labelledby=\"title\" data-id=\"signonForm\"\u003e\n              \u003cdiv class=\"mb-4 form-floating\"\u003e\n                \u003cinput class=\"form-control\" id=\"username\" name=\"username\" placeholder=\"Username\"\n                  autocomplete=\"\"  data-id=\"username-input\" aria-required=\"true\"\n                  aria-describedby=\"usernameLabel\" /\u003e\n                \u003clabel id=\"usernameLabel\" for=\"username\"\u003eUsername\u003c/label\u003e\n              \u003c/div\u003e\n              \u003cdiv id=\"passwordDiv\" class=\"mb-4 form-floating\"\u003e\n                \u003cinput class=\"form-control\" type=\"password\" id=\"password\" name=\"password\" placeholder=\"Password\"\n                  autocomplete=\"\" data-id=\"password-input\" aria-required=\"true\"\n                  aria-describedby=\"passwordLabel\" /\u003e\n                \u003clabel id=\"passwordLabel\" for=\"password\"\u003ePassword\u003c/label\u003e\n              \u003c/div\u003e\n              \u003cdiv class=\"d-flex flex-column\"\u003e\n                \u003cbutton data-id=\"button\" type=\"submit\" class=\"btn btn-primary mb-3\" data-skcomponent=\"skbutton\"\n                  data-skbuttontype=\"form-submit\" id=\"btnSignIn\" data-skform=\"signonForm\"\n                  data-skbuttonvalue=\"SIGNON\"\u003e\n                  Sign On\n                \u003c/button\u003e\n                \u003cbutton data-id=\"button\" class=\"btn btn-link\" data-skcomponent=\"skbutton\" data-skbuttontype=\"next-event\"\n                  id=\"btnRegister\" data-skbuttonvalue=\"REGISTER\"\u003e\n                  No account? Register now!\n                \u003c/button\u003e\n                \u003cbutton data-id=\"button\" class=\"btn btn-link\" data-skcomponent=\"skbutton\" data-skbuttontype=\"next-event\"\n                  id=\"btnTrouble\" data-skbuttonvalue=\"TROUBLE\"\u003e\n                  Having trouble signing on?\n                \u003c/button\u003e\n              \u003c/div\u003e\n            \u003c/form\u003e\n          \u003c/div\u003e\n        \u003c/main\u003e\n      \u003c/div\u003e\n    \u003c/div\u003e\n  \u003c/div\u003e\n\u003c/div\u003e\n"
              },
              "customScript" : {
                "value" : "const setFieldFocus = (id) =\u003e {\n    const element = document.getElementById(id);\n    if (element) {\n        element.focus();\n    }\n};\n\nconst makePasswordToggle = (id) =\u003e {\n    const container = document.getElementById(id);\n    if (container) {\n        const password = container.getElementsByTagName(\"input\")[0];\n        const toggler = document.createElement(\"button\");\n        toggler.setAttribute(\"type\", \"button\");\n        toggler.setAttribute(\"aria-label\", \"Show/Hide Password\");\n        toggler.className = \"btn mdi mdi-eye-off-outline position-absolute end-0 top-50 translate-middle-y\";\n        container.appendChild(toggler);\n\n        const showHidePassword = () =\u003e {\n            if (password.type === \"password\") {\n                password.type = \"text\";\n                toggler.classList.add(\"mdi-eye-outline\");\n                toggler.classList.remove(\"mdi-eye-off-outline\");\n            } else {\n                password.type = \"password\";\n                toggler.classList.add(\"mdi-eye-off-outline\");\n                toggler.classList.remove(\"mdi-eye-outline\");\n            }\n            password.focus();\n        };\n\n        toggler.addEventListener(\"click\", showHidePassword);\n    }\n};\n\nconst start = () =\u003e {\n    makePasswordToggle(\"passwordDiv\");\n    setFieldFocus(\"username\");\n};\n\nif (document.readyState === \"loading\") {\n    document.addEventListener(\"DOMContentLoaded\", start);\n} else {\n    start();\n}\n"
              },
              "formFieldsList" : {
                "value" : [
                  {
                    "displayName" : "Username",
                    "hashedVisibility" : false,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "username",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "displayName" : "Password",
                    "hashedVisibility" : true,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "password",
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
                "value" : "{\n  \"type\": \"object\",\n  \"properties\": {\n    \"title\": {\n      \"type\": \"string\",\n      \"displayName\": \"Title\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true,\n      \"propertyName\": \"title\"\n    },\n    \"textOne\": {\n      \"type\": \"string\",\n      \"displayName\": \"Text One\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true,\n      \"propertyName\": \"textOne\"\n    },\n    \"textTwo\": {\n      \"type\": \"string\",\n      \"displayName\": \"Text Two\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true,\n      \"propertyName\": \"textTwo\"\n    }\n  }\n}"
              },
              "nodeDescription" : {
                "value" : "Enter username and password"
              },
              "nodeTitle" : {
                "value" : "Sign On"
              },
              "outputSchema" : {
                "value" : {}
              },
              "textOne" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Welcome to \"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"variable.svg\",\n        \"url\": \"companyName\",\n        \"data\": \"{{global.variables.companyName}}\",\n        \"tooltip\": \"{{global.variables.companyName}}\",\n        \"children\": [\n          {\n            \"text\": \"companyName\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "title" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Sign On\"\n      }\n    ]\n  }\n]"
              },
              "validationRules" : {
                "value" : []
              }
            })
          }
          position = {
            x = 634
            y = 480
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
        "6p6muqqewx" = {
          data = {
            id               = "6p6muqqewx"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.functions.id
            connector_id     = "functionsConnector"
            capability_class = "backend"
            name             = "Functions"
            label            = "Functions"
            capability_name  = "AEqualsMultipleB"
            type             = "trigger"
            status           = "configured"
            properties = jsonencode({
              "leftValueA" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"status\",\n        \"data\": \"{{local.dnu7jt3sjz.payload.output.rawResponse.status}}\",\n        \"tooltip\": \"{{local.dnu7jt3sjz.payload.output.rawResponse.status}}\",\n        \"children\": [\n          {\n            \"text\": \"status\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeDescription" : {
                "value" : "Branches based on the password status returned by PingOne"
              },
              "nodeTitle" : {
                "value" : "Check Password Status"
              },
              "rightValueMultiple" : {
                "value" : [
                  {
                    "id" : "s6l99t4t39",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"OK\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "id" : "m3ii6p23fm",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"MUST_CHANGE_PASSWORD\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "id" : "ulnvuk7d7b",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"PASSWORD_EXPIRED\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 2464
            y = 480
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
        "6qs02z56rn" = {
          data = {
            id        = "6qs02z56rn"
            node_type = "EVAL"
          }
          position = {
            x = 2584
            y = 690
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
        "6qtawkceg5" = {
          data = {
            id        = "6qtawkceg5"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 454
            y = 2070
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
        "6sz8ydjx57" = {
          data = {
            id        = "6sz8ydjx57"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 1054
            y = 2250
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
        "6w3hc2i5ra" = {
          data = {
            id        = "6w3hc2i5ra"
            node_type = "EVAL"
            label     = "Evaluator"
            properties = jsonencode({
              "p2y85foy0y" : {
                "value" : "anyTriggersFalse"
              }
            })
          }
          position = {
            x = 2854
            y = 2070
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
        "71rhkgbc46" = {
          data = {
            id              = "71rhkgbc46"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "annotation" : {
                "value" : "Return p1UserId to calling flow"
              },
              "annotationTextColor" : {
                "value" : "#000000"
              },
              "backgroundColor" : {
                "value" : "#f2f3f4ff"
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
                "value" : true
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
            x = 514
            y = 4110
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
        "78ksftifan" = {
          data = {
            id              = "78ksftifan"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            id_unique       = "xlr493ohx3"
            properties = jsonencode({
              "annotation" : {
                "value" : "Input Schema: none"
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
            x = 214
            y = 2580
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
        "79aiikhgtb" = {
          data = {
            id               = "79aiikhgtb"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.error_message.id
            connector_id     = "errorConnector"
            capability_class = "backend"
            name             = "Error Message"
            label            = "Error Customize"
            capability_name  = "customErrorMessage"
            type             = "action"
            status           = "configured"
            id_unique        = "30gdqzg51v"
            properties = jsonencode({
              "errorCode" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \" Invalid username and/or password\"\n      }\n    ]\n  }\n]"
              },
              "errorDescription" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Failed to validate the password for the username submitted\"\n      }\n    ]\n  }\n]"
              },
              "errorMessage" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"Invalid username and/or password\"\n      }\n    ]\n  }\n]"
              },
              "errorReason" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Username was not found or password was invalid\"\n      }\n    ]\n  }\n]"
              },
              "nodeDescription" : {
                "value" : "Failed to validate the submitted password"
              },
              "nodeTitle" : {
                "value" : "Password check failed"
              }
            })
          }
          position = {
            x = 2134
            y = 840
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
        "7mtr7zq5h6" = {
          data = {
            id               = "7mtr7zq5h6"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.http.id
            connector_id     = "httpConnector"
            capability_class = "render"
            name             = "Http"
            label            = "Http"
            capability_name  = "customHTMLTemplate"
            type             = "trigger"
            status           = "configured"
            id_unique        = "8rsda1hj30"
            properties = jsonencode({
              "customCSS" : {
                "value" : ""
              },
              "customHTML" : {
                "value" : "\u003cdiv class=\"end-user-nano\"\u003e\n  \u003cdiv\n    class=\"bg-light d-flex flex-column justify-content-center align-items-center position-absolute top-0 start-0 bottom-0 end-0 overflow-auto\"\u003e\n    \u003cdiv style=\"max-width: 400px; min-width: 400px; width: 100%\"\u003e\n      \u003cdiv class=\"card shadow mb-5\"\u003e\n        \u003cdiv class=\"card-body p-5 d-flex flex-column\"\u003e\n          \u003cimg class=\"companyLogo align-self-center mb-5\" src=\"{{global.variables.companyLogo}}\" alt=\"{{global.variables.companyName}}\" /\u003e\n\n          \u003cdiv class=\"align-self-center mt-4 mb-3\"\u003e\n            \u003csvg width=\"153\" height=\"133\" viewBox=\"0 0 153 133\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"\u003e\n              \u003cg clip-path=\"url(#clip0_734_3343)\"\u003e\n                \u003cpath\n                  d=\"M6.30669 132.565C5.16116 132.565 4.17364 132.289 3.34412 131.775C2.47509 131.262 1.80358 130.551 1.32956 129.682C0.816049 128.892 0.539542 127.983 0.500041 126.996C0.46054 126.008 0.737047 124.981 1.32956 123.994L71.6019 2.80457C72.1944 1.85655 72.9055 1.18503 73.735 0.711019C74.5645 0.237006 75.5125 0 76.5 0C77.4876 0 78.4356 0.237006 79.2651 0.711019C80.0946 1.18503 80.8057 1.85655 81.3982 2.80457L151.671 123.994C152.263 124.981 152.54 126.008 152.5 126.996C152.461 127.983 152.184 128.892 151.671 129.682C151.197 130.551 150.525 131.262 149.656 131.775C148.787 132.289 147.799 132.565 146.693 132.565H6.30669ZM11.9553 123.599H141.045L76.5 12.2453L11.9553 123.599ZM77.0926 111.748C78.5146 111.748 79.6601 111.274 80.6082 110.326C81.5562 109.378 81.9907 108.193 81.9907 106.771C81.9907 105.349 81.5167 104.204 80.5687 103.256C79.6206 102.308 78.4356 101.873 77.0136 101.873C75.5915 101.873 74.446 102.347 73.498 103.295C72.5499 104.243 72.1154 105.428 72.1154 106.85C72.1154 108.272 72.5894 109.418 73.5375 110.366C74.4855 111.314 75.6705 111.748 77.0926 111.748ZM77.0926 92.3929C78.3566 92.3929 79.4231 91.9584 80.2921 91.0894C81.1217 90.2204 81.5562 89.1538 81.5562 87.8898V53.8399C81.5562 52.5759 81.1217 51.5094 80.2526 50.6403C79.3836 49.7713 78.3171 49.3368 77.0136 49.3368C75.71 49.3368 74.683 49.7713 73.814 50.6403C72.9845 51.5094 72.5499 52.5759 72.5499 53.8399V87.8898C72.5499 89.1538 72.9845 90.2204 73.8535 91.0894C74.7225 91.9584 75.789 92.3929 77.0926 92.3929Z\"\n                  fill=\"#A31300\" /\u003e\n              \u003c/g\u003e\n              \u003cdefs\u003e\n                \u003cclipPath id=\"clip0_734_3343\"\u003e\n                  \u003crect width=\"152\" height=\"132.565\" fill=\"white\" transform=\"translate(0.5)\" /\u003e\n                \u003c/clipPath\u003e\n              \u003c/defs\u003e\n            \u003c/svg\u003e\n          \u003c/div\u003e\n\n          {{#if title}}\n          \u003ch1 class=\"text-center my-4\"\u003e{{title}}\u003c/h1\u003e\n          {{/if}}\n\n          {{#if textOne}}\n          \u003cp class=\"text-muted text-center\"\u003e{{textOne}}\u003c/p\u003e\n          {{/if}}\n\n          {{#if textTwo}}\n          \u003cp class=\"text-muted text-center\"\u003e{{textTwo}}\u003c/p\u003e\n          {{/if}}\n\n          \u003cdiv class=\"d-flex flex-column\"\u003e\n            \u003cbutton data-id=\"back-button\" class=\"btn btn-primary mb-3\" data-skcomponent=\"skbutton\"\n              data-skbuttontype=\"next-event\" data-skbuttonvalue=\"BACK\" id=\"btnBack\"\u003e\n              Back to sign on\n            \u003c/button\u003e\n          \u003c/div\u003e\n\n        \u003c/div\u003e\n      \u003c/div\u003e\n    \u003c/div\u003e\n  \u003c/div\u003e\n\u003c/div\u003e"
              },
              "customScript" : {
                "value" : ""
              },
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
                "value" : "{\n    \"type\": \"object\",\n    \"properties\": {\n        \"title\": {\n            \"type\": \"string\",\n            \"displayName\": \"Title\",\n            \"preferredControlType\": \"textField\",\n            \"enableParameters\": true,\n            \"propertyName\": \"title\"\n        },\n\t\t\"textOne\": {\n            \"type\": \"string\",\n            \"displayName\": \"Text One\",\n            \"preferredControlType\": \"textField\",\n            \"enableParameters\": true,\n            \"propertyName\": \"textOne\"\n        },\n\t\t\"textTwo\": {\n            \"type\": \"string\",\n            \"displayName\": \"Text Two\",\n            \"preferredControlType\": \"textField\",\n            \"enableParameters\": true,\n            \"propertyName\": \"textTwo\"\n        }\n    }\n}"
              },
              "nodeDescription" : {
                "value" : "Account has been locked due to too many unsuccessful sign-on attempts"
              },
              "nodeTitle" : {
                "value" : "Account Locked"
              },
              "oeInteractionCacheExpire" : {
                "value" : false
              },
              "outputSchema" : {
                "value" : {}
              },
              "textOne" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"Your account has been locked due to too many unsuccessful sign-on attempts.\"\n      }\n    ]\n  }\n]"
              },
              "textTwo" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"functions.svg\",\n        \"url\": \"message\",\n        \"data\": \"{{local.o43vpz4na3.payload.output.message}}\",\n        \"tooltip\": \"{{local.o43vpz4na3.payload.output.message}}\",\n        \"children\": [\n          {\n            \"text\": \"message\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "title" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Account Locked\"\n      }\n    ]\n  }\n]"
              },
              "validationRules" : {
                "value" : []
              }
            })
          }
          position = {
            x = 934
            y = 3810
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
        "83vu4kprq4" = {
          data = {
            id               = "83vu4kprq4"
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
              "leftValueA" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"code\",\n        \"data\": \"{{local.dnu7jt3sjz.payload.error.code}}\",\n        \"tooltip\": \"{{local.dnu7jt3sjz.payload.error.code}}\",\n        \"children\": [\n          {\n            \"text\": \"code\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeTitle" : {
                "value" : "Is Locked Out?"
              },
              "rightValueB" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"passwordLockedOut\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 1834
            y = 630
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
        "886l7dx7um" = {
          data = {
            id               = "886l7dx7um"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.error_message.id
            connector_id     = "errorConnector"
            capability_class = "backend"
            name             = "Error Message"
            label            = "Error Customize"
            capability_name  = "customErrorMessage"
            type             = "action"
            status           = "configured"
            id_unique        = "1t533qsfsz"
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
            x = 1534
            y = 1620
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
        "8tr0nbjz2r" = {
          data = {
            id              = "8tr0nbjz2r"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node [2023-01-09]"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            id_unique       = "n0jc92tdiz"
            properties = jsonencode({
              "nodeInstanceId" : {
                "value" : "ofk8hitz8r"
              },
              "nodeTitle" : {
                "value" : "Go to Sign On Success"
              },
              "p1UserId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"teleport.svg\",\n        \"url\": \"p1UserId\",\n        \"data\": \"{{local.ercttap70x.payload.output.p1UserId}}\",\n        \"tooltip\": \"{{local.ercttap70x.payload.output.p1UserId}}\",\n        \"children\": [\n          {\n            \"text\": \"p1UserId\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 2134
            y = 1410
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
        "90xsitdwal" = {
          data = {
            id              = "90xsitdwal"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "annotation" : {
                "value" : "User Registration"
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
                "value" : 2000
              }
            })
          }
          position = {
            x = 214
            y = 2520
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
        "9gi11xivkc" = {
          data = {
            id               = "9gi11xivkc"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.http.id
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
              "customCSS" : {},
              "customHTML" : {
                "value" : "\u003cdiv class=\"end-user-nano\"\u003e\n  \u003cdiv\n    class=\"bg-light d-flex flex-column justify-content-center align-items-center position-absolute top-0 start-0 bottom-0 end-0 overflow-auto\"\u003e\n    \u003cdiv style=\"max-width: 400px; min-width: 400px; width: 100%\"\u003e\n      \u003cdiv class=\"card shadow mb-5\"\u003e\n        \u003cmain aria-labelledby=\"title\"\u003e\n          \u003cdiv class=\"card-body p-5 d-flex flex-column\"\u003e\n            \u003cimg class=\"companyLogo align-self-center mb-5\" src=\"{{global.variables.companyLogo}}\" alt=\"{{global.variables.companyName}}\" /\u003e\n\n            {{#if title}}\n            \u003ch1 id=\"title\" class=\"text-center mb-4\"\u003e{{title}}\u003c/h1\u003e\n            {{/if}}\n\n            {{#if textOne}}\n            \u003cp class=\"text-muted text-center\"\u003e{{textOne}}\u003c/p\u003e\n            {{/if}}\n\n            \u003c!-- Generic Error Message --\u003e\n            \u003cp class=\"text-danger mdi mdi-alert-circle text-center icon-padding\" data-id=\"feedback\" data-skcomponent=\"skerror\"\n              aria-live=\"assertive\"\u003e\u003c/p\u003e\n\n            \u003cp id=\"resendMessage\" class=\"text-success mdi mdi-check-circle text-center\"  \n              style=\"display: {{#if resendMessage}} block; {{else}} none; {{/if}}\" aria-live=\"assertive\"\u003e\n              \u003cspan class=\"ms-2\"\u003e{{resendMessage}}\u003c/span\u003e\u003c/p\u003e\n\n            \u003cform id=\"recoveryCodeForm\" data-id=\"recoveryCodeForm\"\u003e\n              \u003cdiv class=\"mb-4 form-floating\"\u003e\n                \u003cinput id=\"recoveryCode\" data-id=\"recoveryCode\" class=\"form-control\" type=\"text\" name=\"recoveryCode\"\n                    placeholder=\"Recovery Code\" autocomplete=\"one-time-code\" aria-describedby=\"recoveryCodeLabel\" /\u003e\n                \u003clabel id=\"recoveryCodeLabel\" data-id=\"recoveryCodeLabel\" class=\"form-label\" for=\"recoveryCode\"\u003e\n                    Recovery Code\n                  \u003c/label\u003e\n              \u003c/div\u003e\n              \u003cdiv id=\"newPasswordContainer\" class=\"mb-4 form-floating\"\u003e\n                \u003cinput id=\"newPassword\" data-id=\"newPassword\" class=\"form-control\" type=\"password\" name=\"newPassword\"\n                    placeholder=\"New Password\" autocomplete=\"new-password\" aria-describedby=\"newPasswordLabel\" /\u003e\n                \u003clabel id=\"newPasswordLabel\" data-id=\"newPasswordLabel\" class=\"form-label\" for=\"newPassword\"\u003e\n                    New Password\n                  \u003c/label\u003e\n              \u003c/div\u003e\n              \u003cdiv id=\"verifyPasswordContainer\" class=\"mb-4 form-floating\"\u003e\n                \u003cinput id=\"verifyNewPassword\" data-id=\"verifyNewPassword\" class=\"form-control\" type=\"password\"\n                    name=\"verifyNewPassword\" placeholder=\"Verify New Password\" autocomplete=\"new-password\"\n                    aria-describedby=\"verifyNewPasswordLabel\" /\u003e\n                \u003clabel id=\"verifyNewPasswordLabel\" class=\"form-label\" for=\"verifyNewPassword\"\u003eVerify New\n                    Password\u003c/label\u003e\n              \u003c/div\u003e\n              \u003cdiv class=\"d-flex flex-column\"\u003e\n                \u003cbutton id=\"submitBtn\" type=\"submit\" data-id=\"submitBtn\" class=\"btn btn-primary mb-3\" data-skcomponent=\"skbutton\"\n                    data-skbuttontype=\"form-submit\" data-skform=\"recoveryCodeForm\" data-skbuttonvalue=\"UPDATE\"\u003e\n                    Continue\n                \u003c/button\u003e\n                \u003cbutton id=\"resendBtn\" class=\"btn btn-link\" data-skcomponent=\"skbutton\"\n                    data-skbuttontype=\"next-event\" data-skbuttonvalue=\"RESEND\" type=\"button\"\u003e\n                    Resend recovery code\n                \u003c/button\u003e\n                \u003cbutton id=\"backBtn\" data-id=\"backBtn\" class=\"btn btn-link\" data-skcomponent=\"skbutton\"\n                    data-skbuttontype=\"next-event\" data-skform=\"recoveryCodeForm\" data-skbuttonvalue=\"CANCEL\" type=\"button\"\u003e\n                    Cancel\n                \u003c/button\u003e\n              \u003c/div\u003e\n            \u003c/form\u003e\n          \u003c/div\u003e\n        \u003c/main\u003e\n      \u003c/div\u003e\n    \u003c/div\u003e\n  \u003c/div\u003e\n\u003c/div\u003e"
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
                "value" : "{\n  \"type\": \"object\",\n  \"properties\": {\n    \"title\": {\n      \"type\": \"string\",\n      \"displayName\": \"Title\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    },\n    \"textOne\": {\n      \"type\": \"string\",\n      \"displayName\": \"Text One\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    },\n    \"resendMessage\": {\n      \"type\": \"string\",\n      \"displayName\": \"Resend Message\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    }\n  }\n}"
              },
              "nodeDescription" : {
                "value" : "Enter the recovery code and create a password to complete the reset"
              },
              "nodeTitle" : {
                "value" : "Forgot Password"
              },
              "outputSchema" : {
                "value" : {}
              },
              "resendMessage" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"teleport.svg\",\n        \"url\": \"resendMessage\",\n        \"data\": \"{{local.273gpisk0t.payload.output.resendMessage}}\",\n        \"tooltip\": \"{{local.273gpisk0t.payload.output.resendMessage}}\",\n        \"children\": [\n          {\n            \"text\": \"resendMessage\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
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
                "value" : []
              }
            })
          }
          position = {
            x = 1834
            y = 2070
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
        "9hip372enu" = {
          data = {
            id              = "9hip372enu"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingone.id
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
                  "username"
                ]
              },
              "nodeTitle" : {
                "value" : "Lookup User"
              },
              "userIdentifierForFindUser" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"username\",\n        \"data\": \"{{local.afyus0g868.payload.output.username}}\",\n        \"tooltip\": \"{{local.afyus0g868.payload.output.username}}\",\n        \"children\": [\n          {\n            \"text\": \"username\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 1234
            y = 2070
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
        "9hq9os87cl" = {
          data = {
            id               = "9hq9os87cl"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.error_message.id
            connector_id     = "errorConnector"
            capability_class = "backend"
            name             = "Error Message"
            label            = "Error Customize"
            capability_name  = "customErrorMessage"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "errorCallbackSuppress" : {
                "value" : true
              },
              "errorCode" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"httpResponseCode\",\n        \"data\": \"{{local.0c41v9ejkb.payload.error.httpResponseCode}}\",\n        \"tooltip\": \"{{local.0c41v9ejkb.payload.error.httpResponseCode}}\",\n        \"children\": [\n          {\n            \"text\": \"httpResponseCode\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "errorDescription" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Failed to update the user's password\"\n      }\n    ]\n  }\n]"
              },
              "errorMessage" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"message\",\n        \"data\": \"{{local.0c41v9ejkb.payload.error.message}}\",\n        \"tooltip\": \"{{local.0c41v9ejkb.payload.error.message}}\",\n        \"children\": [\n          {\n            \"text\": \"message\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeDescription" : {
                "value" : "Received an error when trying to update the user's password in PingOne"
              },
              "nodeTitle" : {
                "value" : "Password update failed"
              }
            })
          }
          position = {
            x = 1834
            y = 1620
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
        "9tfr3o22oe" = {
          data = {
            id              = "9tfr3o22oe"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingone.id
            connector_id    = "pingOneSSOConnector"
            name            = "PingOne"
            label           = "PingOne"
            capability_name = "sendRecoveryCode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "identifier" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"id\",\n        \"data\": \"{{local.9hip372enu.payload.output.matchedUser.id}}\",\n        \"tooltip\": \"{{local.9hip372enu.payload.output.matchedUser.id}}\",\n        \"children\": [\n          {\n            \"text\": \"id\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeTitle" : {
                "value" : "Send Recovery Code"
              }
            })
          }
          position = {
            x = 1534
            y = 2070
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
        "afyus0g868" = {
          data = {
            id               = "afyus0g868"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.http.id
            connector_id     = "httpConnector"
            capability_class = "render"
            name             = "Http"
            label            = "Http"
            capability_name  = "customHTMLTemplate"
            type             = "trigger"
            status           = "configured"
            id_unique        = "4ku0h03hy3"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#afd5ffff"
              },
              "customCSS" : {
                "value" : "@keyframes fadeOut {\n    0% {\n        opacity: 1;\n        visibility: visible;\n    }\n    80% {\n        opacity: .8;\n        visibility: visible;\n    }\n\n    100% {\n        opacity: 0;\n        visibility: hidden;\n        max-height: 0;\n    }\n}\n\n.fade {\n    overflow: hidden;\n    animation: fadeOut 20s forwards;\n}"
              },
              "customHTML" : {
                "value" : "\u003cdiv class=\"end-user-nano\"\u003e\n  \u003cdiv\n    class=\"bg-light d-flex flex-column justify-content-center align-items-center position-absolute top-0 start-0 bottom-0 end-0 overflow-auto\"\u003e\n    \u003cdiv style=\"max-width: 400px; min-width: 400px; width: 100%\"\u003e\n      \u003cdiv class=\"card shadow mb-5\"\u003e\n        \u003cmain aria-labelledby=\"title\"\u003e\n          \u003cdiv class=\"card-body p-5 d-flex flex-column\"\u003e\n            \u003cimg class=\"companyLogo align-self-center mb-5\" src=\"{{global.variables.companyLogo}}\" alt=\"{{global.variables.companyName}}\"\u003e\n\n            {{#if title}}\n            \u003ch1 id=\"title\" class=\"text-center mb-4\"\u003e{{title}}\u003c/h1\u003e\n            {{/if}}\n\n            {{#if textOne}}\n            \u003cp class=\"text-muted text-center\"\u003e{{textOne}}\u003c/p\u003e\n            {{/if}}\n\n            {{#if textTwo}}\n            \u003cp class=\"text-muted text-center\"\u003e{{textTwo}}\u003c/p\u003e\n            {{/if}}\n\n            \u003c!-- Generic Error Message --\u003e\n            \u003cp class=\"text-danger mdi mdi-alert-circle text-center\" id=\"feedbackError\" data-id=\"feedback\"\n              data-skcomponent=\"skerror\" aria-live=\"assertive\"\u003e\u003c/p\u003e\n\n            \u003c!-- Username Error Message --\u003e\n            \u003cp class=\"text-danger mdi mdi-alert-circle text-center icon-padding\" data-skerrorid=\"username\" data-skcomponent=\"skerrormessage\" aria-live=\"assertive\"\u003e\u003c/p\u003e\n\n            {{#if userMessage}}\n            \u003cp class=\"text-info text-center fade\" aria-live=\"assertive\"\u003e{{userMessage}}\u003c/p\u003e\n            {{/if}}\n\n            \u003cform id=\"usernameForm\" aria-labelledby=\"title\" data-id=\"usernameForm\"\u003e\n              \u003cdiv class=\"mb-4 form-floating\"\u003e\n                \u003cinput class=\"form-control\" id=\"username\" name=\"username\" placeholder=\"Username\"\n                  data-id=\"username-input\" aria-required=\"true\"\n                  aria-describedby=\"usernameLabel\" /\u003e\n                \u003clabel id=\"usernameLabel\" for=\"username\"\u003eUsername\u003c/label\u003e\n              \u003c/div\u003e\n              \u003cdiv class=\"d-flex flex-column\"\u003e          \n                \u003cbutton data-id=\"button\" type=\"submit\" class=\"btn btn-primary mb-3\" data-skcomponent=\"skbutton\"\n                  data-skbuttontype=\"form-submit\" id=\"btnContinue\" data-skform=\"usernameForm\"\n                  data-skbuttonvalue=\"CONTINUE\"\u003e\n                  Continue\n                \u003c/button\u003e\n                \u003cbutton class=\"btn btn-link\" data-skcomponent=\"skbutton\" data-skbuttontype=\"next-event\"\n                  data-skbuttonvalue=\"CANCEL\" id=\"btnCancel\"\u003e\n                  Back\n                \u003c/button\u003e\n              \u003c/div\u003e\n            \u003c/form\u003e\n          \u003c/div\u003e\n        \u003c/main\u003e\n      \u003c/div\u003e\n    \u003c/div\u003e\n  \u003c/div\u003e\n\u003c/div\u003e\n"
              },
              "customScript" : {
                "value" : "const setFieldFocus = (id) =\u003e {\n    const element = document.getElementById(id);\n    if (element) {\n        element.focus();\n    }\n}\n\nconst start = () =\u003e {\n    setFieldFocus(\"username\")\n}\n\nif (document.readyState === \"loading\") {\n    // Loading hasn't finished yet\n    document.addEventListener(\"DOMContentLoaded\", start);\n} else {\n    // `DOMContentLoaded` has already fired\n    start();\n}"
              },
              "formFieldsList" : {
                "value" : [
                  {
                    "displayName" : "Username",
                    "hashedVisibility" : false,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "username",
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
                "value" : "{\n  \"type\": \"object\",\n  \"properties\": {\n    \"title\": {\n      \"type\": \"string\",\n      \"displayName\": \"Title\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    },\n    \"textOne\": {\n      \"type\": \"string\",\n      \"displayName\": \"Text One\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    },\n    \"textTwo\": {\n      \"type\": \"string\",\n      \"displayName\": \"Text Two\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    },\n    \"userMessage\": {\n      \"type\": \"string\",\n      \"displayName\": \"User Message\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    }\n  }\n}"
              },
              "nodeDescription" : {
                "value" : "Enter username to receive password reset instructions"
              },
              "nodeTitle" : {
                "value" : "Enter Username"
              },
              "outputSchema" : {
                "value" : {}
              },
              "textOne" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Enter your username to receive a recovery code that will let you change your password.\"\n      }\n    ]\n  }\n]"
              },
              "title" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Recover Your Account\"\n      }\n    ]\n  }\n]"
              },
              "validationRules" : {
                "value" : [
                  {
                    "propertyName" : "username",
                    "rules" : [
                      {
                        "message" : "Please enter your username",
                        "ruleName" : "presence"
                      }
                    ]
                  }
                ]
              }
            })
          }
          position = {
            x = 634
            y = 2070
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
        "api6sr22l0" = {
          data = {
            id              = "api6sr22l0"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            id_unique       = "940rm8qjb1"
            properties = jsonencode({
              "annotation" : {
                "value" : "Input Schema: none"
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
            x = 244
            y = 1890
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
        "ar0n0chx6u" = {
          data = {
            id        = "ar0n0chx6u"
            node_type = "EVAL"
          }
          position = {
            x = 1054
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
        "bttgkrchj0" = {
          data = {
            id               = "bttgkrchj0"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.functions.id
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
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"buttonValue\",\n        \"data\": \"{{local.9gi11xivkc.payload.output.buttonValue}}\",\n        \"tooltip\": \"{{local.9gi11xivkc.payload.output.buttonValue}}\",\n        \"children\": [\n          {\n            \"text\": \"buttonValue\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
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
            x = 2134
            y = 2070
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
        "bviv3cclyg" = {
          data = {
            id              = "bviv3cclyg"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node [2023-01-09]"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "nodeInstanceId" : {
                "value" : "yxikxi5l6o"
              },
              "nodeTitle" : {
                "value" : "Go to Forgot Password"
              }
            })
          }
          position = {
            x = 1234
            y = 870
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
        "bznbtmirmf" = {
          data = {
            id        = "bznbtmirmf"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 1924
            y = 2700
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
        "c28j6unuv1" = {
          data = {
            id               = "c28j6unuv1"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.http.id
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
                "value" : "\u003cdiv class=\"end-user-nano\"\u003e\n    \u003cdiv\n        class=\"bg-light d-flex flex-column justify-content-center align-items-center position-absolute top-0 start-0 bottom-0 end-0 overflow-auto\"\u003e\n        \u003cdiv style=\"max-width: 400px; min-width: 400px; width: 100%\"\u003e\n            \u003cdiv class=\"card shadow mb-5\"\u003e\n                \u003cdiv class=\"card-body p-5 d-flex flex-column\"\u003e\n                    \u003cimg class=\"companyLogo align-self-center mb-5\" src=\"{{global.variables.companyLogo}}\" alt=\"{{global.variables.companyName}}\" /\u003e\n\n                    {{#if title}}\n                    \u003ch1 class=\"text-center mb-4\"\u003e{{title}}\u003c/h1\u003e\n                    {{/if}}\n\n                    \u003cdiv class=\"mx-auto mt-3 mb-4\"\u003e\n                        \u003csvg class=\"checkmark\" xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 52 52\"\u003e\n                            \u003ccircle class=\"checkmarkCircle\" cx=\"26\" cy=\"26\" r=\"25\" fill=\"none\" /\u003e\n                            \u003cpath class=\"checkmarkCheck\" fill=\"none\" d=\"M14.1 27.2l7.1 7.2 16.7-16.8\" /\u003e\n                        \u003c/svg\u003e\n                    \u003c/div\u003e\n\n                    {{#if textOne}}\n                    \u003cp class=\"text-muted text-center\"\u003e{{textOne}}\u003c/p\u003e\n                    {{/if}}\n\n                    {{#if textTwo}}\n                    \u003cp class=\"text-muted text-center\"\u003e{{textTwo}}\u003c/p\u003e\n                    {{/if}}\n\n                    \u003cp class=\"text-danger mdi mdi-alert-circle icon-padding\" data-id=\"feedback\" data-skcomponent=\"skerror\"\u003e\u003c/p\u003e\n\n                    \u003cdiv class=\"d-flex flex-column\"\u003e\n                        \u003cbutton id=\"submitBtn\" data-id=\"submitBtn\" class=\"btn btn-primary mb-3\" data-skcomponent=\"skbutton\"\n                        data-skbuttontype=\"next-event\" data-skbuttonvalue=\"NEXT\" \u003e\n                        Continue\n                        \u003c/button\u003e\n                    \u003c/div\u003e\n                \u003c/div\u003e\n            \u003c/div\u003e\n        \u003c/div\u003e\n    \u003c/div\u003e\n\u003c/div\u003e"
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
                "value" : "Password has been reset successfully"
              },
              "nodeTitle" : {
                "value" : "Password Reset Success"
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
            x = 3634
            y = 2070
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
        "coc8d1r51c" = {
          data = {
            id        = "coc8d1r51c"
            node_type = "EVAL"
          }
          position = {
            x = 2584
            y = 480
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
        "cqm26fxq1v" = {
          data = {
            id              = "cqm26fxq1v"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingone.id
            connector_id    = "pingOneSSOConnector"
            name            = "PingOne"
            label           = "PingOne SSO"
            capability_name = "userLookup"
            type            = "action"
            status          = "configured"
            id_unique       = "qdjikxg105"
            properties = jsonencode({
              "identifier" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"username\",\n        \"data\": \"{{local.howu8n9hsc.payload.output.username}}\",\n        \"tooltip\": \"{{local.howu8n9hsc.payload.output.username}}\",\n        \"children\": [\n          {\n            \"text\": \"username\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "matchAttributes" : {
                "value" : [
                  "username"
                ]
              },
              "nodeDescription" : {
                "value" : "Attempts to find the user in PingOne by the submitted username"
              },
              "nodeTitle" : {
                "value" : "User Lookup"
              },
              "userIdentifierForFindUser" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"username\",\n        \"data\": \"{{local.65u7m8cm28.payload.output.username}}\",\n        \"tooltip\": \"{{local.65u7m8cm28.payload.output.username}}\",\n        \"children\": [\n          {\n            \"text\": \"username\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "userLookup_localizedErrors" : {
                "properties" : {
                  "en" : {
                    "value" : []
                  }
                }
              }
            })
          }
          position = {
            x = 1234
            y = 480
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
        "df9ia9vsmb" = {
          data = {
            id              = "df9ia9vsmb"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "annotation" : {
                "value" : "Sign On Success"
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
                "value" : 600
              }
            })
          }
          position = {
            x = 214
            y = 3990
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
        "dniadms1az" = {
          data = {
            id               = "dniadms1az"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.functions.id
            connector_id     = "functionsConnector"
            capability_class = "backend"
            name             = "Functions"
            label            = "Functions"
            capability_name  = "AEqualsMultipleB"
            type             = "trigger"
            status           = "configured"
            properties = jsonencode({
              "leftValueA" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"buttonValue\",\n        \"data\": \"{{local.65u7m8cm28.payload.output.buttonValue}}\",\n        \"tooltip\": \"{{local.65u7m8cm28.payload.output.buttonValue}}\",\n        \"children\": [\n          {\n            \"text\": \"buttonValue\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeDescription" : {
                "value" : "Check which button was clicked"
              },
              "nodeTitle" : {
                "value" : "Sign On Form Button Action"
              },
              "rightValueB" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"submit\"\n      }\n    ]\n  }\n]"
              },
              "rightValueMultiple" : {
                "value" : [
                  {
                    "id" : "vgii63uk2p",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"SIGNON\"\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "id" : "js0k5824y5",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"REGISTER\"\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "id" : "qtli5t2v0s",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"TROUBLE\"\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 934
            y = 480
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
        "dnu7jt3sjz" = {
          data = {
            id              = "dnu7jt3sjz"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingone.id
            connector_id    = "pingOneSSOConnector"
            name            = "PingOne"
            label           = "PingOne SSO"
            capability_name = "checkPassword"
            type            = "action"
            status          = "configured"
            id_unique       = "0re8wbsb52"
            properties = jsonencode({
              "checkPassword_localizedErrors" : {
                "properties" : {
                  "en" : {
                    "value" : []
                  }
                }
              },
              "identifier" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"id\",\n        \"data\": \"{{local.cqm26fxq1v.payload.output.matchedUser.id}}\",\n        \"tooltip\": \"{{local.cqm26fxq1v.payload.output.matchedUser.id}}\",\n        \"children\": [\n          {\n            \"text\": \"id\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "matchAttribute" : {
                "value" : "id"
              },
              "nodeDescription" : {
                "value" : "Validates that the user submitted the correct password for the account associated with the username"
              },
              "nodeTitle" : {
                "value" : "Validate Password"
              },
              "password" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"password\",\n        \"data\": \"{{local.65u7m8cm28.payload.output.password}}\",\n        \"tooltip\": \"{{local.65u7m8cm28.payload.output.password}}\",\n        \"children\": [\n          {\n            \"text\": \"password\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "userId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"id\",\n        \"data\": \"{{local.icv9ot1nro.payload.output.matchedUser.id}}\",\n        \"tooltip\": \"{{local.icv9ot1nro.payload.output.matchedUser.id}}\",\n        \"children\": [\n          {\n            \"text\": \"id\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 1534
            y = 480
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
        "dpo5892st9" = {
          data = {
            id              = "dpo5892st9"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "startNode"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "inputSchema" : {
                "value" : "{\n\t\"type\": \"object\",\n\t\"properties\": {\n\t\t\"success\": {\n\t\t\t\"type\": \"boolean\",\n\t\t\t\"displayName\": \"success\",\n\t\t\t\"preferredControlType\": \"textField\",\n\t\t\t\"enableParameters\": true,\n\t\t\t\"propertyName\": \"success\"\n\t\t}\n\t}\n}"
              },
              "nodeTitle" : {
                "value" : "Sign On Start"
              }
            })
          }
          position = {
            x = 334
            y = 360
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
        "dqya4pmlto" = {
          data = {
            id        = "dqya4pmlto"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 1054
            y = 1620
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
        "drxy3yocag" = {
          data = {
            id        = "drxy3yocag"
            node_type = "EVAL"
          }
          position = {
            x = 754
            y = 1410
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
        "dyx8hpj5xg" = {
          data = {
            id        = "dyx8hpj5xg"
            node_type = "EVAL"
          }
          position = {
            x = 754
            y = 3210
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
        "e43svetjr5" = {
          data = {
            id              = "e43svetjr5"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "nodeInstanceId" : {
                "value" : "dpo5892st9"
              },
              "nodeTitle" : {
                "value" : "Go to Start"
              }
            })
          }
          position = {
            x = 2434
            y = 2400
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
        "enx05mvp8c" = {
          data = {
            id        = "enx05mvp8c"
            node_type = "EVAL"
          }
          position = {
            x = 1054
            y = 480
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
        "ercttap70x" = {
          data = {
            id              = "ercttap70x"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node [2023-01-09]"
            capability_name = "startNode"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "inputSchema" : {
                "value" : "{\n\t\"type\": \"object\",\n\t\"properties\": {\n\t\t\"p1UserId\": {\n\t\t\t\"type\": \"string\",\n\t\t\t\"displayName\": \"PingOne User Id\",\n\t\t\t\"preferredControlType\": \"textField\",\n\t\t\t\"enableParameters\": true,\n\t\t\t\"propertyName\": \"p1UserId\"\n\t\t}\n\t}\n}"
              },
              "nodeTitle" : {
                "value" : "Reset Password"
              }
            })
          }
          position = {
            x = 334
            y = 1410
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
        "ez2e9cu7td" = {
          data = {
            id              = "ez2e9cu7td"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "nodeInstanceId" : {
                "value" : "dpo5892st9"
              }
            })
          }
          position = {
            x = 1234
            y = 2250
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
        "ez2jj0j1q7" = {
          data = {
            id               = "ez2jj0j1q7"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.http.id
            connector_id     = "httpConnector"
            capability_class = "backend"
            name             = "Http"
            label            = "Http"
            capability_name  = "createSuccessResponse"
            type             = "action"
            status           = "configured"
            id_unique        = "00surhcg33"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#9dc967ff"
              },
              "claimsNameValuePairs" : {
                "value" : [
                  {
                    "key" : 0.20203729097792777,
                    "label" : "p1UserId (string - flowInstance)",
                    "name" : "p1UserId",
                    "nameDefault" : "p1UserId",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"teleport.svg\",\n        \"url\": \"p1UserId\",\n        \"data\": \"{{local.ofk8hitz8r.payload.output.p1UserId}}\",\n        \"tooltip\": \"{{local.ofk8hitz8r.payload.output.p1UserId}}\",\n        \"children\": [\n          {\n            \"text\": \"p1UserId\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "key" : 0.5510569545803072,
                    "label" : "authMethod (string - flowInstance)",
                    "name" : "authMethod",
                    "type" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"pwd\"\n      }\n    ]\n  }\n]"
                  }
                ]
              },
              "nodeTitle" : {
                "value" : "Success"
              },
              "oeInteractionCacheExpire" : {
                "value" : true
              }
            })
          }
          position = {
            x = 634
            y = 4200
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
        "f5gokcacx1" = {
          data = {
            id        = "f5gokcacx1"
            node_type = "EVAL"
            label     = "Evaluator"
            properties = jsonencode({
              "79aiikhgtb" : {
                "value" : "anyTriggersFalse"
              }
            })
          }
          position = {
            x = 1954
            y = 630
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
        "fdwqk6gwcr" = {
          data = {
            id        = "fdwqk6gwcr"
            node_type = "EVAL"
          }
          position = {
            x = 1954
            y = 2070
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
        "ffka4ssodt" = {
          data = {
            id        = "ffka4ssodt"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 1054
            y = 3510
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
        "flfi8l5inc" = {
          data = {
            id        = "flfi8l5inc"
            node_type = "EVAL"
            properties = jsonencode({
              "79aiikhgtb" : {
                "value" : "anyTriggersFalse"
              },
              "dnu7jt3sjz" : {
                "value" : "allTriggersTrue"
              },
              "l9sribk1l0" : {
                "value" : "anyTriggersFalse"
              }
            })
          }
          position = {
            x = 1354
            y = 480
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
        "flvyg2xnyx" = {
          data = {
            id              = "flvyg2xnyx"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            id_unique       = "31w82ae734"
            properties = jsonencode({
              "annotation" : {
                "value" : "Password Reset"
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
                "value" : 2000
              }
            })
          }
          position = {
            x = 244
            y = 1230
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
        "fnk14wxu53" = {
          data = {
            id        = "fnk14wxu53"
            node_type = "EVAL"
          }
          position = {
            x = 454
            y = 3210
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
        "g5zcju90lh" = {
          data = {
            id              = "g5zcju90lh"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "startNode"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "inputSchema" : {
                "value" : "{\n\t\"type\": \"object\",\n\t\"properties\": {\n\t\t\"p1UserId\": {\n\t\t\t\"type\": \"string\",\n\t\t\t\"displayName\": \"PingOne User Id\",\n\t\t\t\"preferredControlType\": \"textField\",\n\t\t\t\"enableParameters\": true,\n\t\t\t\"propertyName\": \"p1UserId\"\n\t\t},\n\t\t\"email\": {\n\t\t\t\"type\": \"string\",\n\t\t\t\"displayName\": \"Email\",\n\t\t\t\"preferredControlType\": \"textField\",\n\t\t\t\"enableParameters\": true,\n\t\t\t\"propertyName\": \"email\"\n\t\t},\n\t\t\"resendMessage\": {\n\t\t\t\"type\": \"string\",\n\t\t\t\"displayName\": \"Resend Message\",\n\t\t\t\"preferredControlType\": \"textField\",\n\t\t\t\"enableParameters\": true,\n\t\t\t\"propertyName\": \"resendMessage\"\n\t\t}\n\t}\n}"
              },
              "nodeTitle" : {
                "value" : "Account Verification"
              }
            })
          }
          position = {
            x = 334
            y = 3210
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
        "g62tgfk1ui" = {
          data = {
            id        = "g62tgfk1ui"
            node_type = "EVAL"
          }
          position = {
            x = 1954
            y = 1410
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
        "gfn4owly2t" = {
          data = {
            id        = "gfn4owly2t"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 1054
            y = 3810
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
        "guw4ri0ley" = {
          data = {
            id               = "guw4ri0ley"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.functions.id
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
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"buttonValue\",\n        \"data\": \"{{local.yscz5j5r84.payload.output.buttonValue}}\",\n        \"tooltip\": \"{{local.yscz5j5r84.payload.output.buttonValue}}\",\n        \"children\": [\n          {\n            \"text\": \"buttonValue\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeDescription" : {
                "value" : "Check which button was clicked"
              },
              "nodeTitle" : {
                "value" : "Change Password Form Button Action"
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
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"CANCEL\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 934
            y = 1410
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
        "h2cy2gkjip" = {
          data = {
            id               = "h2cy2gkjip"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.http.id
            connector_id     = "httpConnector"
            capability_class = "render"
            name             = "Http"
            label            = "Http"
            capability_name  = "customHTMLTemplate"
            type             = "trigger"
            status           = "configured"
            id_unique        = "p3z6662uwb"
            properties = jsonencode({
              "backgroundColor" : {
                "value" : "#afd5ffff"
              },
              "customCSS" : {
                "value" : ":root {\n  --animation-dimension: 100px;\n  --animation-start-color: #71e171;\n  --animation-midway-color: #67d067;\n  --animation-finish-color: #59b259;\n}\n\n.checkmark {\n  width: var(--animation-dimension);\n  height: var(--animation-dimension);\n  border-radius: 50%;\n  display: block;\n  stroke-width: 5;\n  stroke: #ffffff;\n  stroke-miterlimit: 10;\n  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);\n  animation: fill 0.4s ease-in-out 0.4s forwards,\n    scale 0.3s ease-in-out 0.9s both;\n}\n\n.checkmarkCircle {\n  stroke-dasharray: 166;\n  stroke-dashoffset: 166;\n  stroke-width: 5;\n  stroke-miterlimit: 10;\n  stroke: var(--animation-finish-color);\n  fill: none;\n  animation: stroke 0.6s cubic-bezier(0.65, 0, 0.45, 1) forwards,\n    colorChange 1.2s ease-in-out forwards;\n}\n\n.checkmarkCheck {\n  transform-origin: 50% 50%;\n  stroke-dasharray: 48;\n  stroke-dashoffset: 48;\n  animation: stroke 0.3s cubic-bezier(0.65, 0, 0.45, 1) 0.8s forwards,\n    colorChange 0.6s ease-in-out 0.8s forwards;\n}\n\n@keyframes colorChange {\n  0% {\n    stroke: var(--animation-start-color);\n  }\n  50% {\n    stroke: var(--animation-midway-color);\n  } \n  100% {\n    stroke: var(--animation-finish-color);\n  }\n}\n\n@keyframes stroke {\n  100% {\n    stroke-dashoffset: 0;\n  }\n}\n@keyframes scale {\n  0%,\n  100% {\n    transform: none;\n  }\n  50% {\n    transform: scale3d(1.1, 1.1, 1);\n  }\n  70% {\n    transform: scale3d(0.98, 0.98, 1);\n  }\n  85% {\n    transform: scale3d(1.02, 1.02, 1);\n  }\n}\n@keyframes fill {\n  100% {\n    box-shadow: inset 0px 0px 0px 0px var(--animation-finish-color);\n  }\n}"
              },
              "customHTML" : {
                "value" : "\u003cdiv class=\"end-user-nano\"\u003e\n    \u003cdiv\n        class=\"bg-light d-flex flex-column justify-content-center align-items-center position-absolute top-0 start-0 bottom-0 end-0 overflow-auto\"\u003e\n        \u003cdiv style=\"max-width: 400px; min-width: 400px; width: 100%\"\u003e\n            \u003cdiv class=\"card shadow mb-5\"\u003e\n                \u003cdiv class=\"card-body p-5 d-flex flex-column\"\u003e\n                    \u003cimg class=\"companyLogo align-self-center mb-5\" src=\"{{global.variables.companyLogo}}\" alt=\"{{global.variables.companyName}}\" /\u003e\n\n                    {{#if title}}\n                    \u003ch1 class=\"text-center mb-4\"\u003e{{title}}\u003c/h1\u003e\n                    {{/if}}\n\n                    \u003cdiv class=\"mx-auto mt-3 mb-4\"\u003e\n                        \u003csvg class=\"checkmark\" xmlns=\"http://www.w3.org/2000/svg\" viewbox=\"0 0 52 52\"\u003e\n                            \u003ccircle class=\"checkmarkCircle\" cx=\"26\" cy=\"26\" r=\"25\" fill=\"none\" /\u003e\n                            \u003cpath class=\"checkmarkCheck\" fill=\"none\" d=\"M14.1 27.2l7.1 7.2 16.7-16.8\" /\u003e\n                        \u003c/svg\u003e\n                    \u003c/div\u003e\n\n                    {{#if textOne}}\n                    \u003cp class=\"text-muted text-center\"\u003e{{textOne}}\u003c/p\u003e\n                    {{/if}}\n\n                    {{#if textTwo}}\n                    \u003cp class=\"text-muted text-center\"\u003e{{textTwo}}\u003c/p\u003e\n                    {{/if}}\n\n                    \u003cp class=\"text-danger mdi mdi-alert-circle icon-padding\" data-id=\"feedback\" data-skcomponent=\"skerror\"\u003e\u003c/p\u003e\n\n                    \u003cdiv class=\"d-flex flex-column\"\u003e\n                        \u003cbutton id=\"submitBtn\" data-id=\"submitBtn\" class=\"btn btn-primary mb-3\" data-skcomponent=\"skbutton\"\n                        data-skbuttontype=\"next-event\" data-skbuttonvalue=\"NEXT\" \u003e\n                        Continue\n                        \u003c/button\u003e\n                    \u003c/div\u003e\n\n                \u003c/div\u003e\n            \u003c/div\u003e\n        \u003c/div\u003e\n    \u003c/div\u003e\n\u003c/div\u003e"
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
                "value" : "{\n    \"type\": \"object\",\n    \"properties\": {\n        \"title\": {\n            \"type\": \"string\",\n            \"displayName\": \"Title\",\n            \"preferredControlType\": \"textField\",\n            \"enableParameters\": true,\n            \"propertyName\": \"title\"\n        },\n\t\"textOne\": {\n            \"type\": \"string\",\n            \"displayName\": \"Text One\",\n            \"preferredControlType\": \"textField\",\n            \"enableParameters\": true,\n            \"propertyName\": \"textOne\"\n        },\n\t\"textTwo\": {\n            \"type\": \"string\",\n            \"displayName\": \"Text Two\",\n            \"preferredControlType\": \"textField\",\n            \"enableParameters\": true,\n            \"propertyName\": \"textTwo\"\n        }\n    }\n}"
              },
              "nodeDescription" : {
                "value" : "Account has been successfully created"
              },
              "nodeTitle" : {
                "value" : "Registration Success"
              },
              "oeInteractionCacheExpire" : {
                "value" : false
              },
              "textOne" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Your account has been successfully created.\"\n      }\n    ]\n  }\n]"
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
            x = 1804
            y = 2700
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
        "h2zhng35ze" = {
          data = {
            id              = "h2zhng35ze"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "errorDetails" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"details\",\n        \"data\": \"{{local.dnu7jt3sjz.payload.error.details}}\",\n        \"tooltip\": \"{{local.dnu7jt3sjz.payload.error.details}}\",\n        \"children\": [\n          {\n            \"text\": \"details\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeInstanceId" : {
                "value" : "2xzcvx1gll"
              }
            })
          }
          position = {
            x = 2134
            y = 630
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
        "h60qt36yj7" = {
          data = {
            id              = "h60qt36yj7"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "annotation" : {
                "value" : "PingOne Sign On with Registration, Password Reset and Recovery"
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
                "value" : 2700
              }
            })
          }
          position = {
            x = 244
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
        "h8ydk3i4o5" = {
          data = {
            id              = "h8ydk3i4o5"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "nodeInstanceId" : {
                "value" : "ofk8hitz8r"
              },
              "p1UserId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"id\",\n        \"data\": \"{{local.x0txd3bdfn.payload.output.user.id}}\",\n        \"tooltip\": \"{{local.x0txd3bdfn.payload.output.user.id}}\",\n        \"children\": [\n          {\n            \"text\": \"id\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 2134
            y = 2700
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
        "hhnqmctxod" = {
          data = {
            id        = "hhnqmctxod"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 454
            y = 2700
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
        "jmzjeq5oev" = {
          data = {
            id               = "jmzjeq5oev"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.error_message.id
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
            x = 3634
            y = 2250
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
        "js4vlc2b5n" = {
          data = {
            id              = "js4vlc2b5n"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            id_unique       = "d2mbrib33f"
            properties = jsonencode({
              "annotation" : {
                "value" : "Input Schema: p1UserId"
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
            x = 214
            y = 4050
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
        "loevzm0utd" = {
          data = {
            id              = "loevzm0utd"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingone.id
            connector_id    = "pingOneSSOConnector"
            name            = "PingOne"
            label           = "PingOne - Template"
            capability_name = "verifyEmail"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "identifier" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"teleport.svg\",\n        \"url\": \"p1UserId\",\n        \"data\": \"{{local.g5zcju90lh.payload.output.p1UserId}}\",\n        \"tooltip\": \"{{local.g5zcju90lh.payload.output.p1UserId}}\",\n        \"children\": [\n          {\n            \"text\": \"p1UserId\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeDescription" : {
                "value" : "Sends The Verification Code To PingOne To Validate"
              },
              "nodeTitle" : {
                "value" : "Validate verification code"
              },
              "verificationCode" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"passcode\",\n        \"data\": \"{{local.o4yhix414e.payload.output.passcode}}\",\n        \"tooltip\": \"{{local.o4yhix414e.payload.output.passcode}}\",\n        \"children\": [\n          {\n            \"text\": \"passcode\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "verifyEmail_localizedErrors" : {
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
                        "key" : "noUserMatch",
                        "value" : ""
                      },
                      {
                        "key" : "verificationCode",
                        "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Invalid verification code\"\n      }\n    ]\n  }\n]"
                      },
                      {
                        "key" : "invalidValue",
                        "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Invalid verification code\"\n      }\n    ]\n  }\n]"
                      },
                      {
                        "key" : "emptyValue",
                        "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Enter verification code\"\n      }\n    ]\n  }\n]"
                      }
                    ]
                  }
                }
              }
            })
          }
          position = {
            x = 1234
            y = 3210
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
        "m2ey3u07aj" = {
          data = {
            id        = "m2ey3u07aj"
            node_type = "EVAL"
          }
          position = {
            x = 754
            y = 2700
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
        "m4oszi4z7z" = {
          data = {
            id        = "m4oszi4z7z"
            node_type = "EVAL"
            label     = "Evaluator"
            properties = jsonencode({
              "9hq9os87cl" : {
                "value" : "anyTriggersFalse"
              }
            })
          }
          position = {
            x = 1654
            y = 1410
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
        "m6swm3bdx3" = {
          data = {
            id              = "m6swm3bdx3"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "annotation" : {
                "value" : "Account Verification"
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
                "value" : 1400
              }
            })
          }
          position = {
            x = 214
            y = 3030
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
        "mnljicn2pk" = {
          data = {
            id        = "mnljicn2pk"
            node_type = "EVAL"
            properties = jsonencode({
              "9tfr3o22oe" : {
                "value" : "always"
              },
              "pizhzcu1r8" : {
                "value" : "always"
              }
            })
          }
          position = {
            x = 1354
            y = 2070
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
        "mxhmh9d4ym" = {
          data = {
            id               = "mxhmh9d4ym"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.functions.id
            connector_id     = "functionsConnector"
            capability_class = "backend"
            name             = "Functions"
            label            = "Functions"
            capability_name  = "customFunction"
            type             = "trigger"
            status           = "configured"
            id_unique        = "t2tbl0eily"
            properties = jsonencode({
              "code" : {
                "value" : "// Test to ensure passwords match\nmodule.exports = a = async ({ params }) =\u003e {\n\tconst newPassword = params.newPassword;\n\tconst verifyNewPassword = params.verifyNewPassword;\n\n\tif (!newPassword || !verifyNewPassword || (newPassword !== verifyNewPassword)) {\n\t\treturn false;\n\t}\n\n\treturn { \"success\": true};\n}"
              },
              "nodeDescription" : {
                "value" : "Verify new passwords match before setting"
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
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"newPassword\",\n        \"data\": \"{{local.yscz5j5r84.payload.output.newPassword}}\",\n        \"tooltip\": \"{{local.yscz5j5r84.payload.output.newPassword}}\",\n        \"children\": [\n          {\n            \"text\": \"newPassword\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "name" : "verifyNewPassword",
                    "preferredDataType" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"verifyNewPassword\",\n        \"data\": \"{{local.yscz5j5r84.payload.output.verifyNewPassword}}\",\n        \"tooltip\": \"{{local.yscz5j5r84.payload.output.verifyNewPassword}}\",\n        \"children\": [\n          {\n            \"text\": \"verifyNewPassword\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 1234
            y = 1410
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
        "nbpi0nvr03" = {
          data = {
            id               = "nbpi0nvr03"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.functions.id
            connector_id     = "functionsConnector"
            capability_class = "backend"
            name             = "Functions"
            label            = "Functions"
            capability_name  = "AEqualsMultipleB"
            type             = "trigger"
            status           = "configured"
            id_unique        = "xu159txkrp"
            properties = jsonencode({
              "leftValueA" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"buttonValue\",\n        \"data\": \"{{local.afyus0g868.payload.output.buttonValue}}\",\n        \"tooltip\": \"{{local.afyus0g868.payload.output.buttonValue}}\",\n        \"children\": [\n          {\n            \"text\": \"buttonValue\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeDescription" : {
                "value" : "Check which button was clicked"
              },
              "nodeTitle" : {
                "value" : "Identifier Form Button Action"
              },
              "rightValueB" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"submit\"\n      }\n    ]\n  }\n]"
              },
              "rightValueMultiple" : {
                "value" : [
                  {
                    "id" : "vgii63uk2p",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"CONTINUE\"\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "id" : "js0k5824y5",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"CANCEL\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 934
            y = 2070
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
        "nf63ecqmal" = {
          data = {
            id               = "nf63ecqmal"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.error_message.id
            connector_id     = "errorConnector"
            capability_class = "backend"
            name             = "Error Message"
            label            = "Error Customize"
            capability_name  = "customErrorMessage"
            type             = "action"
            status           = "configured"
            properties = jsonencode({
              "errorCode" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Unexpected password state\"\n      }\n    ]\n  }\n]"
              },
              "errorDescription" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"An unexpected password state was received\"\n      }\n    ]\n  }\n]"
              },
              "errorMessage" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"An unexpected error has occurred\"\n      }\n    ]\n  }\n]"
              },
              "errorReason" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Received an unexpected password state value from PingOne\"\n      }\n    ]\n  }\n]"
              },
              "nodeDescription" : {
                "value" : "Received an unexpected value for the password status"
              },
              "nodeTitle" : {
                "value" : "Received an unexpected value"
              }
            })
          }
          position = {
            x = 2764
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
        "noo95xupvp" = {
          data = {
            id        = "noo95xupvp"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 1054
            y = 1410
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
        "o43vpz4na3" = {
          data = {
            id               = "o43vpz4na3"
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
                "value" : "module.exports = a = async ({ params }) =\u003e {\n    const details = params.details;\n\n    // Check if details is set, otherwise return an empty string\n    if (!details || details.length === 0) {\n        return { 'message': '' };\n    }\n\n    const secondsUntilUnlock = details[0]?.rawResponse?.details?.[0]?.innerError?.secondsUntilUnlock ?? null;\n\n    // If secondsUntilUnlock is not available or greater than 100,000 seconds, return an empty string\n    const formattedTime = (secondsUntilUnlock !== null \u0026\u0026 secondsUntilUnlock \u003c= 100000) \n        ? formatTime(secondsUntilUnlock) \n        : null;\n\n    // Return the unlock message or an empty string\n    const message = formattedTime ? `Your account will unlock in $${formattedTime}.` : '';\n\n    return { 'message': message };\n}\n\n// Function to format time into a human-readable string\nconst formatTime = (seconds) =\u003e {\n    const days = Math.floor(seconds / (24 * 3600));\n    const hours = Math.floor((seconds % (24 * 3600)) / 3600);\n    const minutes = Math.ceil((seconds % 3600) / 60);\n\n    const parts = [];\n    if (days \u003e 0) parts.push(`$${days} day$${days \u003e 1 ? 's' : ''}`);\n    if (hours \u003e 0) parts.push(`$${hours} hour$${hours \u003e 1 ? 's' : ''}`);\n    if (minutes \u003e 0) parts.push(`$${minutes} minute$${minutes \u003e 1 ? 's' : ''}`);\n\n    return parts.join(', ');\n}\n"
              },
              "nodeDescription" : {
                "value" : "Parse expiration and convert to readable duration"
              },
              "nodeTitle" : {
                "value" : "Calculate Expiration"
              },
              "outputSchema" : {
                "value" : "{\n\t\"output\": {\n\t\t\"type\": \"object\",\n\t\t\"properties\": {\n\t\t\t\"message\": {\n\t\t\t\t\"type\": \"string\"\n\t\t\t}\n\t\t}\n\t}\n}"
              },
              "variableInputList" : {
                "value" : [
                  {
                    "name" : "details",
                    "preferredDataType" : "object",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"teleport.svg\",\n        \"url\": \"errorDetails\",\n        \"data\": \"{{local.2xzcvx1gll.payload.output.errorDetails}}\",\n        \"tooltip\": \"{{local.2xzcvx1gll.payload.output.errorDetails}}\",\n        \"children\": [\n          {\n            \"text\": \"errorDetails\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 634
            y = 3810
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
        "o4yhix414e" = {
          data = {
            id               = "o4yhix414e"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.http.id
            connector_id     = "httpConnector"
            capability_class = "render"
            name             = "Http"
            label            = "Http"
            capability_name  = "customHTMLTemplate"
            type             = "trigger"
            status           = "configured"
            id_unique        = "mc0qvitm1n"
            properties = jsonencode({
              "customCSS" : {},
              "customHTML" : {
                "value" : "\u003cdiv class=\"end-user-nano\"\u003e\n    \u003cdiv\n        class=\"bg-light d-flex flex-column justify-content-center align-items-center position-absolute top-0 start-0 bottom-0 end-0 overflow-auto\"\u003e\n        \u003cdiv class=\"mh-100\" style=\"max-width: 400px; width: 100%;\"\u003e\n            \u003cdiv class=\"card shadow mb-5\"\u003e\n                \u003cmain aria-labelledby=\"title\"\u003e\n                    \u003cdiv class=\"card-body p-5 d-flex flex-column\"\u003e\n                        \u003cimg class=\"companyLogo align-self-center mb-5\" src=\"{{global.variables.companyLogo}}\" alt=\"{{global.variables.companyName}}\" /\u003e\n                        \u003ch1 id=\"title\" class=\"text-center mb-4\"\u003e\n                            {{title}}\n                        \u003c/h1\u003e\n                        \u003cp class=\"text-muted text-center\"\u003e{{text}}\u003c/p\u003e\n\n                        \u003c!-- Generic Error Message --\u003e\n                        \u003cp class=\"text-danger mdi mdi-alert-circle text-center icon-padding\" data-id=\"feedback\"\n                            data-skcomponent=\"skerror\" aria-live=\"assertive\"\u003e\u003c/p\u003e\n\n                        \u003cp id=\"resendMessage\" class=\"text-success mdi mdi-check-circle text-center\"  \n                            style=\"display: {{#if resendMessage}} block; {{else}} none; {{/if}}\" aria-live=\"assertive\"\u003e\n                            \u003cspan class=\"ms-2\"\u003e{{resendMessage}}\u003c/span\u003e\u003c/p\u003e\n\n                        \u003cform id=\"otp-form\" data-id=\"otp-form\"\u003e\n                            \u003cdiv class=\"mb-4 form-floating\"\u003e\n                                \u003cinput class=\"form-control text-center otp-control\" id=\"passcode\" type=\"text\" autocomplete=\"on\" maxlength=\"8\" aria-required=\"true\" placeholder=\"Verification Code\" /\u003e\n                                \u003clabel class=\"form-label\" for=\"passcode\"\u003eVerification Code\u003c/label\u003e\n                            \u003c/div\u003e\n                           \n                            \u003cdiv class=\"d-flex flex-column\"\u003e\n                                \u003cbutton id=\"submit\" type=\"submit\" class=\"btn btn-primary mb-3\" data-skcomponent=\"skbutton\"\n                                    data-skbuttontype=\"form-submit\" data-skform=\"otp-form\" data-skbuttonvalue=\"VERIFY\"\u003e\n                                    Continue\n                                \u003c/button\u003e\n                                \u003cbutton id=\"resend\" type=\"button\" class=\"btn btn-link mb-3\" data-skcomponent=\"skbutton\"\n                                    data-skbuttontype=\"next-event\" data-skbuttonvalue=\"RESEND\"\u003e\n                                    Resend verification code\n                                \u003c/button\u003e\n                            \u003c/div\u003e\n                        \u003c/form\u003e\n                    \u003c/div\u003e\n                \u003c/main\u003e\n            \u003c/div\u003e\n        \u003c/div\u003e\n    \u003c/div\u003e\n\u003c/div\u003e"
              },
              "customScript" : {
                "value" : "/**\n * Sets focus to the DOM element specified by its ID.\n * @param {string} id - The ID of the DOM element to focus.\n */\nconst setFieldFocus = (id) =\u003e {\n    const element = document.getElementById(id);\n    if (element) {\n        element.focus();\n    } else {\n        console.log(`Element with ID $${id} not found.`);\n    }\n};\n\n/**\n * Initializes the application by setting the focus to a specific field.\n */\nconst start = () =\u003e {\n    setFieldFocus(\"passcode\");\n    createChangeObserver(\"resendMessage\");\n};\n\nconst createChangeObserver = (id) =\u003e {\n    const targetNode = document.getElementById(id);\n\n    if (targetNode) {\n        // Observer options\n        const config = { childList: true, characterData: true, subtree: true };\n\n        const callback = function (mutationsList, observer) {\n            for (let mutation of mutationsList) {\n                if (mutation.type === 'characterData' || (mutation.type === 'childList' \u0026\u0026 mutation.addedNodes.length \u003e 0)) {\n                    // Form has reloaded, set focus\n                    setFieldFocus(\"passcode\");\n                }\n            }\n        };\n\n        const observer = new MutationObserver(callback);\n\n        observer.observe(targetNode, config);\n    }\n}\n\n// Ensure the script runs after the DOM is fully loaded\nif (document.readyState === \"loading\") {\n    document.addEventListener(\"DOMContentLoaded\", start);\n} else {\n    start();\n}\n\n"
              },
              "formFieldsList" : {
                "value" : [
                  {
                    "hashedVisibility" : false,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "buttonValue",
                    "value" : ""
                  },
                  {
                    "displayName" : "Passcode",
                    "hashedVisibility" : false,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "passcode",
                    "value" : ""
                  }
                ]
              },
              "inputSchema" : {
                "value" : "{\n    \"type\": \"object\",\n    \"properties\": {\n      \"title\": {\n        \"displayName\": \"Title\",\n        \"preferedControlType\": \"textField\",\n        \"enableParameters\": true\n      },\n      \"text\": {\n        \"displayName\": \"Text\",\n        \"preferedControlType\": \"textField\",\n        \"enableParameters\": true\n      },\n      \"resendMessage\": {\n        \"displayName\": \"Resend Message\",\n        \"preferedControlType\": \"textField\",\n        \"enableParameters\": true\n      }\n    }\n  }"
              },
              "nodeDescription" : {
                "value" : "Enter the code that was emailed to verify your email address"
              },
              "nodeTitle" : {
                "value" : "Verification Code"
              },
              "outputSchema" : {
                "value" : {}
              },
              "resendMessage" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"teleport.svg\",\n        \"url\": \"resendMessage\",\n        \"data\": \"{{local.g5zcju90lh.payload.output.resendMessage}}\",\n        \"tooltip\": \"{{local.g5zcju90lh.payload.output.resendMessage}}\",\n        \"children\": [\n          {\n            \"text\": \"resendMessage\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "text" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Enter the code that was emailed to you to verify your email address.\"\n      }\n    ]\n  }\n]"
              },
              "title" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Verification Code\"\n      }\n    ]\n  }\n]"
              },
              "type" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"SMS\"\n      }\n    ]\n  }\n]"
              },
              "validationRules" : {
                "value" : []
              }
            })
          }
          position = {
            x = 634
            y = 3210
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
        "ofbbj58kbk" = {
          data = {
            id              = "ofbbj58kbk"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "nodeInstanceId" : {
                "value" : "dpo5892st9"
              },
              "nodeTitle" : {
                "value" : "Sign On Start"
              }
            })
          }
          position = {
            x = 1234
            y = 3810
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
        "ofk8hitz8r" = {
          data = {
            id              = "ofk8hitz8r"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node [2023-01-09]"
            capability_name = "startNode"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "inputSchema" : {
                "value" : "{\n\t\"type\": \"object\",\n\t\"properties\": {\n\t\t\"p1UserId\": {\n\t\t\t\"type\": \"string\",\n\t\t\t\"displayName\": \"PingOne User Id\",\n\t\t\t\"preferredControlType\": \"textField\",\n\t\t\t\"enableParameters\": true,\n\t\t\t\"propertyName\": \"p1UserId\"\n\t\t}\n\t}\n}"
              },
              "nodeTitle" : {
                "value" : "Sign On Success"
              }
            })
          }
          position = {
            x = 334
            y = 4200
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
        "ogah3oonyo" = {
          data = {
            id        = "ogah3oonyo"
            node_type = "EVAL"
            properties = jsonencode({
              "9gi11xivkc" : {
                "value" : "always"
              }
            })
          }
          position = {
            x = 1654
            y = 2070
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
        "on0u5wrtq4" = {
          data = {
            id               = "on0u5wrtq4"
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
              "errorMessage" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"message\",\n        \"data\": \"{{local.loevzm0utd.payload.error.message}}\",\n        \"tooltip\": \"{{local.loevzm0utd.payload.error.message}}\",\n        \"children\": [\n          {\n            \"text\": \"message\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeTitle" : {
                "value" : "Error Validating Code"
              }
            })
          }
          position = {
            x = 1534
            y = 3360
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
        "oprqs443fg" = {
          data = {
            id        = "oprqs443fg"
            node_type = "EVAL"
          }
          position = {
            x = 1654
            y = 2700
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
        "p2y85foy0y" = {
          data = {
            id               = "p2y85foy0y"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.error_message.id
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
            x = 3034
            y = 2250
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
        "p9wjd6i8se" = {
          data = {
            id        = "p9wjd6i8se"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 3754
            y = 2070
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
        "pjaqc3d5u5" = {
          data = {
            id        = "pjaqc3d5u5"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 1384
            y = 3510
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
        "pmbt2m9ugv" = {
          data = {
            id        = "pmbt2m9ugv"
            node_type = "EVAL"
            properties = jsonencode({
              "jmzjeq5oev" : {
                "value" : "anyTriggersFalse"
              }
            })
          }
          position = {
            x = 3454
            y = 2070
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
        "pqu44gofi8" = {
          data = {
            id        = "pqu44gofi8"
            node_type = "EVAL"
          }
          position = {
            x = 454
            y = 480
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
        "q11byfsigx" = {
          data = {
            id        = "q11byfsigx"
            node_type = "EVAL"
          }
          position = {
            x = 1054
            y = 2070
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
        "q58gzphsoq" = {
          data = {
            id              = "q58gzphsoq"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "nodeInstanceId" : {
                "value" : "qp6fpnw2hk"
              },
              "nodeTitle" : {
                "value" : "Go to Registration"
              }
            })
          }
          position = {
            x = 1234
            y = 690
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
        "qfb6v9psi5" = {
          data = {
            id              = "qfb6v9psi5"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingone.id
            connector_id    = "pingOneSSOConnector"
            name            = "PingOne"
            label           = "pingOneSSOConnector"
            capability_name = "recoverPassword"
            type            = "action"
            status          = "configured"
            id_unique       = "nezyzu3twg"
            properties = jsonencode({
              "identifier" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"id\",\n        \"data\": \"{{local.9hip372enu.payload.output.matchedUser.id}}\",\n        \"tooltip\": \"{{local.9hip372enu.payload.output.matchedUser.id}}\",\n        \"children\": [\n          {\n            \"text\": \"id\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
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
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"newPassword\",\n        \"data\": \"{{local.9gi11xivkc.payload.output.newPassword}}\",\n        \"tooltip\": \"{{local.9gi11xivkc.payload.output.newPassword}}\",\n        \"children\": [\n          {\n            \"text\": \"newPassword\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
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
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"recoveryCode\",\n        \"data\": \"{{local.9gi11xivkc.payload.output.recoveryCode}}\",\n        \"tooltip\": \"{{local.9gi11xivkc.payload.output.recoveryCode}}\",\n        \"children\": [\n          {\n            \"text\": \"recoveryCode\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "userIdentifierForFindUser" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"username\",\n        \"data\": \"{{local.1teos2506v.payload.output.username}}\",\n        \"tooltip\": \"{{local.1teos2506v.payload.output.username}}\",\n        \"children\": [\n          {\n            \"text\": \"username\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 3334
            y = 2070
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
        "qkt2zshrvv" = {
          data = {
            id              = "qkt2zshrvv"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            id_unique       = "6ymcsgz021"
            properties = jsonencode({
              "annotation" : {
                "value" : "Input Schema: p1UserId"
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
                "value" : 300
              }
            })
          }
          position = {
            x = 244
            y = 1290
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
        "qp6fpnw2hk" = {
          data = {
            id              = "qp6fpnw2hk"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "startNode"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "inputSchema" : {
                "value" : "{\n\t\"type\": \"object\",\n\t\"properties\": {\n\t\t\n\t}\n}"
              },
              "nodeTitle" : {
                "value" : "Registration"
              }
            })
          }
          position = {
            x = 334
            y = 2700
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
        "r7n4svgqft" = {
          data = {
            id               = "r7n4svgqft"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.variables.id
            connector_id     = "variablesConnector"
            capability_class = "backend"
            name             = "Variables"
            label            = "Variables"
            capability_name  = "saveValue"
            type             = "trigger"
            status           = "configured"
            id_unique        = "mbb1ucl3yi"
            properties = jsonencode({
              "nodeDescription" : {
                "value" : "Set variables used in flow execution"
              },
              "nodeTitle" : {
                "value" : "companyName \u0026 companyLogo"
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
            y = 480
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
        "r810hd9rp9" = {
          data = {
            id        = "r810hd9rp9"
            node_type = "EVAL"
          }
          position = {
            x = 1054
            y = 2910
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
        "rbflsn7loz" = {
          data = {
            id        = "rbflsn7loz"
            node_type = "EVAL"
          }
          position = {
            x = 424
            y = 3810
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
        "rcet3ipqlt" = {
          data = {
            id               = "rcet3ipqlt"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.functions.id
            connector_id     = "functionsConnector"
            capability_class = "backend"
            name             = "Functions"
            label            = "Functions"
            capability_name  = "customFunction"
            type             = "trigger"
            status           = "configured"
            id_unique        = "sxnpkmd89m"
            properties = jsonencode({
              "checkNullORUndefined" : {
                "value" : true
              },
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
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"id\",\n        \"data\": \"{{local.9hip372enu.payload.output.matchedUser.id}}\",\n        \"tooltip\": \"{{local.9hip372enu.payload.output.matchedUser.id}}\",\n        \"children\": [\n          {\n            \"text\": \"id\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 3034
            y = 2070
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
        "rkm3c18ybi" = {
          data = {
            id              = "rkm3c18ybi"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingone.id
            connector_id    = "pingOneSSOConnector"
            name            = "PingOne"
            label           = "PingOne"
            capability_name = "sendVerificationCode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "identifier" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"teleport.svg\",\n        \"url\": \"p1UserId\",\n        \"data\": \"{{local.g5zcju90lh.payload.output.p1UserId}}\",\n        \"tooltip\": \"{{local.g5zcju90lh.payload.output.p1UserId}}\",\n        \"children\": [\n          {\n            \"text\": \"p1UserId\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeTitle" : {
                "value" : "Resend Verification Code"
              }
            })
          }
          position = {
            x = 1234
            y = 3510
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
        "rtc1od0nlh" = {
          data = {
            id        = "rtc1od0nlh"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 2254
            y = 2400
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
        "s26s7nbn5d" = {
          data = {
            id              = "s26s7nbn5d"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node [2023-01-09]"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            id_unique       = "efipo9nts6"
            properties = jsonencode({
              "nodeInstanceId" : {
                "value" : "ercttap70x"
              },
              "nodeTitle" : {
                "value" : "Go to Reset Password"
              },
              "p1UserId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"id\",\n        \"data\": \"{{local.cqm26fxq1v.payload.output.matchedUser.id}}\",\n        \"tooltip\": \"{{local.cqm26fxq1v.payload.output.matchedUser.id}}\",\n        \"children\": [\n          {\n            \"text\": \"id\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 2764
            y = 690
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
        "s9d87q95kf" = {
          data = {
            id              = "s9d87q95kf"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            id_unique       = "twyb3s51b1"
            properties = jsonencode({
              "annotation" : {
                "value" : "Input Schema: p1UserId, email, resendMessage (optional)"
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
                "value" : 450
              }
            })
          }
          position = {
            x = 214
            y = 3090
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
        "scrsg9o0e2" = {
          data = {
            id              = "scrsg9o0e2"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node [2023-01-09]"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "nodeInstanceId" : {
                "value" : "ofk8hitz8r"
              },
              "nodeTitle" : {
                "value" : "Go to Sign On Success"
              },
              "p1UserId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"id\",\n        \"data\": \"{{local.cqm26fxq1v.payload.output.matchedUser.id}}\",\n        \"tooltip\": \"{{local.cqm26fxq1v.payload.output.matchedUser.id}}\",\n        \"children\": [\n          {\n            \"text\": \"id\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 2764
            y = 480
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
        "t3gotwkiy8" = {
          data = {
            id        = "t3gotwkiy8"
            node_type = "EVAL"
          }
          position = {
            x = 2584
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
        "ta1tljqxgs" = {
          data = {
            id              = "ta1tljqxgs"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "nodeInstanceId" : {
                "value" : "ofk8hitz8r"
              },
              "p1UserId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"id\",\n        \"data\": \"{{local.9hip372enu.payload.output.matchedUser.id}}\",\n        \"tooltip\": \"{{local.9hip372enu.payload.output.matchedUser.id}}\",\n        \"children\": [\n          {\n            \"text\": \"id\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 3934
            y = 2070
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
        "tfmz8ma5qc" = {
          data = {
            id        = "tfmz8ma5qc"
            node_type = "EVAL"
          }
          position = {
            x = 1054
            y = 690
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
        "tnotjgrxhz" = {
          data = {
            id        = "tnotjgrxhz"
            node_type = "EVAL"
            properties = jsonencode({
              "886l7dx7um" : {
                "value" : "anyTriggersFalse"
              }
            })
          }
          position = {
            x = 1354
            y = 1410
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
        "u1pe4uydjy" = {
          data = {
            id              = "u1pe4uydjy"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "returnBackToCallingNode"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "nodeTitle" : {
                "value" : "Return to Caller"
              }
            })
          }
          position = {
            x = 1534
            y = 3210
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
        "uc0fpztdsq" = {
          data = {
            id        = "uc0fpztdsq"
            node_type = "EVAL"
            properties = jsonencode({
              "on0u5wrtq4" : {
                "value" : "anyTriggersFalse"
              },
              "undefined" : {
                "value" : "anyTriggersFalse"
              }
            })
          }
          position = {
            x = 1354
            y = 3210
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
        "ud0vht8qd1" = {
          data = {
            id              = "ud0vht8qd1"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            id_unique       = "a0qg4993t2"
            properties = jsonencode({
              "annotation" : {
                "value" : "Input Schema: errorDetails"
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
            x = 214
            y = 3690
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
        "uhekj7f0vs" = {
          data = {
            id        = "uhekj7f0vs"
            node_type = "EVAL"
            label     = "Evaluator"
            properties = jsonencode({
              "4p1hxq7p98" : {
                "value" : "anyTriggersFalse"
              }
            })
          }
          position = {
            x = 1354
            y = 2700
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
        "un1zrx67xr" = {
          data = {
            id              = "un1zrx67xr"
            node_type       = "ANNOTATION"
            connection_id   = pingone_davinci_connector_instance.annotation.id
            connector_id    = "annotationConnector"
            name            = "Annotation"
            capability_name = "updateAnnotationProperties"
            type            = "action"
            status          = "configured"
            id_unique       = "x0q2semx5h"
            properties = jsonencode({
              "annotation" : {
                "value" : "Account Locked"
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
                "value" : 1200
              }
            })
          }
          position = {
            x = 214
            y = 3630
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
        "uqcbtnx4e1" = {
          data = {
            id        = "uqcbtnx4e1"
            node_type = "EVAL"
          }
          position = {
            x = 1054
            y = 3210
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
        "usfhtwgo7x" = {
          data = {
            id        = "usfhtwgo7x"
            node_type = "EVAL"
            properties = jsonencode({
              "79aiikhgtb" : {
                "value" : "anyTriggersFalse"
              },
              "83vu4kprq4" : {
                "value" : "anyTriggersFalse"
              }
            })
          }
          position = {
            x = 1654
            y = 480
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
        "v5ubajrpxk" = {
          data = {
            id              = "v5ubajrpxk"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "nodeInstanceId" : {
                "value" : "273gpisk0t"
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
            x = 2434
            y = 2250
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
        "vfpfyx6zck" = {
          data = {
            id              = "vfpfyx6zck"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            id_unique       = "bdzfpuqvez"
            properties = jsonencode({
              "email" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{local.x0txd3bdfn.payload.output.user.email}}\",\n        \"tooltip\": \"{{local.x0txd3bdfn.payload.output.user.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeInstanceId" : {
                "value" : "g5zcju90lh"
              },
              "nodeTitle" : {
                "value" : "Account Verification"
              },
              "p1UserId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"pingIdentity.svg\",\n        \"url\": \"id\",\n        \"data\": \"{{local.x0txd3bdfn.payload.output.user.id}}\",\n        \"tooltip\": \"{{local.x0txd3bdfn.payload.output.user.id}}\",\n        \"children\": [\n          {\n            \"text\": \"id\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 1534
            y = 2700
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
        "vijb9f77kl" = {
          data = {
            id        = "vijb9f77kl"
            node_type = "EVAL"
          }
          position = {
            x = 2254
            y = 2070
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
        "vl9mxvo9nn" = {
          data = {
            id        = "vl9mxvo9nn"
            node_type = "EVAL"
          }
          position = {
            x = 1054
            y = 2700
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
        "vqo96knyuj" = {
          data = {
            id              = "vqo96knyuj"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            id_unique       = "hjvenu0wl7"
            properties = jsonencode({
              "nodeInstanceId" : {
                "value" : "dpo5892st9"
              },
              "nodeTitle" : {
                "value" : "Go to Start"
              }
            })
          }
          position = {
            x = 1234
            y = 2910
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
        "vsyz2ijfwy" = {
          data = {
            id        = "vsyz2ijfwy"
            node_type = "EVAL"
          }
          position = {
            x = 454
            y = 1410
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
        "w7jmfry8oc" = {
          data = {
            id        = "w7jmfry8oc"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 1054
            y = 870
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
        "wexx10oniw" = {
          data = {
            id        = "wexx10oniw"
            node_type = "EVAL"
          }
          position = {
            x = 754
            y = 2070
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
        "ww8avrzf7x" = {
          data = {
            id        = "ww8avrzf7x"
            node_type = "EVAL"
          }
          position = {
            x = 754
            y = 480
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
        "wx0pcaeb6j" = {
          data = {
            id               = "wx0pcaeb6j"
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
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"newPassword\",\n        \"data\": \"{{local.9gi11xivkc.payload.output.newPassword}}\",\n        \"tooltip\": \"{{local.9gi11xivkc.payload.output.newPassword}}\",\n        \"children\": [\n          {\n            \"text\": \"newPassword\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "name" : "verifyNewPassword",
                    "preferredDataType" : "string",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"verifyNewPassword\",\n        \"data\": \"{{local.9gi11xivkc.payload.output.verifyNewPassword}}\",\n        \"tooltip\": \"{{local.9gi11xivkc.payload.output.verifyNewPassword}}\",\n        \"children\": [\n          {\n            \"text\": \"verifyNewPassword\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 2734
            y = 2070
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
        "x0txd3bdfn" = {
          data = {
            id              = "x0txd3bdfn"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.pingone.id
            connector_id    = "pingOneSSOConnector"
            name            = "PingOne"
            label           = "PingOne - Template"
            capability_name = "createUser"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "additionalUserProperties" : {
                "value" : []
              },
              "createUser_localizedErrors" : {
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
                        "key" : "uniquenessViolation",
                        "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"An account with that email address already exists.\"\n      }\n    ]\n  }\n]"
                      },
                      {
                        "key" : "constraintViolation",
                        "value" : ""
                      },
                      {
                        "key" : "invalidValue",
                        "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
                      },
                      {
                        "key" : "invalidInput",
                        "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Enter a valid email address\"\n      }\n    ]\n  }\n]"
                      }
                    ]
                  }
                }
              },
              "email" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{local.1k5y98i1v1.payload.output.email}}\",\n        \"tooltip\": \"{{local.1k5y98i1v1.payload.output.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "family" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"familyName\",\n        \"data\": \"{{local.1k5y98i1v1.payload.output.familyName}}\",\n        \"tooltip\": \"{{local.1k5y98i1v1.payload.output.familyName}}\",\n        \"children\": [\n          {\n            \"text\": \"familyName\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "given" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"givenName\",\n        \"data\": \"{{local.1k5y98i1v1.payload.output.givenName}}\",\n        \"tooltip\": \"{{local.1k5y98i1v1.payload.output.givenName}}\",\n        \"children\": [\n          {\n            \"text\": \"givenName\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "lifecycleStatus" : {
                "value" : "VERIFICATION_REQUIRED"
              },
              "nodeDescription" : {
                "value" : "Creates The PingOne User Account"
              },
              "nodeTitle" : {
                "value" : "Create the PingOne user"
              },
              "password" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"password\",\n        \"data\": \"{{local.fuil2gnc5f.payload.output.password}}\",\n        \"tooltip\": \"{{local.fuil2gnc5f.payload.output.password}}\",\n        \"children\": [\n          {\n            \"text\": \"password\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "passwordForCreateUser" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"password\",\n        \"data\": \"{{local.1k5y98i1v1.payload.output.password}}\",\n        \"tooltip\": \"{{local.1k5y98i1v1.payload.output.password}}\",\n        \"children\": [\n          {\n            \"text\": \"password\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "population" : {
                "value" : "useDefaultPopulation"
              },
              "username" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{local.1k5y98i1v1.payload.output.email}}\",\n        \"tooltip\": \"{{local.1k5y98i1v1.payload.output.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 1234
            y = 2700
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
        "x1t8u9nxcp" = {
          data = {
            id        = "x1t8u9nxcp"
            node_type = "EVAL"
            label     = "Evaluator"
          }
          position = {
            x = 2254
            y = 2250
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
        "x1vvv3tl7u" = {
          data = {
            id               = "x1vvv3tl7u"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.functions.id
            connector_id     = "functionsConnector"
            capability_class = "backend"
            name             = "Functions"
            label            = "Functions"
            capability_name  = "AEqualsMultipleB"
            type             = "trigger"
            status           = "configured"
            properties = jsonencode({
              "leftValueA" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"buttonValue\",\n        \"data\": \"{{local.o4yhix414e.payload.output.buttonValue}}\",\n        \"tooltip\": \"{{local.o4yhix414e.payload.output.buttonValue}}\",\n        \"children\": [\n          {\n            \"text\": \"buttonValue\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeDescription" : {
                "value" : "Check Which Button Was Clicked"
              },
              "nodeTitle" : {
                "value" : "Verify Code Form Button Check"
              },
              "rightValueB" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"SUBMIT\"\n      }\n    ]\n  }\n]"
              },
              "rightValueMultiple" : {
                "value" : [
                  {
                    "id" : "xplfpj1df8",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"VERIFY\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "id" : "8982ybbt5z",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"RESEND\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 934
            y = 3210
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
        "xyquoj2bnj" = {
          data = {
            id        = "xyquoj2bnj"
            node_type = "EVAL"
          }
          position = {
            x = 454
            y = 360
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
        "yscz5j5r84" = {
          data = {
            id               = "yscz5j5r84"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.http.id
            connector_id     = "httpConnector"
            capability_class = "render"
            name             = "Http"
            label            = "Http"
            capability_name  = "customHTMLTemplate"
            type             = "trigger"
            status           = "configured"
            id_unique        = "u7ffu4j917"
            properties = jsonencode({
              "customCSS" : {},
              "customHTML" : {
                "value" : "\u003cdiv class=\"end-user-nano\"\u003e\n  \u003cdiv\n      class=\"bg-light d-flex flex-column justify-content-center align-items-center position-absolute top-0 start-0 bottom-0 end-0 overflow-auto\"\u003e\n      \u003cdiv style=\"max-width: 400px; min-width: 400px; width: 100%\"\u003e\n          \u003cdiv class=\"card shadow mb-5\"\u003e\n              \u003cmain aria-labelledby=\"title\"\u003e\n                  \u003cdiv class=\"card-body p-5 d-flex flex-column\"\u003e\n                      \u003cimg class=\"companyLogo align-self-center mb-5\" src=\"{{global.variables.companyLogo}}\" alt=\"{{global.variables.companyName}}\" /\u003e\n\n                      {{#if title}}\n                      \u003ch1 id=\"title\" class=\"text-center mb-4\"\u003e{{title}}\u003c/h1\u003e\n                      {{/if}}\n\n                      {{#if textOne}}\n                      \u003cp class=\"text-muted text-center\"\u003e{{textOne}}\u003c/p\u003e\n                      {{/if}}\n                      \n                      \u003c!-- Generic Error Message --\u003e\n                      \u003cp class=\"text-danger mdi mdi-alert-circle text-center icon-padding\" data-id=\"feedback\"\n                          data-skcomponent=\"skerror\" aria-live=\"assertive\"\u003e\u003c/p\u003e\n\n                      \u003cform id=\"resetPasswordForm\" aria-labelledby=\"title\" data-id=\"resetPasswordForm\"\u003e\n                          \u003cdiv id=\"currentPasswordContainer\" class=\"mb-4 form-floating\"\u003e\n                              \u003cinput id=\"currentPassword\" data-id=\"currentPassword\" class=\"form-control\"\n                                  type=\"password\" name=\"currentPassword\" placeholder=\"Current Password\"\n                                  autocomplete=\"current-password\" aria-describedby=\"passwordLabel\" /\u003e\n                              \u003clabel id=\"passwordLabel\" class=\"form-label\" for=\"currentPassword\"\u003eCurrent\n                                  Password\u003c/label\u003e\n                          \u003c/div\u003e\n                          \u003cdiv id=\"newPasswordContainer\" class=\"mb-4 form-floating mt-lg-4\"\u003e\n                              \u003cinput id=\"newPassword\" data-id=\"newPassword\" class=\"form-control\" type=\"password\"\n                                  name=\"newPassword\" placeholder=\"New Password\" autocomplete=\"new-password\"\n                                  aria-describedby=\"newPasswordLabel\" /\u003e\n                              \u003clabel id=\"newPasswordLabel\" class=\"form-label\" for=\"newPassword\"\u003eNew Password\u003c/label\u003e\n                          \u003c/div\u003e\n                          \u003cdiv id=\"verifyPasswordContainer\" class=\"mb-4 form-floating\"\u003e\n                              \u003cinput id=\"verifyNewPassword\" data-id=\"verifyNewPassword\" class=\"form-control\"\n                                  type=\"password\" name=\"verifyNewPassword\" placeholder=\"Verify New Password\"\n                                  autocomplete=\"new-password\" aria-describedby=\"verifyNewPasswordLabel\" /\u003e\n                              \u003clabel id=\"verifyNewPasswordLabel\" class=\"form-label\" for=\"verifyNewPassword\"\u003eVerify New\n                                  Password\u003c/label\u003e\n                          \u003c/div\u003e\n                          \u003cdiv class=\"d-flex flex-column\"\u003e                 \n                              \u003cbutton id=\"submitBtn\" data-id=\"submitBtn\" class=\"btn btn-primary mb-3\"\n                                  type=\"submit\" data-skcomponent=\"skbutton\" data-skbuttontype=\"form-submit\"\n                                  data-skform=\"resetPasswordForm\" data-skbuttonvalue=\"UPDATE\"\u003e\n                                  Continue\n                              \u003c/button\u003e\n                              \u003cbutton id=\"cancelBtn\" data-id=\"cancelBtn\" class=\"btn btn-link\"\n                                  data-skcomponent=\"skbutton\" data-skbuttontype=\"next-event\"\n                                  data-skform=\"resetPasswordForm\" data-skbuttonvalue=\"CANCEL\"\u003e\n                                  Cancel\n                              \u003c/button\u003e\n                          \u003c/div\u003e\n                      \u003c/form\u003e\n                  \u003c/div\u003e\n              \u003c/main\u003e\n          \u003c/div\u003e\n      \u003c/div\u003e\n  \u003c/div\u003e\n\u003c/div\u003e"
              },
              "customScript" : {
                "value" : "const setFieldFocus = (id) =\u003e {\r\n    const element = document.getElementById(id);\r\n    if (element) {\r\n        element.focus();\r\n    }\r\n}\r\n\r\nfunction makePasswordToggle(id) {\r\n  var container = document.getElementById(id);\r\n  var password = container.getElementsByTagName(\"input\")[0];\r\n  var toggler = document.createElement(\"button\");\r\n  toggler.setAttribute(\"type\", \"button\");\r\n  toggler.setAttribute(\"aria-label\", \"Show/Hide Password\");\r\n  toggler.className = \"btn mdi mdi-eye-off-outline position-absolute end-0 top-50 translate-middle-y\";\r\n  container.appendChild(toggler);\r\n\r\n  function showHidePassword() {\r\n    if (password.type == \"password\") {\r\n      password.setAttribute(\"type\", \"text\");\r\n      toggler.classList.add(\"mdi-eye-outline\");\r\n      toggler.classList.remove(\"mdi-eye-off-outline\");\r\n    } else {\r\n      toggler.classList.add(\"mdi-eye-off-outline\");\r\n      toggler.classList.remove(\"mdi-eye-outline\");\r\n      password.setAttribute(\"type\", \"password\");\r\n    }\r\n    password.focus();\r\n  };\r\n\r\n  toggler.addEventListener(\"click\", showHidePassword);\r\n}\r\n\r\nfunction start() {\r\n  makePasswordToggle(\"currentPasswordContainer\");\r\n  makePasswordToggle(\"newPasswordContainer\");\r\n  makePasswordToggle(\"verifyPasswordContainer\");\r\n  setFieldFocus(\"currentPassword\");\r\n}\r\n\r\nif (document.readyState === \"loading\") {\r\n  // Loading hasn't finished yet\r\n  document.addEventListener(\"DOMContentLoaded\", start);\r\n} else {\r\n  // `DOMContentLoaded` has already fired\r\n  start();\r\n}\r\n"
              },
              "formFieldsList" : {
                "value" : [
                  {
                    "displayName" : "Current Password",
                    "hashedVisibility" : true,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "currentPassword"
                  },
                  {
                    "displayName" : "New Password",
                    "hashedVisibility" : true,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "newPassword"
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
                    "hashedVisibility" : false,
                    "preferredControlType" : "textField",
                    "preferredDataType" : "string",
                    "propertyName" : "buttonValue",
                    "value" : ""
                  }
                ]
              },
              "inputSchema" : {
                "value" : "{\n  \"type\": \"object\",\n  \"properties\": {\n    \"title\": {\n      \"type\": \"string\",\n      \"displayName\": \"Title\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    },\n    \"textOne\": {\n      \"type\": \"string\",\n      \"displayName\": \"Text One\",\n      \"preferredControlType\": \"textField\",\n      \"enableParameters\": true\n    }\n  }\n}"
              },
              "nodeDescription" : {
                "value" : "Enter current password and new password"
              },
              "nodeTitle" : {
                "value" : "Change Password"
              },
              "textOne" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Your password needs to be updated.\"\n      }\n    ]\n  }\n]"
              },
              "title" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Update Password\"\n      }\n    ]\n  }\n]"
              },
              "validationRules" : {
                "value" : []
              }
            })
          }
          position = {
            x = 634
            y = 1410
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
        "yta4119o2j" = {
          data = {
            id              = "yta4119o2j"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "goToNode"
            type            = "action"
            status          = "configured"
            properties = jsonencode({
              "email" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"teleport.svg\",\n        \"url\": \"email\",\n        \"data\": \"{{local.g5zcju90lh.payload.output.email}}\",\n        \"tooltip\": \"{{local.g5zcju90lh.payload.output.email}}\",\n        \"children\": [\n          {\n            \"text\": \"email\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeInstanceId" : {
                "value" : "g5zcju90lh"
              },
              "nodeTitle" : {
                "value" : "Resend Verification Node"
              },
              "p1UserId" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"teleport.svg\",\n        \"url\": \"p1UserId\",\n        \"data\": \"{{local.g5zcju90lh.payload.output.p1UserId}}\",\n        \"tooltip\": \"{{local.g5zcju90lh.payload.output.p1UserId}}\",\n        \"children\": [\n          {\n            \"text\": \"p1UserId\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "resendMessage" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"Verification code resent\"\n      }\n    ]\n  }\n]"
              }
            })
          }
          position = {
            x = 1534
            y = 3510
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
        "yx7qjbsw3i" = {
          data = {
            id               = "yx7qjbsw3i"
            node_type        = "CONNECTION"
            connection_id    = pingone_davinci_connector_instance.functions.id
            connector_id     = "functionsConnector"
            capability_class = "backend"
            name             = "Functions"
            label            = "Functions"
            capability_name  = "AEqualsMultipleB"
            type             = "trigger"
            status           = "configured"
            id_unique        = "r2yv077j8r"
            properties = jsonencode({
              "leftValueA" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"\"\n      },\n      {\n        \"type\": \"link\",\n        \"src\": \"http.svg\",\n        \"url\": \"buttonValue\",\n        \"data\": \"{{local.1k5y98i1v1.payload.output.buttonValue}}\",\n        \"tooltip\": \"{{local.1k5y98i1v1.payload.output.buttonValue}}\",\n        \"children\": [\n          {\n            \"text\": \"buttonValue\"\n          }\n        ]\n      },\n      {\n        \"text\": \"\"\n      }\n    ]\n  }\n]"
              },
              "nodeDescription" : {
                "value" : "Check Which Button Was Clicked"
              },
              "nodeTitle" : {
                "value" : "Register Form Button Action"
              },
              "rightValueB" : {
                "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"submit\"\n      }\n    ]\n  }\n]"
              },
              "rightValueMultiple" : {
                "value" : [
                  {
                    "id" : "vgii63uk2p",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"REGISTER\"\n      }\n    ]\n  }\n]"
                  },
                  {
                    "id" : "js0k5824y5",
                    "value" : "[\n  {\n    \"children\": [\n      {\n        \"text\": \"\"\n      },\n      {\n        \"text\": \"CANCEL\"\n      }\n    ]\n  }\n]"
                  }
                ]
              }
            })
          }
          position = {
            x = 934
            y = 2700
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
        "yxikxi5l6o" = {
          data = {
            id              = "yxikxi5l6o"
            node_type       = "CONNECTION"
            connection_id   = pingone_davinci_connector_instance.teleport.id
            connector_id    = "nodeConnector"
            name            = "Teleport"
            label           = "Node"
            capability_name = "startNode"
            type            = "trigger"
            status          = "configured"
            properties = jsonencode({
              "inputSchema" : {
                "value" : "{\n  \"type\": \"object\",\n  \"properties\": {\n    \n  }\n}"
              },
              "nodeTitle" : {
                "value" : "Forgot Password"
              }
            })
          }
          position = {
            x = 334
            y = 2070
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
        "zkumd1hvz" = {
          data = {
            id        = "zkumd1hvz"
            node_type = "EVAL"
          }
          position = {
            x = 454
            y = 4200
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
        "08ayiawv9i" = {
          data = {
            id     = "08ayiawv9i"
            source = "fdwqk6gwcr"
            target = "bttgkrchj0"
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
        "0i3tkbyy8b" = {
          data = {
            id     = "0i3tkbyy8b"
            source = "enx05mvp8c"
            target = "cqm26fxq1v"
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
        "197h694q6n" = {
          data = {
            id     = "197h694q6n"
            source = "x1t8u9nxcp"
            target = "v5ubajrpxk"
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
        "1q0yiwnr3p" = {
          data = {
            id     = "1q0yiwnr3p"
            source = "r810hd9rp9"
            target = "vqo96knyuj"
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
        "1xl21wu39d" = {
          data = {
            id     = "1xl21wu39d"
            source = "uqcbtnx4e1"
            target = "loevzm0utd"
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
        "2678mp2ugh" = {
          data = {
            id     = "2678mp2ugh"
            source = "hhnqmctxod"
            target = "1k5y98i1v1"
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
        "27cpyhncxe" = {
          data = {
            id     = "27cpyhncxe"
            source = "w7jmfry8oc"
            target = "bviv3cclyg"
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
        "2awiflienc" = {
          data = {
            id     = "2awiflienc"
            source = "9hip372enu"
            target = "mnljicn2pk"
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
        "2dl4jfrnu6" = {
          data = {
            id                    = "2dl4jfrnu6"
            source                = "6p6muqqewx"
            target                = "222zm3asev"
            multi_value_source_id = "ulnvuk7d7b"
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
        "2flujpqhzr" = {
          data = {
            id     = "2flujpqhzr"
            source = "yxikxi5l6o"
            target = "6qtawkceg5"
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
        "2prwok64ky" = {
          data = {
            id     = "2prwok64ky"
            source = "dpo5892st9"
            target = "xyquoj2bnj"
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
        "2yhibz0c35" = {
          data = {
            id     = "2yhibz0c35"
            source = "5y9f2f02rr"
            target = "9tfr3o22oe"
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
        "3bv3pe3nmk" = {
          data = {
            id     = "3bv3pe3nmk"
            source = "vfpfyx6zck"
            target = "oprqs443fg"
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
        "3duducvr3u" = {
          data = {
            id     = "3duducvr3u"
            source = "gfn4owly2t"
            target = "ofbbj58kbk"
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
        "3k036c7kae" = {
          data = {
            id     = "3k036c7kae"
            source = "wexx10oniw"
            target = "nbpi0nvr03"
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
        "3ud106e3ey" = {
          data = {
            id                    = "3ud106e3ey"
            source                = "x1vvv3tl7u"
            target                = "ffka4ssodt"
            multi_value_source_id = "8982ybbt5z"
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
        "409qhbfowd" = {
          data = {
            id     = "409qhbfowd"
            source = "rbflsn7loz"
            target = "o43vpz4na3"
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
        "454uyt4906" = {
          data = {
            id                    = "454uyt4906"
            source                = "yx7qjbsw3i"
            target                = "r810hd9rp9"
            multi_value_source_id = "js0k5824y5"
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
        "4lq5mst4ro" = {
          data = {
            id                    = "4lq5mst4ro"
            source                = "bttgkrchj0"
            target                = "vijb9f77kl"
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
        "4pmbgfslxz" = {
          data = {
            id                    = "4pmbgfslxz"
            source                = "dniadms1az"
            target                = "tfmz8ma5qc"
            multi_value_source_id = "js0k5824y5"
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
        "4qbfbhc8pb" = {
          data = {
            id     = "4qbfbhc8pb"
            source = "ffka4ssodt"
            target = "rkm3c18ybi"
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
        "4rzy6iervh" = {
          data = {
            id     = "4rzy6iervh"
            source = "q11byfsigx"
            target = "9hip372enu"
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
        "5b6ct5kpmr" = {
          data = {
            id     = "5b6ct5kpmr"
            source = "x0txd3bdfn"
            target = "uhekj7f0vs"
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
        "5b94ntvo7r" = {
          data = {
            id     = "5b94ntvo7r"
            source = "2xzcvx1gll"
            target = "rbflsn7loz"
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
        "5mq3ci9zy4" = {
          data = {
            id     = "5mq3ci9zy4"
            source = "0c41v9ejkb"
            target = "m4oszi4z7z"
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
        "68bo0quu2a" = {
          data = {
            id                    = "68bo0quu2a"
            source                = "bttgkrchj0"
            target                = "x1t8u9nxcp"
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
        "6fsigfspd3" = {
          data = {
            id     = "6fsigfspd3"
            source = "qfb6v9psi5"
            target = "pmbt2m9ugv"
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
        "77kdzdte3p" = {
          data = {
            id     = "77kdzdte3p"
            source = "vijb9f77kl"
            target = "wx0pcaeb6j"
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
        "7cv868n4ik" = {
          data = {
            id     = "7cv868n4ik"
            source = "f5gokcacx1"
            target = "h2zhng35ze"
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
        "7shinfbm42" = {
          data = {
            id                    = "7shinfbm42"
            source                = "6p6muqqewx"
            target                = "coc8d1r51c"
            multi_value_source_id = "s6l99t4t39"
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
        "7txr07uqh0" = {
          data = {
            id     = "7txr07uqh0"
            source = "6sz8ydjx57"
            target = "ez2e9cu7td"
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
        "7zw33ps22e" = {
          data = {
            id     = "7zw33ps22e"
            source = "uc0fpztdsq"
            target = "u1pe4uydjy"
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
        "8ba7u8r69a" = {
          data = {
            id     = "8ba7u8r69a"
            source = "noo95xupvp"
            target = "mxhmh9d4ym"
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
        "8cp4eninbl" = {
          data = {
            id     = "8cp4eninbl"
            source = "cqm26fxq1v"
            target = "flfi8l5inc"
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
        "8wpjy5fr4m" = {
          data = {
            id     = "8wpjy5fr4m"
            source = "usfhtwgo7x"
            target = "6p6muqqewx"
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
        "98kg2ju9ox" = {
          data = {
            id     = "98kg2ju9ox"
            source = "m4oszi4z7z"
            target = "3rcqks6t1v"
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
        "9oa9g2mppq" = {
          data = {
            id     = "9oa9g2mppq"
            source = "dqya4pmlto"
            target = "2otm488snv"
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
        "a92evago2f" = {
          data = {
            id     = "a92evago2f"
            source = "flfi8l5inc"
            target = "dnu7jt3sjz"
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
        "ahlym625bp" = {
          data = {
            id     = "ahlym625bp"
            source = "drxy3yocag"
            target = "guw4ri0ley"
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
        "ate9l8jaq2" = {
          data = {
            id                    = "ate9l8jaq2"
            source                = "nbpi0nvr03"
            target                = "q11byfsigx"
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
        "b005fvsyp5" = {
          data = {
            id     = "b005fvsyp5"
            source = "tnotjgrxhz"
            target = "0c41v9ejkb"
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
        "bc7wwp7p2l" = {
          data = {
            id     = "bc7wwp7p2l"
            source = "fnk14wxu53"
            target = "o4yhix414e"
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
        "cqh2254y6a" = {
          data = {
            id                    = "cqh2254y6a"
            source                = "yx7qjbsw3i"
            target                = "vl9mxvo9nn"
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
        "ctutvo7do4" = {
          data = {
            id     = "ctutvo7do4"
            source = "273gpisk0t"
            target = "5y9f2f02rr"
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
        "cya2ksv2nx" = {
          data = {
            id     = "cya2ksv2nx"
            source = "6w3hc2i5ra"
            target = "p2y85foy0y"
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
        "ec50lob6r7" = {
          data = {
            id     = "ec50lob6r7"
            source = "mnljicn2pk"
            target = "9tfr3o22oe"
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
        "eiydnjwr67" = {
          data = {
            id                    = "eiydnjwr67"
            source                = "dniadms1az"
            target                = "w7jmfry8oc"
            multi_value_source_id = "qtli5t2v0s"
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
        "emmyns1n1d" = {
          data = {
            id     = "emmyns1n1d"
            source = "uc0fpztdsq"
            target = "on0u5wrtq4"
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
        "emucb01so1" = {
          data = {
            id     = "emucb01so1"
            source = "ofk8hitz8r"
            target = "zkumd1hvz"
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
        "enx063vfy9" = {
          data = {
            id     = "enx063vfy9"
            source = "yscz5j5r84"
            target = "drxy3yocag"
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
        "eqx8gpal62" = {
          data = {
            id     = "eqx8gpal62"
            source = "mxhmh9d4ym"
            target = "tnotjgrxhz"
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
        "fa6nv0h3nz" = {
          data = {
            id     = "fa6nv0h3nz"
            source = "pjaqc3d5u5"
            target = "yta4119o2j"
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
        "fdmqo5ai3l" = {
          data = {
            id     = "fdmqo5ai3l"
            source = "c28j6unuv1"
            target = "p9wjd6i8se"
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
        "fkkoqkqd0h" = {
          data = {
            id     = "fkkoqkqd0h"
            source = "9gi11xivkc"
            target = "fdwqk6gwcr"
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
        "g10mu4xh95" = {
          data = {
            id     = "g10mu4xh95"
            source = "bznbtmirmf"
            target = "h8ydk3i4o5"
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
        "g20ztlefet" = {
          data = {
            id     = "g20ztlefet"
            source = "pmbt2m9ugv"
            target = "c28j6unuv1"
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
        "gbbc1gk3j3" = {
          data = {
            id     = "gbbc1gk3j3"
            source = "flfi8l5inc"
            target = "79aiikhgtb"
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
        "gfozj6gk1p" = {
          data = {
            id                    = "gfozj6gk1p"
            source                = "nbpi0nvr03"
            target                = "6sz8ydjx57"
            multi_value_source_id = "js0k5824y5"
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
        "gjz38j24u0" = {
          data = {
            id     = "gjz38j24u0"
            source = "pmbt2m9ugv"
            target = "jmzjeq5oev"
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
        "gm5pjmri1s" = {
          data = {
            id     = "gm5pjmri1s"
            source = "vl9mxvo9nn"
            target = "x0txd3bdfn"
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
        "hhs3s7hnq7" = {
          data = {
            id     = "hhs3s7hnq7"
            source = "ogah3oonyo"
            target = "9gi11xivkc"
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
        "i6lud58ymq" = {
          data = {
            id     = "i6lud58ymq"
            source = "dpo5892st9"
            target = "xyquoj2bnj"
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
        "ia8rdgx4om" = {
          data = {
            id     = "ia8rdgx4om"
            source = "4bhd6f955t"
            target = "jmzjeq5oev"
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
        "iojyk7vnqd" = {
          data = {
            id                    = "iojyk7vnqd"
            source                = "6p6muqqewx"
            target                = "6qs02z56rn"
            multi_value_source_id = "m3ii6p23fm"
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
        "is4qaa4cw6" = {
          data = {
            id     = "is4qaa4cw6"
            source = "uhekj7f0vs"
            target = "4p1hxq7p98"
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
        "it4l2jfypf" = {
          data = {
            id     = "it4l2jfypf"
            source = "oprqs443fg"
            target = "h2cy2gkjip"
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
        "j2rw7ieefg" = {
          data = {
            id     = "j2rw7ieefg"
            source = "t3gotwkiy8"
            target = "nf63ecqmal"
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
        "j30eomus4f" = {
          data = {
            id                    = "j30eomus4f"
            source                = "x1vvv3tl7u"
            target                = "uqcbtnx4e1"
            multi_value_source_id = "xplfpj1df8"
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
        "j8nwvt0x09" = {
          data = {
            id     = "j8nwvt0x09"
            source = "o4yhix414e"
            target = "dyx8hpj5xg"
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
        "jc6k9excld" = {
          data = {
            id                    = "jc6k9excld"
            source                = "guw4ri0ley"
            target                = "noo95xupvp"
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
        "k4ae67mny2" = {
          data = {
            id     = "k4ae67mny2"
            source = "65u7m8cm28"
            target = "ww8avrzf7x"
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
        "k7dhc1m1o5" = {
          data = {
            id     = "k7dhc1m1o5"
            source = "6qtawkceg5"
            target = "afyus0g868"
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
        "lhjvyph4lx" = {
          data = {
            id     = "lhjvyph4lx"
            source = "6qs02z56rn"
            target = "s26s7nbn5d"
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
        "lhu0480jlg" = {
          data = {
            id                    = "lhu0480jlg"
            source                = "guw4ri0ley"
            target                = "dqya4pmlto"
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
        "lrb0a4mwlr" = {
          data = {
            id     = "lrb0a4mwlr"
            source = "h2cy2gkjip"
            target = "bznbtmirmf"
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
        "lytn4kc36d" = {
          data = {
            id     = "lytn4kc36d"
            source = "9tfr3o22oe"
            target = "ogah3oonyo"
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
        "m30wzx20l6" = {
          data = {
            id     = "m30wzx20l6"
            source = "m2ey3u07aj"
            target = "yx7qjbsw3i"
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
        "m4xbocucg2" = {
          data = {
            id     = "m4xbocucg2"
            source = "3rcqks6t1v"
            target = "g62tgfk1ui"
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
        "my3lbu58ko" = {
          data = {
            id     = "my3lbu58ko"
            source = "rcet3ipqlt"
            target = "4bhd6f955t"
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
        "n720thy0kq" = {
          data = {
            id     = "n720thy0kq"
            source = "afyus0g868"
            target = "wexx10oniw"
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
        "n9cii0tyxn" = {
          data = {
            id     = "n9cii0tyxn"
            source = "m4oszi4z7z"
            target = "9hq9os87cl"
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
        "naz76y4du7" = {
          data = {
            id     = "naz76y4du7"
            source = "ww8avrzf7x"
            target = "dniadms1az"
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
        "o3u2fsugtq" = {
          data = {
            id     = "o3u2fsugtq"
            source = "rkm3c18ybi"
            target = "pjaqc3d5u5"
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
        "o6tlo7vj7z" = {
          data = {
            id     = "o6tlo7vj7z"
            source = "83vu4kprq4"
            target = "f5gokcacx1"
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
        "oxtm8ho61l" = {
          data = {
            id     = "oxtm8ho61l"
            source = "f5gokcacx1"
            target = "79aiikhgtb"
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
        "p3xtyleneh" = {
          data = {
            id     = "p3xtyleneh"
            source = "r7n4svgqft"
            target = "pqu44gofi8"
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
        "p57p3kbioo" = {
          data = {
            id                    = "p57p3kbioo"
            source                = "dniadms1az"
            target                = "enx05mvp8c"
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
        "p9fwakcgrw" = {
          data = {
            id     = "p9fwakcgrw"
            source = "tnotjgrxhz"
            target = "886l7dx7um"
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
        "q1ft2iv4on" = {
          data = {
            id     = "q1ft2iv4on"
            source = "dyx8hpj5xg"
            target = "x1vvv3tl7u"
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
        "qeuueo7f5k" = {
          data = {
            id     = "qeuueo7f5k"
            source = "458pe5w5g4"
            target = "7mtr7zq5h6"
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
        "qf76yz9774" = {
          data = {
            id     = "qf76yz9774"
            source = "zkumd1hvz"
            target = "ez2jj0j1q7"
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
        "qm3k1i5gwy" = {
          data = {
            id     = "qm3k1i5gwy"
            source = "ercttap70x"
            target = "vsyz2ijfwy"
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
        "s0oj2r71x1" = {
          data = {
            id     = "s0oj2r71x1"
            source = "o43vpz4na3"
            target = "458pe5w5g4"
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
        "s96hbnrr99" = {
          data = {
            id     = "s96hbnrr99"
            source = "g62tgfk1ui"
            target = "8tr0nbjz2r"
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
        "sb1zr4tgpi" = {
          data = {
            id     = "sb1zr4tgpi"
            source = "rtc1od0nlh"
            target = "e43svetjr5"
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
        "t3w17i3qa7" = {
          data = {
            id     = "t3w17i3qa7"
            source = "loevzm0utd"
            target = "uc0fpztdsq"
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
        "t6b7gqlowe" = {
          data = {
            id     = "t6b7gqlowe"
            source = "usfhtwgo7x"
            target = "83vu4kprq4"
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
        "t6lji3zsww" = {
          data = {
            id     = "t6lji3zsww"
            source = "p9wjd6i8se"
            target = "ta1tljqxgs"
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
        "tir0ulns9j" = {
          data = {
            id     = "tir0ulns9j"
            source = "tfmz8ma5qc"
            target = "q58gzphsoq"
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
        "tndis7tgip" = {
          data = {
            id     = "tndis7tgip"
            source = "dpo5892st9"
            target = "xyquoj2bnj"
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
        "tot79pcd4u" = {
          data = {
            id     = "tot79pcd4u"
            source = "6w3hc2i5ra"
            target = "rcet3ipqlt"
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
        "ul2vtbic0g" = {
          data = {
            id     = "ul2vtbic0g"
            source = "coc8d1r51c"
            target = "scrsg9o0e2"
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
        "v3yfrq6gb9" = {
          data = {
            id     = "v3yfrq6gb9"
            source = "4bhd6f955t"
            target = "qfb6v9psi5"
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
        "vav60pvoe0" = {
          data = {
            id     = "vav60pvoe0"
            source = "dnu7jt3sjz"
            target = "usfhtwgo7x"
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
        "vf8yl042pr" = {
          data = {
            id     = "vf8yl042pr"
            source = "7mtr7zq5h6"
            target = "gfn4owly2t"
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
        "w3ui4wufg3" = {
          data = {
            id     = "w3ui4wufg3"
            source = "uhekj7f0vs"
            target = "vfpfyx6zck"
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
        "w9e0rakj65" = {
          data = {
            id     = "w9e0rakj65"
            source = "xyquoj2bnj"
            target = "65u7m8cm28"
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
        "wwsxtshv98" = {
          data = {
            id     = "wwsxtshv98"
            source = "g5zcju90lh"
            target = "fnk14wxu53"
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
        "x15z6unyct" = {
          data = {
            id     = "x15z6unyct"
            source = "wx0pcaeb6j"
            target = "6w3hc2i5ra"
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
        "xcbo6qcobt" = {
          data = {
            id     = "xcbo6qcobt"
            source = "vsyz2ijfwy"
            target = "yscz5j5r84"
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
        "xiryepnjg3" = {
          data = {
            id                    = "xiryepnjg3"
            source                = "dniadms1az"
            target                = "ar0n0chx6u"
            multi_value_source_id = "-1"
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
        "xow1pai316" = {
          data = {
            id                    = "xow1pai316"
            source                = "6p6muqqewx"
            target                = "t3gotwkiy8"
            multi_value_source_id = "-1"
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
        "z7wrio00jo" = {
          data = {
            id     = "z7wrio00jo"
            source = "222zm3asev"
            target = "4qxu8ofxjj"
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
        "zfc5msz1fd" = {
          data = {
            id     = "zfc5msz1fd"
            source = "ar0n0chx6u"
            target = "0mkskx7cez"
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
        "zix3tqfi1g" = {
          data = {
            id     = "zix3tqfi1g"
            source = "1k5y98i1v1"
            target = "m2ey3u07aj"
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
        "zomgpif3gb" = {
          data = {
            id     = "zomgpif3gb"
            source = "qp6fpnw2hk"
            target = "hhnqmctxod"
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
        "zqnoptvnup" = {
          data = {
            id                    = "zqnoptvnup"
            source                = "bttgkrchj0"
            target                = "rtc1od0nlh"
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
        "zry8hun03e" = {
          data = {
            id     = "zry8hun03e"
            source = "pqu44gofi8"
            target = "65u7m8cm28"
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
    pingone_davinci_variable.company_logo,
    pingone_davinci_variable.company_name,
  ]
}