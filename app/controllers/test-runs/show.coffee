`import Ember from 'ember'`

TestRunsShowController = Ember.Controller.extend({
  testRunServer: Ember.computed.oneWay('model.server')
  name: null

  testsExecuting: (->
    @get('model.testResults').mapBy('hasResults').contains(false)
  ).property('model.testResults.@each.hasResults')

  executionProgress: (->
    total = @get('model.testResults').mapBy('test').getEach('methods')
      .getEach('length').reduce( ((s,t) -> s+t), 0)
    loaded = @get('model.testResults').mapBy('results')
      .getEach('length').reduce( ((s,t) -> s+t), 0)
    ( ( loaded / Math.max(total,1) ) * 100 )
  ).property('model.testResults.@each.results')

  progressStyle: (->
    progress = @get('executionProgress') || 2
    Ember.$('.execution-progressbar').css("width","#{progress}%")
  ).observes('executionProgress')

  actions:
    rerun: ->
      @transitionToRoute('servers.show', @get('model.server'))

    editServerName: ->
      @set('name', null)
      $('#editServerNameInput').toggle()
      return

    submit: ->
      server = @store.createRecord('server', name: @get('name'))
      server.save()
      @set('name', null)
      $('#editServerNameInput').hide()
      return
})

`export default TestRunsShowController`
