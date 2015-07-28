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

  currentIssue: Ember.computed('issuesInView.[]', 'topIssuesByMessage.firstObject', ->
    topIssuesByMessage = @get('topIssuesByMessage')
    issuesInView = @get('issuesInView')

    return topIssuesByMessage[0] if issuesInView.length == 0

    for issue in topIssuesByMessage
      return issue if issuesInView.contains(issue)

    topIssuesByMessage[0]
  )

  issuesInView: Ember.computed(-> [])
  issuesToRemove: Ember.computed(-> [])

  actions: {
    updateCategories: (rootNode) ->
      @set('topLevelCategories', rootNode.children)
      @set('issues', rootNode.issues)
      return

    entered: (proxiedIssue) ->
      @get('issuesInView').addObject(proxiedIssue)
      if @get('issuesToRemove.length') > 0
        for issue in @get('issuesToRemove')
          @get('issuesInView').removeObject(issue)
        @get('issuesToRemove').clear()
      return

    exited: (proxiedIssue) ->
      @get('issuesInView').removeObject(proxiedIssue)
      if @get('issuesInView.length') == 0
        @get('issuesToRemove').addObject(proxiedIssue)
        @get('issuesInView').addObject(proxiedIssue)
      return
  }
)

`export default ServerFhirSpecificationComponent`
