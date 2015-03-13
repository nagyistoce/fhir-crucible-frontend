`import Ember from 'ember'`
`import DefaultRoute from '../../mixins/default-route'`

TestsRoute = Ember.Route.extend(DefaultRoute, {
  model: ->
    @get('store').find('test')
})

`export default TestsRoute`
