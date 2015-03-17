`import Ember from 'ember'`

UsersIndexController = Ember.Controller.extend({
  servers: Ember.computed.oneWay('model.servers')
  testRuns: Ember.computed.oneWay('model.testRuns')
  proxiedServers: Ember.computed.map('servers', (server) -> Ember.Object.create(content: server, selected: false))

  url: null
  aggregatedTestRuns: []

  currentServers: (->
    @get('proxiedServers').filterBy('selected', true).mapBy('content')
  ).property('proxiedServers.@each.selected')

  _currentServersObserver: (->
    Ember.run.once(@, @_updateSelectedTestRuns)
  ).observes('currentServers.[]', 'testRuns.[]').on('init')

  _updateSelectedTestRuns: ->
    serverIds = @get('currentServers').mapBy('id')
    if serverIds.length == 0
      @set('aggregatedTestRuns', [])
      return []
    testRuns = @get('testRuns')
    promises = @get('testRuns').map((testRun) -> testRun.get('server'))
    Ember.RSVP.all(promises).then(=>
      @set('aggregatedTestRuns', testRuns.filter((testRun) -> serverIds.indexOf(testRun.get('server.id')) > -1))
      return
    )
    return

  actions:
    toggleServer: (server) ->
      server.toggleProperty('selected')
      false

    submit: ->
      server = @store.createRecord('server', url: @get('url'))
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
