`import Ember from 'ember'`
`import fhirCategoriesTemplate from './fhir-categories-template'`

fhirCategories = {

  generate: (testRun) ->
    aggregation = _.extend({},fhirCategoriesTemplate)
    results = testRun.get('testResults').mapBy('validatedResources')
    return unless _.chain(results).flatten().compact().value().length >=7
    for metadata in _(results).flatten()
      fhirCategories.updateOperations(aggregation, metadata)
      fhirCategories.updateResources(aggregation, metadata)
    console.log aggregation

  updateOperations: (categories, metadata) ->
    method = metadata.method
    status = metadata.passed
    return unless method
    method = method.split("-")[0] if method.split("-").length
    api = categories.children
    operations = api[0].children
    restful_api = operations[0].children

    instance = restful_api[0].children
    type = restful_api[1].children
    whole = restful_api[2].children

    extended = operations[1].children

    aggregate_operations = [instance, type, whole, extended]

    for list in aggregate_operations
      for operation in list when operation.name == method
        fhirCategories.updateStatus(operation, status)

  updateResources: (categories, metadata) ->
    resource = metadata.resource
    status = metadata.passed
    return unless resource
    api = categories.children
    resources = api[1].children
    clinical = resources[0].children
    administrative = resources[1].children
    infrastructure = resources[2].children
    financial = resources[3].children

    general = clinical[0].children
    data_col_care_plan = clinical[1].children
    med_imm_nut = clinical[2].children
    diagnostics = clinical[3].children

    attribution = administrative[0].children
    entities = administrative[1].children
    workflow = administrative[2].children
    scheduling = administrative[3].children

    isupport = infrastructure[0].children
    document = infrastructure[1].children
    exchange = infrastructure[2].children
    conformance = infrastructure[3].children

    fsupport = financial[0].children
    billing = financial[1].children
    payment = financial[2].children
    other = financial[3].children

    aggregate_resources = [general, data_col_care_plan, med_imm_nut,
      diagnostics, attribution, entities, workflow, scheduling, isupport,
      document, exchange, conformance, fsupport, billing, payment, other]

    for list in aggregate_resources
      for res in list when res.name.toLowerCase() == resource.toLowerCase()
        fhirCategories.updateStatus(res, status)

  updateStatus: (metadata, status) ->
    metadata.total++
    switch status
      when true then metadata.passed++
      when false then metadata.failed++
}

`export default fhirCategories`
