`import Ember from 'ember'`

IndexController = Ember.Controller.extend({
  multiServer: false,

  actions:
    addUrl: ->
      @set('multiServer', true)

    removeUrl: ->
      @set('multiServer', false)
      @get('model').set('server2', null)
})

`export default IndexController`
