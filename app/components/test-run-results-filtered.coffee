`import Ember from 'ember'`

TestRunResultsFilteredComponent = Ember.Component.extend(

  overallData: null
  topLevelCategories: null
  topLevelIssues: null

  data: (-> 
    @get('overallData.server.summary')
  ).property('overallData')

  testIdByStarburst: (-> 
    if @topLevelIssues
      return @get('topLevelIssues').mapBy('test_id')
    return "empty"
  ).property('topLevelIssues')

  suiteIdByStarburst: (-> 
    if @topLevelIssues
      return @get('topLevelIssues').mapBy('suite_id')
    return "empty"
  ).property('topLevelIssues')

  #feed this to the starburst component
  chartData: Ember.computed.oneWay('data.compliance')

  groupBySuite: true
  filterValue: null

  resultsBySuite: (-> 
    @get('overallData.testResults')
  ).property('overallData')
  
  #resultsByIndivTest: ( -> 
  #  flattenArray(@get('resultsBySuite').getEach('results').mapBy('content'))
  #).property('resultsBySuite')
  #proxiedIndivResults: Ember.computed.map('resultsByIndivTest', (test) -> Ember.Object.create(content: test, selected: false) )
  proxiedTestResults: Ember.computed.map('resultsBySuite', (test) -> Ember.Object.create(content: test, selected: false, expanded: false) )

  #selectedIndivTests: Ember.computed.mapBy('proxiedSelectedIndivTests', 'content')
  selectedTests: Ember.computed.mapBy('proxiedSelectedTests', 'content')

  #proxiedSelectedIndivTests: Ember.computed.filterBy('proxiedIndivResults', 'selected', true)
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
      @set('topLevelCategories', rootNode.children)
      @set('topLevelIssues', rootNode.issues)
      debugger
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
