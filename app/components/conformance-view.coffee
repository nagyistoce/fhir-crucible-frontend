`import Ember from 'ember'`

ConformanceViewComponent = Ember.Component.extend
  conformance: null
  testResults: null
  operations: ["read", "vread", "update", "delete", "historyInstance", "validate", "historyType", "create", "searchType"]

  validatedResources: (->
    @get('testResults')?.mapBy('validatedResources')
  ).property('conformance', 'testResults.@each.results')

  didInsertElement: ->
    @$('.panel-collapse').on('show.bs.collapse', ->
      Ember.$(@).closest('tr').removeClass('hidden')
    ).on('hidden.bs.collapse', ->
      Ember.$(@).closest('tr').addClass('hidden')
    )
    return

`export default ConformanceViewComponent`
