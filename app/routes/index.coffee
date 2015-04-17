`import Ember from 'ember'`
`import DefaultRoute from '../mixins/default-route'`

IndexRoute = Ember.Route.extend(DefaultRoute, {
  model: ->
    {server1: null, server2: null}
})

`export default IndexRoute`
