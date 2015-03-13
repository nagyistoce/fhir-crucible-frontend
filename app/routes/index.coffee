`import Ember from 'ember'`
`import DefaultRoute from '../mixins/default-route'`

IndexRoute = Ember.Route.extend(DefaultRoute, {
  actions:
    submit: ->
      if (@isMultiServer())
        multiserver = @store.createRecord('multiserver', url1: @currentModel.server1, url2: @currentModel.server2);
        multiserver.save()
        @transitionTo('multiservers.show', multiserver)
      else
        server = @store.createRecord('server', url: @currentModel.server1);
        server.save().then(=> @transitionTo('servers.show', server))

  isMultiServer: ->
    @currentModel.server1? && @currentModel.server2
  model: ->
    {server1: null, server2: null}
})

`export default IndexRoute`
