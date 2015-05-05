`import Ember from 'ember'`
`import fhirCategoriesTemplate from './fhir-categories-template'`

fhirCategories = {

  # call this with a fully-resolved testRun (i.e., results have been fetched)
  generate: (testRun) ->
    aggregation = _.extend({},fhirCategoriesTemplate)
    results = testRun.get('testResults').mapBy('validatedResources')

    # Metadata is defined in the result model
    # { resource: res.resource,
    #   method: meth,
    #   passed:@get('passed'),
    #   test: @get('key'),
    #   description: @get('description') }
    for metadata in _(results).flatten()
      fhirCategories.updateOperations(aggregation, metadata)
      fhirCategories.updateResources(aggregation, metadata)
    # DEBUG: Uncomment below, right-click and save as Global Variable in Chrome
    # then use JSON.stringify(<gv>, null, 2) to grab JSON
    console.log aggregation

  updateOperations: (categories, metadata) ->
    method = metadata.method
    status = metadata.passed
    return unless method

    # FIXME: Figure out how to handle system-wide operations
    method = method.split("-")[0] if method.split("-").length

    # extract operation leaves from categories
    api = categories.children
    operations = api[0].children
    restful_api = operations[0].children

    instance = restful_api[0].children
    type = restful_api[1].children
    whole = restful_api[2].children

    extended = operations[1].children

    # array containing lists of operation leaves
    aggregate_operations = [instance, type, whole, extended]

    # update any operation leaves with a name matching method
    for list in aggregate_operations
      for operation in list when operation.name == method
        fhirCategories.updateStatus(operation, status)

  updateResources: (categories, metadata) ->
    resource = metadata.resource
    status = metadata.passed
    return unless resource

    # extract resource leaves from categories
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
    idocument = infrastructure[1].children
    exchange = infrastructure[2].children
    conformance = infrastructure[3].children

    fsupport = financial[0].children
    billing = financial[1].children
    payment = financial[2].children
    other = financial[3].children

    # array containing lists of resource leaves
    aggregate_resources = [general, data_col_care_plan, med_imm_nut,
      diagnostics, attribution, entities, workflow, scheduling, isupport,
      idocument, exchange, conformance, fsupport, billing, payment, other]

    # update any resource leaves with a name matching resource, lowercased
    # TODO: Handle case/title mapping (e.g, CarePlan -> care plan)
    for list in aggregate_resources
      for res in list when res.name.toLowerCase() == resource.toLowerCase()
        fhirCategories.updateStatus(res, status)

  # update a category leaf's counts with status information
  updateStatus: (metadata, status) ->
    metadata.total++
    switch status
      when true then metadata.passed++
      when false then metadata.failed++
}

`export default fhirCategories`
