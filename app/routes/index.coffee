`import Ember from 'ember'`
`import DefaultRoute from '../mixins/default-route'`

IndexRoute = Ember.Route.extend(DefaultRoute, {
  model: ->
    Ember.$.getJSON('/api/summary/latest').then((summaries) =>
      summaries.summaries.map((summary) =>
        @store.push('summary', @store.normalize('summary', summary))
      )
    )

  afterModel: ->
    @store.find('server').then((servers) =>
      @controllerFor('index').set('servers', servers)
    )
})

`export default IndexRoute`