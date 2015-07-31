`import Ember from 'ember'`

ServerFhirSpecificationComponent = Ember.Component.extend(
  server: null
  threshold: null
  data: null
  suites: null
  hasFailures: false

  hasData: Ember.computed.gt('chartData.total', 0)

  chartData: Ember.computed.oneWay('data.compliance')

  lastUpdate: (->
    @data.get('server.summary.generatedFromNow')
  ).property('data')

  percentSupported: (->
    data = @get('chartData')
    return Math.round(data.passed / data.total * 100) if data?
    return "-"
  ).property('chartData.passed', 'chartData.total')

  topLevelCategories: (->
    @get('chartData.children')
  ).property('chartData')

  issues: (->
    @get('chartData.issues')
  ).property('chartData')

  topIssuesByMessage: (->
    nest = d3.nest().key((d) -> d.msg)
    issues = nest.entries(@get('issues'))
    issues.sort((a,b) ->
      b.values.length - a.values.length
    )
  ).property('issues')

  topIssuesByTag: (->
    nest = d3.nest().key((d) -> d.tag)
    issues = nest.entries(@get('issues'))
    issues.sort((a,b) ->
      b.values.length - a.values.length
    )
  ).property('issues')

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
  }
)

`export default ServerFhirSpecificationComponent`
