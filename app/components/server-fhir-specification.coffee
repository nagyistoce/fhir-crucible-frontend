`import Ember from 'ember'`
`import starburstFixtureData from '../utils/starburst-fixture-data'`

ServerFhirSpecificationComponent = Ember.Component.extend(
  server: null
  threshold: null
  chartData: null
  # TODO: use real data from server
  # chartData: (->
  #   starburstFixtureData
  # ).property('server')

  percentSupported: (->
    data = @get('chartData')
    Math.round(data.passed / data.total * 100)
  ).property('chartData')

  topLevelCategories: (->
    @get('chartData.children')
  ).property('chartData')

  actions: {
    updateCategories: (rootNode) ->
      @set('topLevelCategories', rootNode.children)
  }
)

`export default ServerFhirSpecificationComponent`
