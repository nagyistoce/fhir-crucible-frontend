`import Ember from 'ember'`

ServersNewRoute = Ember.Route.extend({
  actions:
    submit: ->
      server = @get('currentModel')
      server.save()
      @transitionTo('servers.show', server)
  model: ->
    @store.createRecord('server')
})

`export default ServersNewRoute`
