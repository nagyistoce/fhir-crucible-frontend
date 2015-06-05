`import Ember from 'ember'`

ErrorResultsRowComponent = Ember.Component.extend({
  tagName: 'tr'
  classNameBindings: ['active']

  suiteIssues: null
  selectedIssue: null

  active: (->
    return false unless @get('selectedIssue')?
    @get('suiteIssues') == @get('selectedIssue')
  ).property('suiteIssues', 'selectedIssue')

  click: ->
    @set('selectedIssue', @get('suiteIssues'))
    return
})

`export default ErrorResultsRowComponent`

