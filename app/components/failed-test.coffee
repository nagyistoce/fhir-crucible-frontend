`import Ember from 'ember'`

FailedTestComponent = Ember.Component.extend(
  issue: null
  testId: Ember.computed('issue', -> @get('issue.id'))
  testMethod: Ember.computed('issue', -> @get('issue.method'))
  validates: Ember.computed('issue', -> [@get('issue.method'), @get('issue.resource')])
  links: Ember.computed('issue', -> @get('issue.links'))
  testData: Ember.computed('issue', -> @get('issue.testData'))
  tag: null,

  actions: {
    addTagToFilter: ->
      @sendAction('addTagToFilter', @get('tag'))
      return
  }
)

`export default FailedTestComponent`
