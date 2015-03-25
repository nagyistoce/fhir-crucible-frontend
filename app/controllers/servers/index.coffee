`import Ember from 'ember'`

ServersIndexController = Ember.Controller.extend({

  actions:
    deleteServer: (server) ->
      server.destroyRecord()
      return

})

`export default ServersIndexController`
