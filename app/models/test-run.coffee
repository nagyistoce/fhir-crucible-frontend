`import DS from 'ember-data'`

TestRun = DS.Model.extend({
  testResults: DS.hasMany('test-result')
  conformance: DS.belongsTo("conformance")
  date: DS.attr("date")
  server: DS.belongsTo("server", {async: true})
  destinationServer: DS.belongsTo("server", {async: true})
  destinationConformance: DS.belongsTo("conformance")
  isMultiserver: DS.attr("boolean")
  summary: (->
    summary =
      pass: 0
      fail: 0
      warning: 0
      skip: 0
      error: 0
      total: 0
    results = @get('testResults').mapBy('summary').reduce(((prev, cur) -> prev.concat(cur)), [])
    results.forEach( (tr) ->
      summary[tr]++
      summary['total']++
    )
    summary
  ).property('testResults.@each.results')
  validatedResources: (->
    # This line flattens the array structure produced by mapBy
    # See Array.prototype.reduce for how it works
    @get('testResults').mapBy('validatedResources').reduce(((prev, cur) -> prev.concat(cur)), [])
  ).property('testResults')
})

`export default TestRun`
