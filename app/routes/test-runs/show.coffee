`import Ember from 'ember'`
`import DefaultRoute from '../../mixins/default-route'`
`import fhirCategories from '../../utils/fhir-categories'`

TestRunsShowRoute = Ember.Route.extend(DefaultRoute, {
  beforeModel: (transition) ->
    @store.findAll('test')

  afterModel: (model) ->
    if model.get('isMultiserver')
      # Retrieve both servers for multiserver test run
      model.get('server').then( (server) =>
        @controllerFor('test-runs/show').set('server', server)
        model.get('destinationServer').then( (destinationServer) =>
          @controllerFor('test-runs/show').set('destinationServer', destinationServer)
        )
      )
    else
      model.get('server').then( (server) =>
        @controllerFor('test-runs/show').set('server', server)
      )

  actions:
    # didTransition: ->
    #   console.log @controller.get('model')
    #   console.log 'will compute categories!'
    #   console.log fhirCategories(@controller.get('model'))
    # Clear out conformance and server models to reset conformance
    willTransition: (transition) ->
      server = @controllerFor('test-runs/show').get('server')
      destinationServer = @controllerFor('test-runs/show').get('destinationServer')
      @store.unloadRecord(server)
      @store.unloadRecord(destinationServer) if destinationServer
      return

})

`export default TestRunsShowRoute`
