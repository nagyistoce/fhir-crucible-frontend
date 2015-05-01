export default {
    "name" : "API",
    "children" : [
        {
            "name" : "OPERATIONS",
            "children" : [
                {
                    "name" : "RESTful API",
                    "children" : [
                        {
                            "name" : "Instance Level Interactions",
                            "children" : [
                                {
                                    "name" : "read",
                                    "total" : 300,
                                    "passed" : 232,
                                    "failed" : 68
                                },
                                {
                                    "name" : "vread",
                                    "total" : 181,
                                    "passed" : 180,
                                    "failed" : 1
                                },
                                {
                                    "name" : "update",
                                    "total" : 95,
                                    "passed" : 54,
                                    "failed" : 41
                                },
                                {
                                    "name" : "delete",
                                    "total" : 90,
                                    "passed" : 50,
                                    "failed" : 40
                                },
                                {
                                    "name" : "history",
                                    "total" : 102,
                                    "passed" : 95,
                                    "failed" : 7
                                }
                            ],
                            "total" : 768,
                            "passed" : 611,
                            "failed" : 157
                        },
                        {
                            "name" : "Type Level Interactions",
                            "children" : [
                                {
                                    "name" : "create",
                                    "total" : 104,
                                    "passed" : 6,
                                    "failed" : 98
                                },
                                {
                                    "name" : "search",
                                    "total" : 361,
                                    "passed" : 348,
                                    "failed" : 13
                                },
                                {
                                    "name" : "history",
                                    "total" : 102,
                                    "passed" : 95,
                                    "failed" : 7
                                }
                            ],
                            "total" : 567,
                            "passed" : 449,
                            "failed" : 118
                        },
                        {
                            "name" : "Whole System Interactions",
                            "children" : [
                                {
                                    "name" : "conformance",
                                    "total" : 0,
                                    "passed" : 0,
                                    "failed" : 0
                                },
                                {
                                    "name" : "transaction",
                                    "total" : 0,
                                    "passed" : 0,
                                    "failed" : 0
                                },
                                {
                                    "name" : "history",
                                    "total" : 102,
                                    "passed" : 95,
                                    "failed" : 7
                                },
                                {
                                    "name" : "search",
                                    "total" : 361,
                                    "passed" : 348,
                                    "failed" : 13
                                }
                            ],
                            "total" : 463,
                            "passed" : 443,
                            "failed" : 20
                        }
                    ],
                    "total" : 1798,
                    "passed" : 1503,
                    "failed" : 295
                },
                {
                    "name" : "Extended Operations",
                    "children" : [
                        {
                            "name" : "$translate",
                            "total" : 0,
                            "passed" : 0,
                            "failed" : 0
                        },
                        {
                            "name" : "$closure",
                            "total" : 0,
                            "passed" : 0,
                            "failed" : 0
                        },
                        {
                            "name" : "$everything",
                            "total" : 8,
                            "passed" : 5,
                            "failed" : 3
                        },
                        {
                            "name" : "$questionnaire",
                            "total" : 0,
                            "passed" : 0,
                            "failed" : 0
                        },
                        {
                            "name" : "$populate",
                            "total" : 0,
                            "passed" : 0,
                            "failed" : 0
                        },
                        {
                            "name" : "$expand",
                            "total" : 14,
                            "passed" : 0,
                            "failed" : 14
                        },
                        {
                            "name" : "$lookup",
                            "total" : 0,
                            "passed" : 0,
                            "failed" : 0
                        },
                        {
                            "name" : "$validate",
                            "total" : 35,
                            "passed" : 0,
                            "failed" : 35
                        },
                        {
                            "name" : "$batch",
                            "total" : 0,
                            "passed" : 0,
                            "failed" : 0
                        }
                    ],
                    "total" : 57,
                    "passed" : 5,
                    "failed" : 52
                }
            ],
            "total" : 1855,
            "passed" : 1508,
            "failed" : 347
        },
        {
            "name" : "RESOURCES",
            "children" : [
                {
                    "name" : "Clinical",
                    "children" : [
                        {
                            "name" : "General",
                            "children" : [
                                {
                                    "name" : "allergy intolerance",
                                    "total" : 16,
                                    "passed" : 7,
                                    "failed" : 9
                                },
                                {
                                    "name" : "clinical assessment",
                                    "total" : 0,
                                    "passed" : 0,
                                    "failed" : 0
                                },
                                {
                                    "name" : "condition",
                                    "total" : 17,
                                    "passed" : 10,
                                    "failed" : 7
                                },
                                {
                                    "name" : "referral request",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "procedure",
                                    "total" : 17,
                                    "passed" : 10,
                                    "failed" : 7
                                },
                                {
                                    "name" : "contraindication",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "risk assessment",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "vision prescription",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                }
                            ],
                            "total" : 114,
                            "passed" : 71,
                            "failed" : 43
                        },
                        {
                            "name" : "Data Collection & Care Plan",
                            "children" : [
                                {
                                    "name" : "questionnaire",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                },
                                {
                                    "name" : "questionnaire answers",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                },
                                {
                                    "name" : "family history",
                                    "total" : 0,
                                    "passed" : 0,
                                    "failed" : 0
                                },
                                {
                                    "name" : "care plan",
                                    "total" : 16,
                                    "passed" : 8,
                                    "failed" : 8
                                },
                                {
                                    "name" : "care plan2",
                                    "total" : 0,
                                    "passed" : 0,
                                    "failed" : 0
                                },
                                {
                                    "name" : "goal",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                }
                            ],
                            "total" : 64,
                            "passed" : 38,
                            "failed" : 26
                        },
                        {
                            "name" : "Medication, Immunization & Nutrition",
                            "children" : [
                                {
                                    "name" : "medication",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                },
                                {
                                    "name" : "medication administration",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                },
                                {
                                    "name" : "medication dispense",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                },
                                {
                                    "name" : "medication prescription",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                },
                                {
                                    "name" : "medication statement",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                },
                                {
                                    "name" : "nutrition order",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "immunization",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                },
                                {
                                    "name" : "immunization recommendation",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                }
                            ],
                            "total" : 128,
                            "passed" : 81,
                            "failed" : 47
                        },
                        {
                            "name" : "Diagnostics",
                            "children" : [
                                {
                                    "name" : "observation",
                                    "total" : 19,
                                    "passed" : 10,
                                    "failed" : 9
                                },
                                {
                                    "name" : "diagnostic order",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                },
                                {
                                    "name" : "diagnostic report",
                                    "total" : 17,
                                    "passed" : 12,
                                    "failed" : 5
                                },
                                {
                                    "name" : "imaging study",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                },
                                {
                                    "name" : "imaging object selection",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "specimen",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                }
                            ],
                            "total" : 100,
                            "passed" : 63,
                            "failed" : 37
                        }
                    ],
                    "total" : 406,
                    "passed" : 253,
                    "failed" : 153
                },
                {
                    "name" : "Administrative",
                    "children" : [
                        {
                            "name" : "Attribution",
                            "children" : [
                                {
                                    "name" : "patient",
                                    "total" : 78,
                                    "passed" : 49,
                                    "failed" : 29
                                },
                                {
                                    "name" : "related person",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                },
                                {
                                    "name" : "person",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "practitioner",
                                    "total" : 17,
                                    "passed" : 10,
                                    "failed" : 7
                                },
                                {
                                    "name" : "organization",
                                    "total" : 17,
                                    "passed" : 10,
                                    "failed" : 7
                                },
                                {
                                    "name" : "healthcare service",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                }
                            ],
                            "total" : 160,
                            "passed" : 101,
                            "failed" : 59
                        },
                        {
                            "name" : "Entities",
                            "children" : [
                                {
                                    "name" : "contract",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "device",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                },
                                {
                                    "name" : "device component",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "device metric",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "location",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                },
                                {
                                    "name" : "substance",
                                    "total" : 16,
                                    "passed" : 8,
                                    "failed" : 8
                                },
                                {
                                    "name" : "group",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                }
                            ],
                            "total" : 112,
                            "passed" : 71,
                            "failed" : 41
                        },
                        {
                            "name" : "Workflow Management",
                            "children" : [
                                {
                                    "name" : "encounter",
                                    "total" : 17,
                                    "passed" : 10,
                                    "failed" : 7
                                },
                                {
                                    "name" : "episode of care",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "alert",
                                    "total" : 0,
                                    "passed" : 0,
                                    "failed" : 0
                                },
                                {
                                    "name" : "communication",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                },
                                {
                                    "name" : "communication request",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "supply",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                },
                                {
                                    "name" : "device use statement",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                }
                            ],
                            "total" : 97,
                            "passed" : 63,
                            "failed" : 34
                        },
                        {
                            "name" : "Scheduling / Ordering",
                            "children" : [
                                {
                                    "name" : "appointment",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                },
                                {
                                    "name" : "appointment response",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "schedule",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "slot",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "order",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "order response",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "device use request",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "procedure request",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                }
                            ],
                            "total" : 128,
                            "passed" : 87,
                            "failed" : 41
                        }
                    ],
                    "total" : 497,
                    "passed" : 322,
                    "failed" : 175
                },
                {
                    "name" : "Infrastructure",
                    "children" : [
                        {
                            "name" : "Support",
                            "children" : [
                                {
                                    "name" : "media",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                },
                                {
                                    "name" : "basic",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                },
                                {
                                    "name" : "other",
                                    "total" : 0,
                                    "passed" : 0,
                                    "failed" : 0
                                },
                                {
                                    "name" : "provenance",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "security event",
                                    "total" : 0,
                                    "passed" : 0,
                                    "failed" : 0
                                }
                            ],
                            "total" : 48,
                            "passed" : 31,
                            "failed" : 17
                        },
                        {
                            "name" : "Document & Structure",
                            "children" : [
                                {
                                    "name" : "list",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "composition",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "document manifest",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                },
                                {
                                    "name" : "document reference",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                }
                            ],
                            "total" : 64,
                            "passed" : 42,
                            "failed" : 22
                        },
                        {
                            "name" : "Exchange",
                            "children" : [
                                {
                                    "name" : "message header",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                },
                                {
                                    "name" : "operation outcome",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                },
                                {
                                    "name" : "subscription",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "binary",
                                    "total" : 16,
                                    "passed" : 13,
                                    "failed" : 3
                                },
                                {
                                    "name" : "bundle",
                                    "total" : 16,
                                    "passed" : 5,
                                    "failed" : 11
                                }
                            ],
                            "total" : 80,
                            "passed" : 49,
                            "failed" : 31
                        },
                        {
                            "name" : "Conformance",
                            "children" : [
                                {
                                    "name" : "conformance",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "profile",
                                    "total" : 0,
                                    "passed" : 0,
                                    "failed" : 0
                                },
                                {
                                    "name" : "extension definition",
                                    "total" : 0,
                                    "passed" : 0,
                                    "failed" : 0
                                },
                                {
                                    "name" : "data element",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                },
                                {
                                    "name" : "search parameter",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "operation definition",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "value set",
                                    "total" : 65,
                                    "passed" : 10,
                                    "failed" : 55
                                },
                                {
                                    "name" : "naming system",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "concept map",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                }
                            ],
                            "total" : 161,
                            "passed" : 74,
                            "failed" : 87
                        }
                    ],
                    "total" : 353,
                    "passed" : 196,
                    "failed" : 157
                },
                {
                    "name" : "Financial",
                    "children" : [
                        {
                            "name" : "Support",
                            "children" : [
                                {
                                    "name" : "coverage",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "eligibility request",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "eligibility response",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "enrollment request",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "enrollment response",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "pended request",
                                    "total" : 0,
                                    "passed" : 0,
                                    "failed" : 0
                                },
                                {
                                    "name" : "reversal",
                                    "total" : 0,
                                    "passed" : 0,
                                    "failed" : 0
                                },
                                {
                                    "name" : "status request",
                                    "total" : 0,
                                    "passed" : 0,
                                    "failed" : 0
                                },
                                {
                                    "name" : "status response",
                                    "total" : 0,
                                    "passed" : 0,
                                    "failed" : 0
                                },
                                {
                                    "name" : "supporting documentation",
                                    "total" : 0,
                                    "passed" : 0,
                                    "failed" : 0
                                }
                            ],
                            "total" : 80,
                            "passed" : 55,
                            "failed" : 25
                        },
                        {
                            "name" : "Billing",
                            "children" : [
                                {
                                    "name" : "claim response",
                                    "total" : 16,
                                    "passed" : 10,
                                    "failed" : 6
                                },
                                {
                                    "name" : "institutional claim",
                                    "total" : 0,
                                    "passed" : 0,
                                    "failed" : 0
                                },
                                {
                                    "name" : "oral health claim",
                                    "total" : 0,
                                    "passed" : 0,
                                    "failed" : 0
                                },
                                {
                                    "name" : "pharmacy claim",
                                    "total" : 0,
                                    "passed" : 0,
                                    "failed" : 0
                                },
                                {
                                    "name" : "professional claim",
                                    "total" : 0,
                                    "passed" : 0,
                                    "failed" : 0
                                },
                                {
                                    "name" : "readjudicate",
                                    "total" : 0,
                                    "passed" : 0,
                                    "failed" : 0
                                },
                                {
                                    "name" : "vision claim",
                                    "total" : 0,
                                    "passed" : 0,
                                    "failed" : 0
                                }
                            ],
                            "total" : 16,
                            "passed" : 10,
                            "failed" : 6
                        },
                        {
                            "name" : "Payment",
                            "children" : [
                                {
                                    "name" : "payment notice",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                },
                                {
                                    "name" : "payment reconciliation",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                }
                            ],
                            "total" : 32,
                            "passed" : 22,
                            "failed" : 10
                        },
                        {
                            "name" : "Other",
                            "children" : [
                                {
                                    "name" : "explanation of benefit",
                                    "total" : 16,
                                    "passed" : 11,
                                    "failed" : 5
                                }
                            ],
                            "total" : 16,
                            "passed" : 11,
                            "failed" : 5
                        }
                    ],
                    "total" : 144,
                    "passed" : 98,
                    "failed" : 46
                }
            ],
            "total" : 1400,
            "passed" : 869,
            "failed" : 531
        },
        {
            "name" : "FORMAT",
            "children" : [
                {
                    "name" : "XML",
                    "total" : 0,
                    "passed" : 0,
                    "failed" : 0
                },
                {
                    "name" : "JSON",
                    "total" : 0,
                    "passed" : 0,
                    "failed" : 0
                }
            ],
            "total" : 0,
            "passed" : 0,
            "failed" : 0
        },
        {
            "name" : "SECURITY",
            "children" : [
                {
                    "name" : "Security Labels",
                    "children" : [
                        {
                            "name" : "Break The Glass",
                            "total" : 0,
                            "passed" : 0,
                            "failed" : 0
                        },
                        {
                            "name" : "Confidentiality Classification",
                            "total" : 0,
                            "passed" : 0,
                            "failed" : 0
                        },
                        {
                            "name" : "Sensitivity Category",
                            "total" : 0,
                            "passed" : 0,
                            "failed" : 0
                        },
                        {
                            "name" : "Compartment Category",
                            "total" : 0,
                            "passed" : 0,
                            "failed" : 0
                        },
                        {
                            "name" : "Integrity Category",
                            "total" : 0,
                            "passed" : 0,
                            "failed" : 0
                        },
                        {
                            "name" : "Handling Caveat",
                            "total" : 0,
                            "passed" : 0,
                            "failed" : 0
                        },
                        {
                            "name" : "US Privacy Law",
                            "total" : 0,
                            "passed" : 0,
                            "failed" : 0
                        }
                    ],
                    "total" : 0,
                    "passed" : 0,
                    "failed" : 0
                }
            ],
            "total" : 0,
            "passed" : 0,
            "failed" : 0
        },
        {
            "name" : "MESSAGING",
            "children" : [
                {
                    "name" : "Consequence",
                    "total" : 0,
                    "passed" : 0,
                    "failed" : 0
                },
                {
                    "name" : "Currency",
                    "total" : 0,
                    "passed" : 0,
                    "failed" : 0
                },
                {
                    "name" : "Notification",
                    "total" : 0,
                    "passed" : 0,
                    "failed" : 0
                }
            ],
            "total" : 0,
            "passed" : 0,
            "failed" : 0
        },
        {
            "name" : "DOCUMENTS",
            "children" : [],
            "total" : 0,
            "passed" : 0,
            "failed" : 0
        },
        {
            "name" : "PROFILES",
            "children" : [],
            "total" : 0,
            "passed" : 0,
            "failed" : 0
        },
        {
            "name" : "EXTENSIONS",
            "children" : [],
            "total" : 0,
            "passed" : 0,
            "failed" : 0
        }
    ],
    "total" : 3255,
    "passed" : 2377,
    "failed" : 878
};
