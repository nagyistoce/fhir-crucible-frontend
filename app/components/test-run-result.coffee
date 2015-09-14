`import Ember from 'ember'`

TestRunResultComponent = Ember.Component.extend({
  proxiedResult: null
  result: Ember.computed.oneWay('proxiedResult.content')
  list: []
  id: Ember.computed.oneWay('proxiedResult.suite_id')
  filteredOut: (->
    temp = @get('list')
    if temp.contains(@get('id'))
      return false
    else
      return true
  ).property('list')

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
