`import Ember from 'ember'`

TestRunDetailsComponent = Ember.Component.extend({
  test_run: null

  testRunTime: (->
    moment(@test_run.get('date')).format("h:mm a")
  ).property('test_run.date')

})

`export default TestRunDetailsComponent`
