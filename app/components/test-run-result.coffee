`import Ember from 'ember'`

TestRunResultComponent = Ember.Component.extend({
  methods: []
  proxiedResult: null
  filteredOut: false
  result: Ember.computed.oneWay('proxiedResult.content')
  testRunResults: Ember.computed.oneWay('result.results')
  testMethodNames: Ember.computed.oneWay('result.test.methods')

  isInStarburstFilter: (->
    for method in @testMethodNames
      if @methods.contains(method)
        @set('filteredOut', true)
        return true
  ).property('methods', 'testMethodNames')

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
