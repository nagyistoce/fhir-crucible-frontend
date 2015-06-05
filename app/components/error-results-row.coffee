`import Ember from 'ember'`

ErrorResultsRowComponent = Ember.Component.extend({
  tagName: 'tr'
  classNameBindings: ['active']

  errorResult: null
  selectedIssue: null

  active: (->
    return false unless @get('selectedIssue')?
    @get('errorResult') == @get('selectedIssue')
  ).property('errorResult', 'selectedIssue')

  click: ->
    @set('selectedIssue', @get('errorResult'))
    return
})

`export default ErrorResultsRowComponent`