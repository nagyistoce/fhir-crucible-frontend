`import Ember from 'ember'`
`import DefaultRoute from '../mixins/default-route'`

IndexRoute = Ember.Route.extend(DefaultRoute, {
  actions:
    submit: ->
      if (@isMultiServer())
        multiserver = @store.createRecord('multiserver',
          url1: @controller.get('server1'),
          url2: @controller.get('server2'))
        multiserver.save()
        @transitionTo('multiservers.show', multiserver)
      else
        server = @store.createRecord('server', url: @controller.get('server1'))
        server.save().then(=> @transitionTo('servers.show', server))

  isMultiServer: ->
    @controller.get('server1')? && @controller.get('server2')?
  model: ->
    {server1: null, server2: null}
})

`export default IndexRoute`
