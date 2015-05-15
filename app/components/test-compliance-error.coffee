`import Ember from 'ember'`

TestComplianceError = Ember.Component.extend({
  proxiedIssue: null
  issue: Ember.computed.oneWay('proxiedIssue.content')

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
