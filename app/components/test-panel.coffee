`import Ember from 'ember'`

TestPanel = Ember.Component.extend({
  proxiedTest: null
  test: Ember.computed.oneWay('proxiedTest.content')

  actions:
    expandCollapse: ->
      @toggleProperty('proxiedResult.expanded')
      @$('div.panel-collapse').collapse(if @get('proxiedResult.expanded') then 'show' else 'hide')
      return
})

`export default TestPanel`
