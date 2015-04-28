export default {
  "name": "API",
  "children": [
    {
      "name": "OPERATIONS",
      "children": [
        {
          "name": "RESTful API",
          "children": [
            {
              "name": "Instance Level Interactions",
              "children": [
                {
                  "name": "read",
                  "size": 1
                },
                {
                  "name": "vread",
                  "size": 2
                },
                {
                  "name": "update",
                  "size": 3
                },
                {
                  "name": "delete",
                  "size": 4
                },
                {
                  "name": "history",
                  "size": 5
                }
              ]
            },
            {
              "name": "Type Level Interactions",
              "children": [
                {
                  "name": "create",
                  "size": 6
                },
                {
                  "name": "search",
                  "size": 7
                },
                {
                  "name": "history",
                  "size": 8
                }
              ]
            },
            {
              "name": "Whole System Interactions",
              "children": [
                {
                  "name": "conformance",
                  "size": 9
                },
                {
                  "name": "transaction",
                  "size": 1
                },
                {
                  "name": "history",
                  "size": 2
                },
                {
                  "name": "search",
                  "size": 3
                }
              ]
            }
          ]
        },
        {
          "name": "Extended Operations",
          "children": [
            {
              "name": "$translate",
              "size": 4
            },
            {
              "name": "$closure",
              "size": 5
            },
            {
              "name": "$everything",
              "size": 6
            },
            {
              "name": "$questionnaire",
              "size": 7
            },
            {
              "name": "$populate",
              "size": 8
            },
            {
              "name": "$expand",
              "size": 9
            },
            {
              "name": "$lookup",
              "size": 1
            },
            {
              "name": "$validate",
              "size": 2
            },
            {
              "name": "$batch",
              "size": 3
            }
          ]
        }
      ]
    },
    {
      "name": "RESOURCES",
      "children": [
        {
          "name": "Clinical",
          "children": [
            {
              "name": "General",
              "children": [
                {
                  "name": "allergy intolerance",
                  "size": 4
                },
                {
                  "name": "clinical assessment",
                  "size": 5
                },
                {
                  "name": "condition",
                  "size": 6
                },
                {
                  "name": "referral request",
                  "size": 7
                },
                {
                  "name": "procedure",
                  "size": 8
                },
                {
                  "name": "contraindication",
                  "size": 9
                },
                {
                  "name": "risk assessment",
                  "size": 1
                },
                {
                  "name": "vision prescription",
                  "size": 2
                }
              ]
            },
            {
              "name": "Data Collection & Care Plan",
              "children": [
                {
                  "name": "questionnaire",
                  "size": 3
                },
                {
                  "name": "questionnaire answers",
                  "size": 4
                },
                {
                  "name": "family history",
                  "size": 5
                },
                {
                  "name": "care plan",
                  "size": 6
                },
                {
                  "name": "care plan2",
                  "size": 7
                },
                {
                  "name": "goal",
                  "size": 8
                }
              ]
            },
            {
              "name": "Medication, Immunization & Nutrition",
              "children": [
                {
                  "name": "medication",
                  "size": 9
                },
                {
                  "name": "medication administration",
                  "size": 1
                },
                {
                  "name": "medication dispense",
                  "size": 2
                },
                {
                  "name": "medication prescription",
                  "size": 3
                },
                {
                  "name": "medication statement",
                  "size": 4
                },
                {
                  "name": "nutrition order",
                  "size": 5
                },
                {
                  "name": "immunization",
                  "size": 6
                },
                {
                  "name": "immunization recommendation",
                  "size": 7
                }
              ]
            },
            {
              "name": "Diagnostics",
              "children": [
                {
                  "name": "observation",
                  "size": 8
                },
                {
                  "name": "diagnostic order",
                  "size": 9
                },
                {
                  "name": "diagnostic report",
                  "size": 1
                },
                {
                  "name": "imaging study",
                  "size": 2
                },
                {
                  "name": "imaging object selection",
                  "size": 3
                },
                {
                  "name": "specimen",
                  "size": 4
                }
              ]
            }
          ]
        },
        {
          "name": "Administrative",
          "children": [
            {
              "name": "Attribution",
              "children": [
                {
                  "name": "patient",
                  "size": 5
                },
                {
                  "name": "related person",
                  "size": 6
                },
                {
                  "name": "person",
                  "size": 7
                },
                {
                  "name": "practitioner",
                  "size": 8
                },
                {
                  "name": "organization",
                  "size": 9
                },
                {
                  "name": "healthcare service",
                  "size": 1
                }
              ]
            },
            {
              "name": "Entities",
              "children": [
                {
                  "name": "contract",
                  "size": 2
                },
                {
                  "name": "device",
                  "size": 3
                },
                {
                  "name": "device component",
                  "size": 4
                },
                {
                  "name": "device metric",
                  "size": 5
                },
                {
                  "name": "location",
                  "size": 6
                },
                {
                  "name": "substance",
                  "size": 7
                },
                {
                  "name": "group",
                  "size": 8
                }
              ]
            },
            {
              "name": "Workflow Management",
              "children": [
                {
                  "name": "encounter",
                  "size": 9
                },
                {
                  "name": "episode of care",
                  "size": 1
                },
                {
                  "name": "alert",
                  "size": 2
                },
                {
                  "name": "communication",
                  "size": 3
                },
                {
                  "name": "communication request",
                  "size": 4
                },
                {
                  "name": "supply",
                  "size": 5
                },
                {
                  "name": "device use statement",
                  "size": 6
                }
              ]
            },
            {
              "name": "Scheduling / Ordering",
              "children": [
                {
                  "name": "appointment",
                  "size": 7
                },
                {
                  "name": "appointment response",
                  "size": 8
                },
                {
                  "name": "schedule",
                  "size": 9
                },
                {
                  "name": "slot",
                  "size": 1
                },
                {
                  "name": "order",
                  "size": 2
                },
                {
                  "name": "order response",
                  "size": 3
                },
                {
                  "name": "device use request",
                  "size": 4
                },
                {
                  "name": "procedure request",
                  "size": 5
                }
              ]
            }
          ]
        },
        {
          "name": "Infrastructure",
          "children": [
            {
              "name": "Support",
              "children": [
                {
                  "name": "media",
                  "size": 6
                },
                {
                  "name": "basic",
                  "size": 7
                },
                {
                  "name": "other",
                  "size": 8
                },
                {
                  "name": "provenance",
                  "size": 9
                },
                {
                  "name": "security event",
                  "size": 1
                }
              ]
            },
            {
              "name": "Document & Structure",
              "children": [
                {
                  "name": "list",
                  "size": 2
                },
                {
                  "name": "composition",
                  "size": 3
                },
                {
                  "name": "document manifest",
                  "size": 4
                },
                {
                  "name": "document reference",
                  "size": 5
                }
              ]
            },
            {
              "name": "Exchange",
              "children": [
                {
                  "name": "message header",
                  "size": 6
                },
                {
                  "name": "operation outcome",
                  "size": 7
                },
                {
                  "name": "subscription",
                  "size": 8
                },
                {
                  "name": "binary",
                  "size": 9
                },
                {
                  "name": "bundle",
                  "size": 1
                }
              ]
            },
            {
              "name": "Conformance",
              "children": [
                {
                  "name": "conformance",
                  "size": 2
                },
                {
                  "name": "profile",
                  "size": 3
                },
                {
                  "name": "extension definition",
                  "size": 4
                },
                {
                  "name": "data element",
                  "size": 5
                },
                {
                  "name": "search parameter",
                  "size": 6
                },
                {
                  "name": "operation definition",
                  "size": 7
                },
                {
                  "name": "value set",
                  "size": 8
                },
                {
                  "name": "naiming system",
                  "size": 9
                },
                {
                  "name": "concept map",
                  "size": 1
                }
              ]
            }
          ]
        },
        {
          "name": "Financial",
          "children": [
            {
              "name": "Support",
              "children": [
                {
                  "name": "coverage",
                  "size": 2
                },
                {
                  "name": "eligibility request",
                  "size": 3
                },
                {
                  "name": "eligibility response",
                  "size": 4
                },
                {
                  "name": "enrollment request",
                  "size": 5
                },
                {
                  "name": "enrollment response",
                  "size": 6
                },
                {
                  "name": "pended request",
                  "size": 7
                },
                {
                  "name": "reversal",
                  "size": 8
                },
                {
                  "name": "status request",
                  "size": 9
                },
                {
                  "name": "status response",
                  "size": 1
                },
                {
                  "name": "supporting documentation",
                  "size": 2
                }
              ]
            },
            {
              "name": "Billing",
              "children": [
                {
                  "name": "claim response",
                  "size": 3
                },
                {
                  "name": "institutional claim",
                  "size": 4
                },
                {
                  "name": "oral health claim",
                  "size": 5
                },
                {
                  "name": "pharmacy claim",
                  "size": 6
                },
                {
                  "name": "professional claim",
                  "size": 7
                },
                {
                  "name": "readjudicate",
                  "size": 8
                },
                {
                  "name": "vision claim",
                  "size": 9
                }
              ]
            },
            {
              "name": "Payment",
              "children": [
                {
                  "name": "payment notice",
                  "size": 1
                },
                {
                  "name": "payment reconciliation",
                  "size": 2
                }
              ]
            },
            {
              "name": "Other",
              "children": [
                {
                  "name": "explanation of benefit",
                  "size": 3
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "name": "FORMAT",
      "children": [
        {
          "name": "XML",
          "size": 4
        },
        {
          "name": "JSON",
          "size": 5
        }
      ]
    },
    {
      "name": "SECURITY",
      "children": [
        {
          "name": "Security Labels",
          "children": [
            {
              "name": "Break The Glass",
              "size": 6
            },
            {
              "name": "Confidentiality Classification",
              "size": 7
            },
            {
              "name": "Sensitivity Category",
              "size": 8
            },
            {
              "name": "Compartment Category",
              "size": 9
            },
            {
              "name": "Integrity Category",
              "size": 1
            },
            {
              "name": "Handling Caveat",
              "size": 2
            },
            {
              "name": "US Privacy Law",
              "size": 3
            }
          ]
        }
      ]
    },
    {
      "name": "MESSAGING",
      "children": [
        {
          "name": "Consequence",
          "size": 4
        },
        {
          "name": "Currency",
          "size": 5
        },
        {
          "name": "Notification",
          "size": 6
        }
      ]
    },
    {
      "name": "DOCUMENTS",
      "children": []
    },
    {
      "name": "PROFILES",
      "children": []
    },
    {
      "name": "EXTENSIONS",
      "children": []
    }
  ]
};
