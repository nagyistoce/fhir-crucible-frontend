`import Ember from 'ember'`
`import DefaultRoute from '../mixins/default-route'`

IndexRoute = Ember.Route.extend(DefaultRoute, {
  actions:
    submit: ->
      if (@isMultiServer())
        server = @store.createRecord('server', url: @controller.get('server1'))
        destinationServer = @store.createRecord('server', url: @controller.get('server2'))
        server.save().then(=>
          destinationServer.save().then(=>
            multiserver = {
              server: server
              destinationServer: destinationServer
              multiserver_id: "#{server.get('id')}-#{destinationServer.get('id')}"
            }
            @transitionTo('multiservers.show', multiserver)
          )
        )
      else
        server = @store.createRecord('server', url: @controller.get('server1'))
        server.save().then(=> @transitionTo('servers.show', server))

  isMultiServer: ->
    @controller.get('server1')? && @controller.get('server2')?
  model: ->
    {server1: null, server2: null}
})

`export default IndexRoute`
