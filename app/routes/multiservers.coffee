`import Ember from 'ember'`
`import DefaultRoute from '../mixins/default-route'`

MultiserversRoute = Ember.Route.extend(DefaultRoute, {
  model: ->
    @store.findAll('multiserver')
})

`export default MultiserversRoute`
