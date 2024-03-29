`import Ember from 'ember'`

ServersTestRoute = Ember.Route.extend({
  model: (params) ->
    @store.find('server', params.server_id)

  afterModel: ->
    # conformance = DS.PromiseObject.create({promise: $.get("/api/servers/conformance?url=#{model.server.get("url")}")})
    # conformance.then(() => model.server.set("conformance", @store.createRecord('conformance', json: [conformance.content])))

    @store.find("test", {multiserver: false}).then((tests) =>
      @controllerFor('servers.test').set('tests', tests)
      return
    )

  actions:
    # Clear out conformance and server models to reset conformance
    willTransition: (transition) ->
      server = @controllerFor('servers.test').get('server')
      @store.unloadRecord(server)
      return
})

`export default ServersTestRoute`
