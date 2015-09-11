`import Ember from 'ember'`

TestRunResultsFilteredComponent = Ember.Component.extend(

  overallData: null

  data: (-> 
    @get('overallData.server.summary')
  ).property('overallData')

  chartData: Ember.computed.oneWay('data.compliance')

  groupBySuite: true
  filterValue: null

  issues: null
  filteredSuites: Ember.computed.mapBy('issues', 'suite_id')

  resultsBySuite: (-> 
    @get('overallData.testResults')
  ).property('overallData')


  proxiedTestResults: Ember.computed.map('resultsBySuite', (result) -> Ember.Object.create(content: result, selected: false, expanded: false, suite_id: result.test.id, filteredOut: false) )
  selectedTests: Ember.computed.mapBy('proxiedSelectedTests', 'content')
  proxiedSelectedTests: Ember.computed.filterBy('proxiedTestResults', 'selected', true)
  proxiedExpandedTests: Ember.computed.filterBy('proxiedTestResults', 'expanded', true)

  temp: ( ->  
    values = @get('filteredSuites')
    @get('proxiedTestResults').filter((suite) -> values.contains(suite.suite_id))
  ).property('proxiedTestResults', 'filteredSuites')

  selectAllBtnText: (->
    if @get('groupBySuite')
      selectedCount = @get('selectedTests.length')
      if selectedCount == @get('resultsBySuite.length')
        'Deselect All Test Suites'
      else
        'Select All Test Suites'
    else
      'Select All Tests'
  ).property('selectedTests.length', 'resultsBySuite.length', 'groupBySuite')

  expandCollapseBtnText: (->
    expandedCount = @get('proxiedExpandedTests.length')
    if @get('groupBySuite')
      if expandedCount == @get('resultsBySuite.length')
        'Collapse All Test Suites'
      else
        'Expand All Test Suites'
  ).property('proxiedExpandedTests.length', 'resultsBySuite.length')

  actions:
  
    updateCategories: (rootNode) ->
      @set('issues', rootNode.issues)
      @get('temp').setEach('filteredOut', true)
      return

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
        return

    expandCollapseAll: ->
      expanded = @get('proxiedExpandedTests')
      prop = expanded.length < @get('resultsBySuite.length')
      @get('proxiedTestResults').setEach('expanded', prop)
      return

)

`export default TestRunResultsFilteredComponent`
