`import Ember from 'ember'`

isValidURI = (uri) ->
  /^https?:\/\/[\w-]+(\.[\w-]+)+\.?(:\d+)?(\/\S*)?$/gi.test(uri)

IndexController = Ember.Controller.extend({
  multiServer: false
  loadingServer: false
  runServerFailed: false
  badURI: false
  server2BadURI: false
  server1: null
  server2: null

  submitBtnDisabled: (->
    return true if @get('loadingServer')
    null
  ).property('loadingServer')

  isMultiServer: ->
    @get('server1')? && @get('server2')?

  reset: ->
    @setProperties({
      multiServer: false
      loadingServer: false
      runServerFailed: false
      badURI: false
      server2BadURI: false
      server1: null
      server2: null
    })

  _updateNotifications: (->
    @notifications.clearAll()
    if @get('badURI') || @get('server2BadURI')
      @notifications.addNotification(
        message: 'URL not valid. Please enter a valid URL.',
        type: 'error'
      )
  ).observes("badURI", "server2BadURI")

  actions:
    addUrl: ->
      @set('multiServer', true)
      return

    removeUrl: ->
      @set('multiServer', false)
      @set('server2', null)
      return

    submit: ->
      @set('badURI', false)
      @set('server2BadURI', false)

      # quickly exit and avoid the AJAX call if the server field is empty
      if Ember.isEmpty(@get('server1'))
        @set('runServerFailed', true)
        return

      # check if bad URI
      if !isValidURI(@get('server1'))
        @set('badURI', true)
        return
      else if !Ember.isEmpty(@get('server2')) && !isValidURI(@get('server2'))
        @set('server2BadURI', true)
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
