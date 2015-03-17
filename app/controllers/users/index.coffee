`import Ember from 'ember'`

UsersIndexController = Ember.Controller.extend({
  servers: Ember.computed.oneWay('model.servers')
  proxiedServers: Ember.computed.map('servers', (server) -> Ember.Object.create(content: server, selected: false))

  url: null

  currentServers: (->
    @get('proxiedServers').filterBy('selected', true).mapBy('content')
  ).property('proxiedServers.@each.selected')

  currentTestRuns: (->
   @model.testRuns.filter(( (testRun) ->
      # return true if this.length == 0
      @mapBy('id').indexOf(testRun.get('server.id')) > -1
    ), @get('currentServers'))
  ).property('currentServers')

  actions:
    toggleServer: (server) ->
      server.toggleProperty('selected')
      false

    submit: ->
      server = @store.createRecord('server', url: @get('url'));
      server.save()
      @set('url', null)
      $('#addServerInput').hide()
      return

    addServer: ->
      @set('url', null)
      $('#addServerInput').toggle()
      return

    runTest: (server) ->
      @transitionToRoute('servers.show', server)
      return
})

`export default UsersIndexController`
