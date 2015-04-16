`import Ember from 'ember'`

IndexController = Ember.Controller.extend({
  queryParams: ['registered']
  registered: false
  multiServer: false

  actions:
    addUrl: ->
      @set('multiServer', true)

    removeUrl: ->
      @set('multiServer', false)
      @get('model').set('server2', null)

    closeRegisteredAlert: ->
      @set('registered', false)
      return
})

`export default IndexController`
