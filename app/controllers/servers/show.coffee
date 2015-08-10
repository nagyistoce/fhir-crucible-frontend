`import Ember from 'ember'`

ServersShowController = Ember.Controller.extend({
  server: Ember.computed.oneWay('model')
  suites: []
})

`export default ServersShowController`