`import Ember from 'ember'`

TestRunResultComponent = Ember.Component.extend({
  proxiedResult: null
  result: Ember.computed.oneWay('proxiedResult.content')
  id: Ember.computed.oneWay('proxiedResult.suite_id')
  filteredOut: Ember.computed.oneWay('proxiedResult.filteredOut')

  testRunResults: Ember.computed.oneWay('result.results')
  selectedTestResult: ((key, value) ->
    return value if arguments.length > 1
    @get('testRunResults.firstObject')
  ).property('testRunResults.[]')


  _expandedObserver: (->
    @$('div.panel-collapse').collapse(if @get('proxiedResult.expanded') then 'show' else 'hide')
    return
  ).observes('proxiedResult.expanded')

  actions:
    expandCollapse: ->
      @toggleProperty('proxiedResult.expanded')
      return

    test: ->
      debugger
      return

})

`export default TestRunResultComponent`
