`import Ember from 'ember'`

ServersShowRoute = Ember.Route.extend({
  model: (params) ->
    @store.find('server', params.server_id)

  afterModel: ->
    # conformance = DS.PromiseObject.create({promise: $.get("/api/servers/conformance?url=#{model.server.get("url")}")})
    # conformance.then(() => model.server.set("conformance", @store.createRecord('conformance', json: [conformance.content])))

    @store.find("test", {multiserver: false}).then((tests) =>
      @controllerFor('servers.show').set('tests', tests)
      return
    )
})

`export default ServersShowRoute`
