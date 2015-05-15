`import Ember from 'ember'`
`import starburstFixtureData from '../utils/starburst-fixture-data'`

ServerFhirSpecificationComponent = Ember.Component.extend(
  server: null
  threshold: null
  data: null
  # TODO: use real data from server
  chartData: (->
    @data.get('compliance')
  ).property('data')

  percentSupported: (->
    data = @get('chartData')
    if data? then return Math.round(data.passed / data.total * 100)
    return "-"

  ).property('data')

  topLevelCategories: (->
    @get('chartData.children')
  ).property('data')

  issues: (->
    @get('chartData').issues
  ).property('data')

  topIssuesByMessage: (->
    nest = d3.nest().key((d) -> d.msg)
    issues = nest.entries(@get('issues'))
    issues.sort((a,b) ->
      b.values.length - a.values.length
    )[0..9]
  ).property('issues')

  topIssuesByTag: (->
    nest = d3.nest().key((d) -> d.tag)
    issues = nest.entries(@get('issues'))
    issues.sort((a,b) ->
      b.values.length - a.values.length
    )
  ).property('issues')

  actions: {
    updateCategories: (rootNode) ->
      @set('topLevelCategories', rootNode.children)
      @set('issues', rootNode.issues)
  }
)

`export default ServerFhirSpecificationComponent`
