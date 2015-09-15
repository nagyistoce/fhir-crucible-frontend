`import Ember from 'ember'`

TestRunResultsFilteredComponent = Ember.Component.extend(

  overallData: null

  data: (-> 
    @get('overallData.server.summary')
  ).property('overallData')

  chartData: Ember.computed.oneWay('data.compliance')

  groupBySuite: true
  filterValue: null

  issues: (->
    @get('chartData.issues')
  ).property('chartData')

  resultsBySuite: (-> 
    @get('overallData.testResults')
  ).property('overallData')

  proxiedTestResults: Ember.computed.map('resultsBySuite', (result) -> Ember.Object.create(content: result, selected: false, expanded: false, suite_id: result.get('test.id'), filteredOut: false))
  selectedTests: Ember.computed.mapBy('proxiedSelectedTests', 'content')
  proxiedSelectedTests: Ember.computed.filterBy('proxiedTestResults', 'selected', true)
  proxiedExpandedTests: Ember.computed.filterBy('proxiedTestResults', 'expanded', true)

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
      filteredSuitesList = @get('issues').mapBy('suite_id')
      for result in @get('proxiedTestResults')
        id = result.get('suite_id')
        if filteredSuitesList.contains(id)
          result.set('filteredOut', false)
        else 
          result.set('filteredOut', true)
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
