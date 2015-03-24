`import Ember from 'ember'`
`import DefaultRoute from '../../mixins/default-route'`

UsersIndexRoute = Ember.Route.extend(DefaultRoute, {
  model: ->
    Ember.RSVP.hash(
      servers: @store.findAll('server')
      testRuns: @store.findAll('testRun')
      tests: @store.findAll('test')
    )
})

`export default UsersIndexRoute`
