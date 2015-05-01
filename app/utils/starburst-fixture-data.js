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
                                    "total" : 203,
                                    "passed" : 2,
                                    "failed" : 201
                                },
                                {
                                    "name" : "vread",
                                    "total" : 201,
                                    "passed" : 0,
                                    "failed" : 201
                                },
                                {
                                    "name" : "update",
                                    "total" : 104,
                                    "passed" : 2,
                                    "failed" : 102
                                },
                                {
                                    "name" : "delete",
                                    "total" : 100,
                                    "passed" : 0,
                                    "failed" : 100
                                },
                                {
                                    "name" : "history",
                                    "total" : 110,
                                    "passed" : 4,
                                    "failed" : 106
                                }
                            ],
                            "total" : 718,
                            "passed" : 8,
                            "failed" : 710
                        },
                        {
                            "name" : "Type Level Interactions",
                            "children" : [
                                {
                                    "name" : "create",
                                    "total" : 114,
                                    "passed" : 2,
                                    "failed" : 112
                                },
                                {
                                    "name" : "search",
                                    "total" : 1,
                                    "passed" : 0,
                                    "failed" : 1
                                },
                                {
                                    "name" : "history",
                                    "total" : 110,
                                    "passed" : 4,
                                    "failed" : 106
                                }
                            ],
                            "total" : 225,
                            "passed" : 6,
                            "failed" : 219
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
                                    "total" : 110,
                                    "passed" : 4,
                                    "failed" : 106
                                },
                                {
                                    "name" : "search",
                                    "total" : 1,
                                    "passed" : 0,
                                    "failed" : 1
                                }
                            ],
                            "total" : 111,
                            "passed" : 4,
                            "failed" : 107
                        }
                    ],
                    "total" : 1054,
                    "passed" : 18,
                    "failed" : 1036
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
                            "passed" : 1,
                            "failed" : 7
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
                            "total" : 0,
                            "passed" : 0,
                            "failed" : 0
                        },
                        {
                            "name" : "$lookup",
                            "total" : 0,
                            "passed" : 0,
                            "failed" : 0
                        },
                        {
                            "name" : "$validate",
                            "total" : 0,
                            "passed" : 0,
                            "failed" : 0
                        },
                        {
                            "name" : "$batch",
                            "total" : 0,
                            "passed" : 0,
                            "failed" : 0
                        }
                    ],
                    "total" : 8,
                    "passed" : 1,
                    "failed" : 7
                }
            ],
            "total" : 1062,
            "passed" : 19,
            "failed" : 1043
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
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "clinical assessment",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "condition",
                                    "total" : 12,
                                    "passed" : 0,
                                    "failed" : 12
                                },
                                {
                                    "name" : "referral request",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "procedure",
                                    "total" : 12,
                                    "passed" : 0,
                                    "failed" : 12
                                },
                                {
                                    "name" : "contraindication",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "risk assessment",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "vision prescription",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                }
                            ],
                            "total" : 90,
                            "passed" : 0,
                            "failed" : 90
                        },
                        {
                            "name" : "Data Collection & Care Plan",
                            "children" : [
                                {
                                    "name" : "questionnaire",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "questionnaire answers",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "family history",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "care plan",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "care plan2",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "goal",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                }
                            ],
                            "total" : 66,
                            "passed" : 0,
                            "failed" : 66
                        },
                        {
                            "name" : "Medication, Immunization & Nutrition",
                            "children" : [
                                {
                                    "name" : "medication",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "medication administration",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "medication dispense",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "medication prescription",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "medication statement",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "nutrition order",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "immunization",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "immunization recommendation",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                }
                            ],
                            "total" : 88,
                            "passed" : 0,
                            "failed" : 88
                        },
                        {
                            "name" : "Diagnostics",
                            "children" : [
                                {
                                    "name" : "observation",
                                    "total" : 14,
                                    "passed" : 2,
                                    "failed" : 12
                                },
                                {
                                    "name" : "diagnostic order",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "diagnostic report",
                                    "total" : 12,
                                    "passed" : 0,
                                    "failed" : 12
                                },
                                {
                                    "name" : "imaging study",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "imaging object selection",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "specimen",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                }
                            ],
                            "total" : 70,
                            "passed" : 2,
                            "failed" : 68
                        }
                    ],
                    "total" : 314,
                    "passed" : 2,
                    "failed" : 312
                },
                {
                    "name" : "Administrative",
                    "children" : [
                        {
                            "name" : "Attribution",
                            "children" : [
                                {
                                    "name" : "patient",
                                    "total" : 43,
                                    "passed" : 10,
                                    "failed" : 33
                                },
                                {
                                    "name" : "related person",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "person",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "practitioner",
                                    "total" : 12,
                                    "passed" : 0,
                                    "failed" : 12
                                },
                                {
                                    "name" : "organization",
                                    "total" : 12,
                                    "passed" : 0,
                                    "failed" : 12
                                },
                                {
                                    "name" : "healthcare service",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                }
                            ],
                            "total" : 100,
                            "passed" : 10,
                            "failed" : 90
                        },
                        {
                            "name" : "Entities",
                            "children" : [
                                {
                                    "name" : "contract",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "device",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "device component",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "device metric",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "location",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "substance",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "group",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                }
                            ],
                            "total" : 77,
                            "passed" : 0,
                            "failed" : 77
                        },
                        {
                            "name" : "Workflow Management",
                            "children" : [
                                {
                                    "name" : "encounter",
                                    "total" : 12,
                                    "passed" : 0,
                                    "failed" : 12
                                },
                                {
                                    "name" : "episode of care",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "alert",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "communication",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "communication request",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "supply",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "device use statement",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                }
                            ],
                            "total" : 78,
                            "passed" : 0,
                            "failed" : 78
                        },
                        {
                            "name" : "Scheduling / Ordering",
                            "children" : [
                                {
                                    "name" : "appointment",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "appointment response",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "schedule",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "slot",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "order",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "order response",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "device use request",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "procedure request",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                }
                            ],
                            "total" : 88,
                            "passed" : 0,
                            "failed" : 88
                        }
                    ],
                    "total" : 343,
                    "passed" : 10,
                    "failed" : 333
                },
                {
                    "name" : "Infrastructure",
                    "children" : [
                        {
                            "name" : "Support",
                            "children" : [
                                {
                                    "name" : "media",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "basic",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "other",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "provenance",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "security event",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                }
                            ],
                            "total" : 55,
                            "passed" : 0,
                            "failed" : 55
                        },
                        {
                            "name" : "Document & Structure",
                            "children" : [
                                {
                                    "name" : "list",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "composition",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "document manifest",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "document reference",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                }
                            ],
                            "total" : 44,
                            "passed" : 0,
                            "failed" : 44
                        },
                        {
                            "name" : "Exchange",
                            "children" : [
                                {
                                    "name" : "message header",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "operation outcome",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "subscription",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "binary",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "bundle",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                }
                            ],
                            "total" : 55,
                            "passed" : 0,
                            "failed" : 55
                        },
                        {
                            "name" : "Conformance",
                            "children" : [
                                {
                                    "name" : "conformance",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "profile",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "extension definition",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "data element",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "search parameter",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "operation definition",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "value set",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "naming system",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "concept map",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                }
                            ],
                            "total" : 99,
                            "passed" : 0,
                            "failed" : 99
                        }
                    ],
                    "total" : 253,
                    "passed" : 0,
                    "failed" : 253
                },
                {
                    "name" : "Financial",
                    "children" : [
                        {
                            "name" : "Support",
                            "children" : [
                                {
                                    "name" : "coverage",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "eligibility request",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "eligibility response",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "enrollment request",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "enrollment response",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "pended request",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "reversal",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "status request",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "status response",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "supporting documentation",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                }
                            ],
                            "total" : 110,
                            "passed" : 0,
                            "failed" : 110
                        },
                        {
                            "name" : "Billing",
                            "children" : [
                                {
                                    "name" : "claim response",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "institutional claim",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "oral health claim",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "pharmacy claim",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "professional claim",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "readjudicate",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "vision claim",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                }
                            ],
                            "total" : 77,
                            "passed" : 0,
                            "failed" : 77
                        },
                        {
                            "name" : "Payment",
                            "children" : [
                                {
                                    "name" : "payment notice",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                },
                                {
                                    "name" : "payment reconciliation",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                }
                            ],
                            "total" : 22,
                            "passed" : 0,
                            "failed" : 22
                        },
                        {
                            "name" : "Other",
                            "children" : [
                                {
                                    "name" : "explanation of benefit",
                                    "total" : 11,
                                    "passed" : 0,
                                    "failed" : 11
                                }
                            ],
                            "total" : 11,
                            "passed" : 0,
                            "failed" : 11
                        }
                    ],
                    "total" : 220,
                    "passed" : 0,
                    "failed" : 220
                }
            ],
            "total" : 1130,
            "passed" : 12,
            "failed" : 1118
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
    "total" : 2192,
    "passed" : 31,
    "failed" : 2161
};
