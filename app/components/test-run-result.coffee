`import Ember from 'ember'`

TestRunResultComponent = Ember.Component.extend({
  proxiedResult: null
  result: Ember.computed.oneWay('proxiedResult.content')
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

})

`export default TestRunResultComponent`
