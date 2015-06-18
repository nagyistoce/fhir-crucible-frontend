`import Ember from 'ember'`

TestComplianceError = Ember.Component.extend({
  proxiedIssue: null
  suites: null
  issue: Ember.computed.oneWay('proxiedIssue.content')

  suiteIssues: Ember.computed 'proxiedIssue.content', ->
    d3.nest()
      .key((d) -> d.suite_id)
      .entries(@get('proxiedIssue.values'))

  selectedIssue: ((key, value) ->
    return value if arguments.length > 1
    @get('suiteIssues.firstObject')
  ).property('suiteIssues.[]')

  _expandedObserver: (->
    @$('div.panel-collapse').collapse(if @get('proxiedIssue.expanded') then 'show' else 'hide')
    return
  ).observes('proxiedIssue.expanded')

  actions:
    expandCollapse: ->
      @toggleProperty('proxiedIssue.expanded')
      return
})

`export default TestComplianceError`
