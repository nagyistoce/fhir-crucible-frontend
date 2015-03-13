`import Ember from 'ember'`
`import DefaultRoute from '../../mixins/default-route'`

ServersIndexRoute = Ember.Route.extend({
  model: ->
    @store.findAll('server')
})

`export default ServersIndexRoute`
