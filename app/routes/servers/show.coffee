`import Ember from 'ember'`

ServersShowRoute = Ember.Route.extend({
  model: (params) ->
    @store.find('server', params.server_id)

  afterModel: (model) ->
    @store.findAll('test').then((tests) =>
      @controllerFor('servers.show').set('suites', tests)
    )

  actions:
    executeTests: ->
      @transitionTo('servers.test', @get('currentModel'))

    testRunsPage: ->
      @transitionTo('test_runs.show', @get('currentModel.summary.testRun'))
})

`export default ServersShowRoute`
