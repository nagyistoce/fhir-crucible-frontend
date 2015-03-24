`import Ember from 'ember'`

TestPanel = Ember.Component.extend({
  proxiedTest: null
  test: Ember.computed.oneWay('proxiedTest.content')

  _expandedObserver: (->
    @$('div.panel-collapse').collapse(if @get('proxiedTest.expanded') then 'show' else 'hide')
    return
  ).observes('proxiedTest.expanded')

  actions:
    expandCollapse: ->
      @toggleProperty('proxiedTest.expanded')
      return
})

`export default TestPanel`
