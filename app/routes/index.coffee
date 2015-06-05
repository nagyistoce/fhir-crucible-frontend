`import Ember from 'ember'`
`import DefaultRoute from '../mixins/default-route'`

IndexRoute = Ember.Route.extend(DefaultRoute, {

  model: ->
    @store.find("aggregate-summary", 0)
  })
`export default IndexRoute`
