`import Ember from 'ember'`

TestRunResultsFilteredComponent = Ember.Component.extend(

  overallData: null

  data: (-> 
    @get('overallData.server.summary')
  ).property('overallData')

  #feed this to the starburst component
  chartData: Ember.computed.oneWay('data.compliance')

  issues: (->
    @get('chartData.issues')
  ).property('chartData')

  groupBySuite: true
  filterValue: null

  resultsBySuite: (-> 
    @get('overallData.testResults')
  ).property('overallData')
  
  proxiedTestResults: Ember.computed.map('resultsBySuite', (test) -> Ember.Object.create(content: test, selected: false, expanded: false) )
  selectedTests: Ember.computed.mapBy('proxiedSelectedTests', 'content')
  proxiedSelectedTests: Ember.computed.filterBy('proxiedTestResults', 'selected', true)
  proxiedExpandedTests: Ember.computed.filterBy('proxiedTestResults', 'expanded', true)

  mapped2: (->
    @get('resultsBySuite').mapBy('results').mapBy('content').mapBy('canonicalState').reduce(((prev, cur) -> prev.concat(cur)))
  ).property('resultsBySuite')

  mapped1: (->
    @get('resultsBySuite').mapBy('results').reduce(((prev, cur) -> prev.concat(cur)), [])
  ).property('resultsBySuite')

  proxiedIndivResults: Ember.computed.map('mapped', (test) -> Ember.Object.create(content: test, selected: false) )


  selectAllBtnText: (->
    if @get('groupBySuite')
      selectedCount = @get('selectedTests.length')
      if selectedCount == @get('resultsBySuite.length')
        'Deselect All Test Suites'
      else
        'Select All Test Suites'
    else
      #selectedCount = @get('selectedIndivTests.length')
      #if selectedCount == @get('resultsByIndivTest.length')
      #  'Deselect All Tests'
      #else
      #  'Select All Tests'
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
      list = @get('issues').mapBy('suite_id')
      debugger
      for result in @get('proxiedTestResults')
        id = result.get('suite_id')
        if list.contains(id)
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
        #selected = @get('selectedIndivTests')
        #prop = selected.length < @get('resultsByIndivTest.length')
        #@get('proxiedIndivResults').setEach('selected', prop)
        return

    expandCollapseAll: ->
      expanded = @get('proxiedExpandedTests')
      prop = expanded.length < @get('resultsBySuite.length')
      @get('proxiedTestResults').setEach('expanded', prop)
      return

)

`export default TestRunResultsFilteredComponent`
