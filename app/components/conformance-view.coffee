`import Ember from 'ember'`

ConformanceViewComponent = Em.Component.extend
  conformance: null
  testResults: null
  actions: ["read", "vread", "update", "delete", "historyInstance", "validate", "historyType", "create", "searchType"]

  validatedResources: (->
    @get('testResults')?.mapBy('validatedResources')
  ).property('conformance', 'testResults.@each.results')

`export default ConformanceViewComponent`
