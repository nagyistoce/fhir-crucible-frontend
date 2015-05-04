`import Ember from 'ember'`
`import DefaultRoute from '../mixins/default-route'`

IndexRoute = Ember.Route.extend(DefaultRoute, {
  model: ->
    Ember.$.getJSON('/api/summary/latest')

  afterModel: ->
    @store.find('server').then((servers) =>
      @controllerFor('index').set('servers', servers)
    )
})

`export default IndexRoute`
