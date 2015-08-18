`import Ember from 'ember'`
`import fhirCategories from '../../utils/fhir-categories'`

TestRunsShowController = Ember.Controller.extend({
  server: null
  results: Ember.computed.oneWay('model.testResults')
  proxiedTestResults: Ember.computed.map('results', (test) -> Ember.Object.create(content: test, selected: false, expanded: false) )
  selectedTests: Ember.computed.mapBy('proxiedSelectedTests', 'content')
  proxiedSelectedTests: Ember.computed.filterBy('proxiedTestResults', 'selected', true)
  proxiedExpandedTests: Ember.computed.filterBy('proxiedTestResults', 'expanded', true)
  
  destinationServer: null
  groupBySuite: true
  filterValue: null

  testsExecuting: (->
    @get('model.testResults').mapBy('hasResults').contains(false)
  ).property('model.testResults.@each.hasResults')

  executionProgress: (->
    total = @get('model.testResults').mapBy('test').getEach('methods')
      .getEach('length').reduce( ((s,t) -> s+t), 0)
    loaded = @get('model.testResults').mapBy('results')
      .getEach('length').reduce( ((s,t) -> s+t), 0)
    ( ( loaded / Math.max(total,1) ) * 100 )
  ).property('model.testResults.@each.results')

  progressStyle: (->
    progress = @get('executionProgress') || 2
    Ember.$('.execution-progressbar').css("width","#{progress}%")
  ).observes('executionProgress')

  savingTestRun: false

  selectAllBtnText: (->
    selectedCount = @get('selectedTests.length')
    if @get('groupBySuite')
      if selectedCount == @get('results.length')
        'Deselect All Test Suites'
      else
        'Select All Test Suites'
    else
      if selectedCount == @get('results.length')
        'Deselect All Tests'
      else
        'Select All Tests'
  ).property('selectedTests.length', 'results.length', 'groupBySuite')

  expandCollapseBtnText: (->
    expandedCount = @get('proxiedExpandedTests.length')
    if @get('groupBySuite')
      if expandedCount == @get('results.length')
        'Collapse All Test Suites'
      else
        'Expand All Test Suites'
  ).property('proxiedExpandedTests.length', 'results.length')

  actions:
    rerun: ->
      if @get('model.isMultiserver')
        multiserver = {
          server: @get('server')
          destinationServer: @get('destinationServer')
          multiserver_id: "#{@get('server.id')}-#{@get('destinationServer.id')}"
        }
        @transitionToRoute('multiservers.show', multiserver)
      else
        @transitionToRoute('servers.test', @get('model.server'))

    groupByIndividualTests: ->
      @set('groupBySuite', false)
      return

    groupByTestSuites: ->
      @set('groupBySuite', true)
      return

    filter: (val) ->
      @set('filterValue', val)

    selectDeselectAll: ->
      selected = @get('selectedTests')
      prop = selected.length < @get('results.length')
      @get('proxiedTestResults').setEach('selected', prop)
      return

    expandCollapseAll: ->
      expanded = @get('proxiedExpandedTests')
      prop = expanded.length < @get('results.length')
      @get('proxiedTestResults').setEach('expanded', prop)
      return

})

`export default TestRunsShowController`
