`import Ember from 'ember'`

IndividualTestResultPanel = Ember.Component.extend({
  proxiedIndivResult: null
  individual_result: Ember.computed.oneWay('proxiedIndivResult.content')
  filterValue: null
  filteredOut: (->
    IR_content = @get('individual_result.description')
    filtVal = @get('filterValue')
    if filtVal && (IR_content.indexOf(filtVal) == -1) 
      return true
    return false
  ).property('filterValue')
})

`export default IndividualTestResultPanel`
