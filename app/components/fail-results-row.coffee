`import Ember from 'ember'`

FailResultsRowComponent = Ember.Component.extend({
  tagName: 'tr'
  classNameBindings: ['active']

  failResult: null
  selectedIssue: null
  suites: null

  active: (->
    return false unless @get('selectedIssue')?
    @get('failResult') == @get('selectedIssue')
  ).property('failResult', 'selectedIssue')

  suiteTitle: (->
    suite = @get('suites').filterBy('id', @get('failResult.key')).get('firstObject')
    title = suite.get('title')
    if suite.get('resource_class')? && suite.get('resource_class').length>0
      title += "#{suite.get('resource_class').replace('FHIR::', '')}"
    title
  ).property('failResult')

  click: ->
    @set('selectedIssue', @get('failResult'))
    return
})

`export default FailResultsRowComponent`
