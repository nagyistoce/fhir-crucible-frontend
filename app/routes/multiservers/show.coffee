`import Ember from 'ember'`

MultiserversShowRoute = Ember.Route.extend({
  model: (params) ->
    # Retrieve both servers either from passed in parameters (landing page)
    if params.server?
      @store.find('server', params.server.server_id).then( (server) =>
        @store.find('server', params.destinationServer.server_id).then( (destinationServer) =>
          return {
            server: server
            destinationServer: destinationServer
          }
        )
      )
    # or the id parameter (from refreshing multiservers.show)
    else
      servers = params.multiserver_id.split('-')
      @store.find('server', servers[0]).then( (server) =>
        @store.find('server', servers[1]).then( (destinationServer) =>
          return {
            server: server
            destinationServer: destinationServer
          }
        )
      )

  afterModel: (model) ->
    @store.find("test", {multiserver: "true"}).then((tests) =>
      @controllerFor('multiservers.show').set('tests', tests)
      @controllerFor('multiservers.show').set('server', model.server)
      @controllerFor('multiservers.show').set('destinationServer', model.destinationServer)
      return
    )

  actions:
    # Clear out conformance and server models to reset conformance
    willTransition: (transition) ->
      server = @controllerFor('multiservers.show').get('server')
      destinationServer = @controllerFor('multiservers.show').get('destinationServer')
      @store.find('conformance', server.get('conformance.id')).then( (conformance) =>
        @store.unloadRecord(conformance)
        @store.unloadRecord(server)
      )
      @store.find('conformance', destinationServer.get('conformance.id')).then( (conformance) =>
        @store.unloadRecord(conformance)
        @store.unloadRecord(destinationServer)
      )
      return
})

`export default MultiserversShowRoute`
