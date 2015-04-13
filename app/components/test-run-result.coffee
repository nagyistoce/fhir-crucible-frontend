`import Ember from 'ember'`

TestRunResultComponent = Ember.Component.extend({
  result: null

  testRunResults: Ember.computed.oneWay('result.results')
  selectedTestResult: ((key, value) ->
    return value if arguments.length > 1
    @get('testRunResults.firstObject')
  ).property('testRunResults.[]')
})

`export default TestRunResultComponent`
