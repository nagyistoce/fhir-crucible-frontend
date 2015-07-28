`import Ember from 'ember'`
`import AffixableMixin from '../mixins/affixable'`

FailureInspectorComponent = Ember.Component.extend(AffixableMixin, {
  stickyTopSpacing: 15,

  issue: null
  data: null

  chartData: Ember.computed.oneWay('data.compliance')
})

`export default FailureInspectorComponent`
