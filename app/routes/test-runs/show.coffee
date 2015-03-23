`import Ember from 'ember'`
`import DefaultRoute from '../../mixins/default-route'`

TestRunsShowRoute = Ember.Route.extend(DefaultRoute, {
  beforeModel: (transition)->
    @store.findAll('test')

  afterModel: (model) ->
    model.get('server').then((server) =>
      @controllerFor('test-runs/show').set('server', server)
    )
})

`export default TestRunsShowRoute`
