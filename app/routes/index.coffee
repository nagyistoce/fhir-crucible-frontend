`import Ember from 'ember'`
`import DefaultRoute from '../mixins/default-route'`

IndexRoute = Ember.Route.extend(DefaultRoute, {

  beforeModel: -> @store.findAll('server')

  model: ->
    @store.find("aggregate-summary", 0)
    # Ember.RSVP.hash(
    #   summaries: @store.find("aggregate-summary", 0)
    #   servers: @store.findAll('server')
    # )
  })
`export default IndexRoute`
