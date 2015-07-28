`import Ember from 'ember'`
`import InViewportMixin from 'ember-in-viewport'`

TestComplianceFail = Ember.Component.extend(InViewportMixin, {
  classNameBindings: ['isSelected:active-test-failure']

  currentIssue: null

  isSelected: Ember.computed('currentIssue', 'proxiedIssue', ->
    @get('currentIssue') == @get('proxiedIssue')
  )

  viewportOptionsOverride: Ember.on('didInsertElement', ->
    Ember.setProperties(this, { viewportSpy: true, viewportTolerance: { top: 80, bottom: 80 } })
    return
  ),

  proxiedIssue: null
  suites: null
  issue: Ember.computed.oneWay('proxiedIssue.content')

  suiteIssues: Ember.computed 'proxiedIssue.content', ->
    d3.nest()
      .key((d) -> d.suite_id)
      .entries(@get('proxiedIssue.values'))

  didEnterViewport: ->
    @sendAction('enteredViewport', @get('proxiedIssue'))
    return

  didExitViewport: ->
    console.log('left')
    @sendAction('exitedViewport', @get('proxiedIssue'))
    return
})

`export default TestComplianceFail`
