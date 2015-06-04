`import Ember from 'ember'`

IndexController = Ember.Controller.extend({
  multiServer: false
  loadingServer: false
  runServerFailed: false
  server1: null
  server2: null

  isMultiServer: ->
    @get('server1')? && @get('server2')?

  reset: ->
    @setProperties({
      multiServer: false
      loadingServer: false
      runServerFailed: false
      server1: null
      server2: null
    })

  actions:
    addUrl: ->
      @set('multiServer', true)
      return

    removeUrl: ->
      @set('multiServer', false)
      @set('server2', null)
      return

    submit: ->
      # quickly exit and avoid the AJAX call if the server field is empty
      if Ember.isEmpty(@get('server1'))
        @set('runServerFailed', true)
        return

      # load server
      @set('loadingServer', true)
      if (@isMultiServer())
        server = @store.createRecord('server', url: @get('server1'))
        destinationServer = @store.createRecord('server', url: @get('server2'))
        server.save().then(=>
          destinationServer.save().then(=>
            multiserver = {
              server: server
              destinationServer: destinationServer
              multiserver_id: "#{server.get('id')}-#{destinationServer.get('id')}"
            }
            @transitionToRoute('multiservers.show', multiserver).then(=> @reset())
            return
          )
        )
      else
        server = @store.createRecord('server', url: @get('server1'))
        server.save().then(=> @transitionToRoute('servers.test', server)).then(=> @reset())
        return
})

`export default IndexController`
