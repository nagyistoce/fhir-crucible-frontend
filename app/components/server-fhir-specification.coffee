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

  actions: {
    updateCategories: (rootNode) ->
      @set('topLevelCategories', rootNode.children)
  }
)

`export default ServerFhirSpecificationComponent`
