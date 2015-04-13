`import Ember from 'ember'`

ResultsRowComponent = Ember.Component.extend(
  tagName: 'tr'
  classNameBindings: ['active']

  testResult: null
  selectedTestResult: null

  active: (->
    return false unless @get('selectedTestResult')?
    @get('testResult') == @get('selectedTestResult')
  ).property('testResult', 'selectedTestResult')

  click: ->
    @set('selectedTestResult', @get('testResult'))
    return
)

`export default ResultsRowComponent`
