`import Ember from 'ember'`
`import DefaultRoute from '../../mixins/default-route'`

UsersIndexRoute = Ember.Route.extend(DefaultRoute, {
  model: ->
    Ember.RSVP.hash(
      servers: @store.find('server')
      testRuns: @store.find('testRun')
      tests: @store.find('test')
    )
})

`export default UsersIndexRoute`
