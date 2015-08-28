`import Ember from 'ember'`

TestRunResultComponent = Ember.Component.extend({
  proxiedResult: null
  result: Ember.computed.oneWay('proxiedResult.content')
  expanded: Ember.computed.oneWay('proxiedResult.expanded')
  testRunResults: Ember.computed.oneWay('result.results')
  selectedTestResult: ((key, value) ->
    return value if arguments.length > 1
    @get('testRunResults.firstObject')
  ).property('testRunResults.[]')

  actions:
    expandCollapse: ->
      @toggleProperty('proxiedResult.expanded')
      @$('div.panel-collapse').collapse(if @get('proxiedResult.expanded') then 'show' else 'hide')
      return
})

`export default TestRunResultComponent`
