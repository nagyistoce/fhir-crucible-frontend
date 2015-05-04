`import Ember from 'ember'`
`import DefaultRoute from '../../mixins/default-route'`

UsersIndexRoute = Ember.Route.extend(DefaultRoute, {
  model: ->
    Ember.RSVP.hash(
      servers: @store.find('server')
      tests: @store.find('test')
    )
})

`export default UsersIndexRoute`
