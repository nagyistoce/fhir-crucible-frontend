`import Ember from 'ember'`

MultiserversShowRoute = Ember.Route.extend({
  model: (params) ->
    if params.server?
      @store.find('server', params.server.server_id).then( (server) =>
        @store.find('server', params.destinationServer.server_id).then( (destinationServer) =>
          return {
            server: server
            destinationServer: destinationServer
          }
        )
      )
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
})

`export default MultiserversShowRoute`
