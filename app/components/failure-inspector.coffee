`import Ember from 'ember'`
`import AffixableMixin from '../mixins/affixable'`

FailureInspectorComponent = Ember.Component.extend(AffixableMixin, {
  stickyTopSpacing: 15,

  issue: null
  data: null
  selectedNode: null

  chartData: Ember.computed.oneWay('data.compliance')

  actions:
    updatePlot: (node) ->
      @sendAction('updatePlot', node)
      return

    updateCategories: (rootNode) ->
      @sendAction('updateCategories', rootNode)
      return
})

`export default FailureInspectorComponent`
