`import Ember from 'ember'`

TestRunDetailsComponent = Ember.Component.extend({
  testRun: null

  testRunTime: (->
    moment(@get('testRun.date')).format("h:mm a")
  ).property('testRun.date')

})

`export default TestRunDetailsComponent`
