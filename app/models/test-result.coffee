`import DS from 'ember-data'`
`import Tabbable from '../mixins/tabbable'`

TestResult = DS.Model.extend(Tabbable, {
  test: DS.belongsTo('test', {async: true})
  testRun: DS.belongsTo('test-run')
  results: DS.hasMany('result', {async: true})
  hasRun: DS.attr("boolean")
  passed: (-> !@get('results').any((el) -> el.get('failed'))).property('results')
  summary: (->
    results = @get('results')?.mapBy('status').reduce(((prev, cur) -> prev.concat(cur)), [])
    results.push @get('results').mapBy('warnings').reduce(((prev, cur) -> if cur?.length>0 then prev.concat('warning') else prev ), [])
    results
  ).property('results.@each')
  hasResults: (->
    @get('results.length') == @get('test.methods.length')
  ).property('results.@each')
  validatedResources: (->
    # This line flattens the array structure produced by mapBy
    # See Array.prototype.reduce for how it works
    @get('results')?.mapBy('validatedResources').reduce(((prev, cur) -> prev.concat(cur)), [])
  ).property('results')
})

`export default TestResult`
