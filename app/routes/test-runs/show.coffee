`import Ember from 'ember'`
`import DefaultRoute from '../../mixins/default-route'`

TestRunsShowRoute = Ember.Route.extend(DefaultRoute, {
  beforeModel: (transition) ->
    @store.findAll('test')

  afterModel: (model) ->
    if model.get('isMultiserver')
      model.get('server').then( (server) =>
        @controllerFor('test-runs/show').set('server', server)
        model.get('destinationServer').then( (destinationServer)=>
          @controllerFor('test-runs/show').set('destinationServer', destinationServer)
        )
      )
    else
      model.get('server').then( (server) =>
        @controllerFor('test-runs/show').set('server', server)
      )

})

`export default TestRunsShowRoute`
