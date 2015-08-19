`import Ember from 'ember'`
`import fhirCategories from '../../utils/fhir-categories'`

TestRunsShowController = Ember.Controller.extend({
  server: null
  resultsBySuite: Ember.computed.oneWay('model.testResults')
  resultsByIndivTest: ( ->
    @get('resultsBySuite').mapBy('results').reduce((l, r) -> l.pushObjects r, [])
  ).property('resultsBySuite')

  proxiedIndivResults: Ember.computed.map('resultsByIndivTest', (test) -> Ember.Object.create(content: test, selected: false) )
  proxiedTestResults: Ember.computed.map('resultsBySuite', (test) -> Ember.Object.create(content: test, selected: false, expanded: false) )

  selectedIndivTests: Ember.computed.mapBy('proxiedSelectedIndivTests', 'content')
  selectedTests: Ember.computed.mapBy('proxiedSelectedTests', 'content')

  proxiedSelectedIndivTests: Ember.computed.filterBy('proxiedIndivResults', 'selected', true)
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
    if @get('groupBySuite')
      selectedCount = @get('selectedTests.length')
      if selectedCount == @get('resultsBySuite.length')
        'Deselect All Test Suites'
      else
        'Select All Test Suites'
    else
       selectedCount = @get('selectedIndivTests.length')
      if selectedCount == @get('resultsByIndivTest.length')
        'Deselect All Tests'
      else
        'Select All Tests'
  ).property('selectedTests.length', 'selectedIndivTests.length', 'resultsBySuite.length', 'resultsByIndivTest.length', 'groupBySuite')

  expandCollapseBtnText: (->
    expandedCount = @get('proxiedExpandedTests.length')
    if @get('groupBySuite')
      if expandedCount == @get('resultsBySuite.length')
        'Collapse All Test Suites'
      else
        'Expand All Test Suites'
  ).property('proxiedExpandedTests.length', 'resultsBySuite.length')

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
      if @get('groupBySuite')
        selected = @get('selectedTests')
        prop = selected.length < @get('resultsBySuite.length')
        @get('proxiedTestResults').setEach('selected', prop)
        return
      else
        selected = @get('selectedIndivTests')
        prop = selected.length < @get('resultsByIndivTest.length')
        @get('proxiedIndivResults').setEach('selected', prop)
        return

    expandCollapseAll: ->
      expanded = @get('proxiedExpandedTests')
      prop = expanded.length < @get('resultsBySuite.length')
      @get('proxiedTestResults').setEach('expanded', prop)
      return

})

`export default TestRunsShowController`
