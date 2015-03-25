`import Ember from 'ember'`

ConformanceViewComponent = Em.Component.extend
  conformance: null
  testResults: null
  operations: ["read", "vread", "update", "delete", "historyInstance", "validate", "historyType", "create", "searchType"]

  validatedResources: (->
    @get('testResults')?.mapBy('validatedResources')
  ).property('conformance', 'testResults.@each.results')

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

`export default ConformanceViewComponent`
