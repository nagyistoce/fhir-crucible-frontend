`import Ember from 'ember'`

ErrorResultsRowComponent = Ember.Component.extend({
  tagName: 'tr'
  classNameBindings: ['active']

  errorResult: null
  selectedIssue: null
  suites: null

  active: (->
    return false unless @get('selectedIssue')?
    @get('errorResult') == @get('selectedIssue')
  ).property('errorResult', 'selectedIssue')

  suiteTitle: (->
    suite = @get('suites').filterBy('id', @get('errorResult.key')).get('firstObject')
    title = suite.get('title')
    if suite.get('resource_class')? && suite.get('resource_class').length>0
      title += "#{suite.get('resource_class').replace('FHIR::', '')}"
    title
  ).property('errorResult')

  click: ->
    @set('selectedIssue', @get('errorResult'))
    return
})

`export default ErrorResultsRowComponent`
