`import Ember from 'ember'`

ServerFhirSpecCategory = Ember.Component.extend(
  classNames: ['row']
  category: null

  tagName: 'tr'
  classNameBindings: ['active']
  level: null
  selectedLevel: null

  percentPassing: (->
    category = @get('category')

    return 0 if category.total == 0
    Math.round(category.passed / category.total * 100)
  ).property('category.passed', 'category.total')

  hasFailingTests: Ember.computed.gt('category.failed', 0)
  untested: Ember.computed.equal('category.total', 0)

  iconClass: (->
    if @get('hasFailingTests') || @get('untested')
      'fa-times-circle-o'
    else
      'fa-check-circle-o'
  ).property('hasFailingTests', 'untested')

  active: (->
    return false unless @get('selectedLevel')?
    @get('level') == @get('selectedLevel')
  ).property('level', 'selectedTestResult')

  click: ->
    @set('selectedLevel', @get('level'))
    return

  iconColorClass: (->
    if @get('hasFailingTests')
      'icon-failed'
    else if @get('untested')
      'icon-untested'
    else
      'icon-passed'
  ).property('hasFailingTests', 'untested')
)

`export default ServerFhirSpecCategory`
