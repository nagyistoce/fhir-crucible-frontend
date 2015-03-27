`import Ember from 'ember'`

TestRunDetailsComponent = Ember.Component.extend({
  testRun: null
  servers: null
  serverColors: d3.scale.category20().domain([0..19])

  testRunTime: (->
    moment(@get('testRun.date')).format("lll")
  ).property('testRun.date')

  testRunName: (->
    @get('testRun.server.name') || @get('testRun.server.url')
  ).property('testRun.server.name', 'testRun.server.url')

  afterRenderColor: (->
    Ember.run.scheduleOnce('afterRender', @, ->
      @$(".#{@get('testRun.server.id')}").css('color', @get('serverColors')(@get('servers').indexOf(@get('testRun.server.id'))))
    )
  ).on('didInsertElement')

})

`export default TestRunDetailsComponent`
