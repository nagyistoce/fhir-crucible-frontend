`import Ember from 'ember'`

IndividualTestResultPanel = Ember.Component.extend({
  individual_result: null
  filterValue: null
  filteredOut: (->
    IR_content = @get('individual_result.description')
    filtVal = @get('filterValue')
    if filtVal && IR_content.indexOf(filtVal)
      return true
    false
  ).property('filterValue')

})

`export default IndividualTestResultPanel`
