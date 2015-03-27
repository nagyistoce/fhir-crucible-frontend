`import Ember from 'ember'`

TestRunDetailsComponent = Ember.Component.extend({
  testRun: null
  servers: null
  serverColors: d3.scale.category20().domain([0..19])

  testRunTime: (->
    moment(@get('testRun.date')).format("lll")
  ).property('testRun.date')

  afterRenderColor: (->
    Ember.run.scheduleOnce('afterRender', @, ->
      @$(".#{@get('testRun.server.id')}").css('color', @get('serverColors')(@get('servers').indexOf(@get('testRun.server.id'))))
    )
  ).on('didInsertElement')

})

`export default TestRunDetailsComponent`
