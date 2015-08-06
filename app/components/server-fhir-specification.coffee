`import Ember from 'ember'`

ServerFhirSpecificationComponent = Ember.Component.extend(
  server: null
  threshold: null
  data: null
  suites: null
  hasFailures: false

  hasData: Ember.computed.gt('chartData.total', 0)

  chartData: Ember.computed.oneWay('data.compliance')

  tagFilters: Ember.computed(-> [])

  lastUpdate: (->
    @data.get('server.summary.generatedFromNow')
  ).property('data')

  percentSupported: (->
    data = @get('chartData')
    return Math.round(data.get('passed') / data.get('total') * 100) if data?
    return "-"
  ).property('chartData.passed', 'chartData.total')

  topLevelCategories: (->
    @get('chartData.children')
  ).property('chartData')

  issues: (->
    @get('chartData.issues')
  ).property('chartData')

  allTags: Ember.computed('issues.[]', ->
    @get('issues').mapBy('tag').uniq().sort()
  )

  filteredIssues: Ember.computed('issues.[]', 'tagFilters.[]', ->
    issues = @get('issues')
    filters = @get('tagFilters')
    issues = issues.filter((issue) -> filters.contains(Ember.get(issue, 'tag'))) if filters.length > 0
    issues
  )

  topIssuesByMessage: (->
    nest = d3.nest().key((d) -> d.msg)
    issues = nest.entries(@get('filteredIssues'))
    issues.sort((a,b) ->
      b.values.length - a.values.length
    )
  ).property('filteredIssues.[]')

  currentIssue: Ember.computed('issueInView', 'topIssuesByMessage.firstObject', ->
    issueInView = @get('issueInView')
    return issueInView if issueInView?
    @get('topIssuesByMessage.firstObject')
  )

  issueInView: null

  actions: {
    updateCategories: (rootNode) ->
      @set('topLevelCategories', rootNode.children)
      @set('issues', rootNode.issues)
      return

    updateCurrentIssue: (proxiedIssue) ->
      @set('issueInView', proxiedIssue)
      return

    addTagToFilter: (tag) ->
      @get('tagFilters').addObject(tag)
      return

    removeTagFromFilter: (tag) ->
      @get('tagFilters').removeObject(tag)
      return

    toggleTag: (tag) ->
      tagFilters = @get('tagFilters')
      if tagFilters.contains(tag)
        tagFilters.removeObject(tag)
      else
        tagFilters.addObject(tag)
      return
  }
)

`export default ServerFhirSpecificationComponent`
