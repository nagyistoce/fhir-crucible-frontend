`import Ember from 'ember'`
`import DefaultRoute from '../../mixins/default-route'`

UsersIndexRoute = Ember.Route.extend(DefaultRoute, {
  model: ->
    Ember.RSVP.hash(
      servers: @store.findAll('server')
      testRuns: @store.findAll('testRun')
      tests: @store.findAll('test')
    )

  actions:
    submit: ->
      server = @store.createRecord('server', url: @currentModel.url);
      server.save()
      $('#addServerInput').hide()

    addServer: ->
      $('#addServerInput').toggle()

    runTest: (server) ->
      @transitionTo('servers.show', server)
})

`export default UsersIndexRoute`
