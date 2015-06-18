`import Ember from 'ember'`

ServersShowRoute = Ember.Route.extend({
  model: (params) ->
    @store.find('server', params.server_id)

  setupController: (controller, model) ->
    controller.set('model', model)
    controller.set('suites', @store.findAll('test'))

  actions:
    executeTests: ->
      @transitionTo('servers.test', @get('currentModel'))

    testRunsPage: ->
      @transitionTo('test_runs.show', @get('currentModel.summary.testRun'))
})

`export default ServersShowRoute`
