`import Ember from 'ember'`

FailedTestComponent = Ember.Component.extend(
  testId: null
  testMethod: null
  tag: null,

  actions: {
    addTagToFilter: ->
      @sendAction('addTagToFilter', @get('tag'))
      return
  }
)

`export default FailedTestComponent`
