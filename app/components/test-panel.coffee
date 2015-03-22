`import Ember from 'ember'`

TestPanel = Ember.Component.extend({
  proxiedTest: null
  test: Ember.computed.oneWay('proxiedTest.content')

  testDownloadURL: (->
    "/ctl/#{@get('test.specificTitle')}.xml"
  ).property('test.specificTitle')

  _expandedObserver: (->
    @$('a.expandable').toggleClass('collapsed', !@get('proxiedTest.expanded'))
    @$('div.panel-collapse').collapse(if @get('proxiedTest.expanded') then 'show' else 'hide')
    return
  ).observes('proxiedTest.expanded')

  actions:
    expandCollapse: ->
      @toggleProperty('proxiedTest.expanded')
      return
})

`export default TestPanel`
