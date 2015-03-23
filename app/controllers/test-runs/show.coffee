`import Ember from 'ember'`

TestRunsShowController = Ember.Controller.extend({
  server: null

  name: null
  editingServerName: false
  savingServerName: false

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
      @setProperties(name: @get('server.name'), editingServerName: true)
      return

    submit: ->
      @set('savingServerName', true)

      successFn = =>
        @setProperties(editingServerName: false, savingServerName: false)

      errorFn = =>
        alert('There was a problem saving the server name, please try again.')
        @setProperties(editingServerName: false, savingServerName: false)
        return

      server = @get('server')
      server.set('name', @get('name'))
      server.save().then(successFn, errorFn)
      return
})

`export default TestRunsShowController`
