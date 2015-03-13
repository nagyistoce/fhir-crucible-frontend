`import DS from 'ember-data'`
`import Tabbable from '../mixins/tabbable'`

TestResult = DS.Model.extend(Tabbable, {
  test: DS.belongsTo('test', {async: true})
  testRun: DS.belongsTo('test-run')
  results: DS.hasMany('result', {async: true})
  hasRun: DS.attr("boolean")
  passed: (-> !@get('results').any((el) -> el.get('failed'))).property('results')
  hasResults: (->
    @get('results.length') == @get('test.methods.length')
  ).property('results.@each')
})

`export default TestResult`
