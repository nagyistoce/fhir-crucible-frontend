`import Ember from 'ember'`
`import DefaultRoute from '../../mixins/default-route'`

TestRunsShowRoute = Ember.Route.extend(DefaultRoute, {
  beforeModel: (transition)->
    @store.findAll('test')
})

`export default TestRunsShowRoute`
