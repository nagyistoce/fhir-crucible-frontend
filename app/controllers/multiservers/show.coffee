`import Ember from 'ember'`
`import trueNullProperty from '../../utils/true-null-property'`

MultiserversShowController = Ember.Controller.extend({
  tests: []
  proxiedTests: Ember.computed.map('tests', (test) -> Ember.Object.create(content: test, selected: false, expanded: false) )
  selectedTests: Ember.computed.mapBy('proxiedSelectedTests', 'content')
  proxiedSelectedTests: Ember.computed.filterBy('proxiedTests', 'selected', true)
  proxiedExpandedTests: Ember.computed.filterBy('proxiedTests', 'expanded', true)

  multiserver: Ember.computed.oneWay('model')
  server: Ember.computed.oneWay('model.server')
  destinationServer: Ember.computed.oneWay('model.destinationServer')
  savingTestRun: false

  selectAllBtnText: (->
    selectedCount = @get('selectedTests.length')
    if selectedCount == @get('tests.length')
      'Deselect All'
    else
      'Select All'
  ).property('selectedTests.length', 'tests.length')

  expandCollapseBtnText: (->
    expandedCount = @get('proxiedExpandedTests.length')
    if expandedCount == @get('tests.length')
      'Collapse All'
    else
      'Expand All'
  ).property('proxiedExpandedTests.length', 'tests.length')

  # Boolean property for determining if we can execute selected tests
  canExecuteTests: (->
    !(@get('selectedTests.length') > 0)
  ).property('selectedTests.length')

  executeTestsBtnDisabled: trueNullProperty('canExecuteTests')

  # Boolean property for determining if the server's conformance has loaded
  conformanceLoaded: (->
    @get('multiserver.server.conformance.isLoaded') &&
    @get('multiserver.destinationServer.conformance.isLoaded') ||
    false
  ).property('multiserver.server.conformance', 'multiserver.destinationServer.conformance')

  actions:
    selectDeselectAll: ->
      # toggle the checkbox of 'selectDeselect' and toggle the checkboxes
      selected = @get('selectedTests')
      prop = selected.length < @get('tests.length')
      @get('proxiedTests').setEach('selected', prop)
      return

    expandCollapseAll: ->
      expanded = @get('proxiedExpandedTests')
      prop = expanded.length < @get('tests.length')
      @get('proxiedTests').setEach('expanded', prop)
      return

    executeTests:->
      return if @get('selectedTests').length == 0

      @set('savingTestRun', true)
      run = @store.createRecord('testRun', { server: @get('multiserver.server'), destinationServer: @get('multiserver.destinationServer') })
      run.set('conformance', @get('multiserver.server.conformance'))
      run.set('destinationConformance', @get('multiserver.destinationServer.conformance'))
      run.set('isMultiserver', true)
      run.get('testResults').pushObjects(@get('selectedTests').map((test) => @store.createRecord('testResult', {'test': test})))
      Em.RSVP.all( [run.save(), @get('multiserver.server.conformance'), @get('multiserver.destinationServer.conformance')] ).then(=>
        run.get('testResults').filterBy('id', null).invoke('deleteRecord')
        @transitionToRoute('test_runs.show', run).then( =>
          Ember.run.schedule('afterRender', @, ->
            @set('savingTestRun', false)
          )
        )
      )
      return
})

`export default MultiserversShowController`
