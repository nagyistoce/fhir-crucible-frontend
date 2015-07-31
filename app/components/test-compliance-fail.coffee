`import Ember from 'ember'`
`import InViewportMixin from 'ember-in-viewport'`

rAFIDS = {}

TestComplianceFail = Ember.Component.extend(InViewportMixin, {
  classNameBindings: ['isSelected:active-test-failure']

  currentIssue: null

  isSelected: Ember.computed('currentIssue', 'proxiedIssue', ->
    @get('currentIssue') == @get('proxiedIssue')
  )

  viewportOptionsOverride: Ember.on('didInsertElement', ->
    Ember.setProperties(this, { viewportSpy: true, viewportTolerance: { top: 0 } })
    return
  ),

  _setViewportEntered: (context) ->
    element = @get('element')
    elementBounds = element.getBoundingClientRect()

    viewportTop = $(context).scrollTop()
    viewportHeight = $(context).height()
    viewportBottom = viewportTop + viewportHeight

    elementTop = elementBounds.top + document.body.scrollTop
    elementBottom = elementBounds.bottom + document.body.scrollTop

    elementLargerThanViewport = elementBounds.height > viewportHeight

    inView = false

    if elementLargerThanViewport && elementTop < viewportTop && elementBottom > viewportBottom
      # element is larger than the viewport, and is inside the viewport
      inView = true
    else if elementTop >= viewportTop && elementBottom <= viewportBottom
      # element is fully in view
      inView = true
    else
      deltaTop = Math.min(1, (elementBottom - viewportTop) / elementBounds.height)
      deltaBottom = Math.min(1, (viewportBottom - elementTop) / elementBounds.height)

      inView = (deltaTop * deltaBottom) >= 0.9

    this._triggerDidAccessViewport(inView)

    if elementBounds && @get('viewportUseRAF')
      rAFIDS[@get('elementId')] = window.requestAnimationFrame(
        Ember.run.bind(@, @_setViewportEntered, context)
      )

    return

  _unbindListeners: ->
    @_super.apply(@, arguments)

    elementId = @get('elementId')
    if @get('viewportUseRAF')
      Ember.run.next(@, ->
        window.cancelAnimationFrame(rAFIDS[elementId])
        delete rAFIDS[elementId]
        return
      )

    return

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

  actions: {
    selectIssue: ->
      @sendAction('selectIssue', @get('proxiedIssue'))
      return

    addTagToFilter: (tag) ->
      @sendAction('addTagToFilter', tag)
      return
  }
})

`export default TestComplianceFail`
