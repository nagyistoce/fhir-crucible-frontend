`import Ember from 'ember'`
`import DefaultRoute from '../mixins/default-route'`

IndexRoute = Ember.Route.extend(DefaultRoute, {

  beforeModel: -> @store.findAll('server')

  model: ->
    @store.find("aggregate-summary", 0)
  })
`export default IndexRoute`
