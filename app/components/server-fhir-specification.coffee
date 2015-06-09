`import Ember from 'ember'`

ServerFhirSpecificationComponent = Ember.Component.extend(
  server: null
  threshold: null
  data: null

  hasData: Ember.computed.gt('chartData.total', 0)

  chartData: Ember.computed.oneWay('data.compliance')

  percentSupported: (->
    data = @get('chartData')
    return Math.round(data.passed / data.total * 100) if data?
    return "-"
  ).property('chartData.passed', 'chartData.total')

  topLevelCategories: (->
    @get('chartData.children')
  ).property('chartData')

  actions: {
    updateCategories: (rootNode) ->
      @set('topLevelCategories', rootNode.children)
      return
  }
)

`export default ServerFhirSpecificationComponent`
