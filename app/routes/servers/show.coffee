`import Ember from 'ember'`

ServersShowRoute = Ember.Route.extend({
  model: (params) ->
    @store.find('summary', params.server_id)

  actions:
    executeTests: ->
      @transitionTo('servers.test', @get('currentModel.server'))

    testRunsPage: ->
      @transitionTo('test_runs.show', @get('currentModel.testRun'))
})

`export default ServersShowRoute`
