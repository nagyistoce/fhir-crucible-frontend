`import Ember from 'ember'`

ErrorResultsRowComponent = Ember.Component.extend({
  tagName: 'tr'
  classNameBindings: ['active']

  errorResult: null
  selectedErrorResult: null

  active: (->
    return false unless @get('selectedErrorResult')?
    @get('errorResult') == @get('selectedErrorResult')
  ).property('errorResult', 'selectedErrorResult')

  click: ->
    @set('selectedErrorResult', @get('errorResult'))
    return
})

`export default ErrorResultsRowComponent`