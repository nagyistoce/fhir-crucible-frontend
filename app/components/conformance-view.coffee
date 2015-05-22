`import Ember from 'ember'`

ConformanceViewComponent = Em.Component.extend
  conformance: null
  testResults: null
  operations: ["read", "vread", "update", "delete", "historyInstance", "validate", "historyType", "create", "searchType"]

  validatedResources: (->
    @get('testResults')?.mapBy('validatedResources')
  ).property('conformance', 'testResults.@each.results')

  modes: Ember.computed.oneWay('conformance.rest')

  testedResources: (->

    # get all resources in a flat array
    resources = []
    validatedResourceTypes = []
    ensureArray(@get('modes')).forEach((mode) ->
      resources.addObjects(mode.get('resource'))
      return
    )

    # get all the tested resource types
    ensureArray(@get('validatedResources')).forEach((validatedResource) ->
      validatedResourceTypes.addObjects(validatedResource.mapBy('resource'))
      return
    )

    # filter out untested resources
    if !Ember.isEmpty(validatedResourceTypes)
      resources = resources.filter((resource) ->
        validatedResourceTypes.indexOf(resource.get('fhirType')) > -1
      )

    # return resulting resources
    resources
  ).property('modes.[]', 'validatedResources.[]')

  _collapseObserver: (->
    @$().on('show.bs.collapse', '.panel-collapse', ->
      Ember.$(@).closest('tr').removeClass('hidden')
    ).on('hidden.bs.collapse', '.panel-collapse', ->
      Ember.$(@).closest('tr').addClass('hidden')
    )
    return
  ).on('didInsertElement')

  _removeCollapseObserver: (->
    @$().off('show.bs.collapse').off('hidden.bs.collapse')
    return
  ).on('willDestroyElement')

ensureArray = (array) ->
  array || []

`export default ConformanceViewComponent`
