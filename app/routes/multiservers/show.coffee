`import Ember from 'ember'`

MultiserversShowRoute = Ember.Route.extend({
  model: (params) ->
    if params.server?
      server = @store.find('server', params.server.server_id)
      destinationServer = @store.find('server', params.destinationServer.server_id)
      {
        server: server
        destinationServer: destinationServer
      }
    else
      servers = params.multiserver_id.split('-')
      server = @store.find('server', servers[0])
      destinationServer = @store.find('server', servers[1])
      {
        server: server
        destinationServer: destinationServer
      }

  afterModel: ->
    @store.find("test", {multiserver: "true"}).then((tests) =>
      @controllerFor('multiservers.show').set('tests', tests)
      return
    )
})

`export default MultiserversShowRoute`
