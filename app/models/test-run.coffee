`import DS from 'ember-data'`

TestRun = DS.Model.extend({
  testResults: DS.hasMany('test-result')
  conformance: DS.belongsTo("conformance")
  date: DS.attr("date")
  server: DS.belongsTo("server", {async: true})
  validatedResources: (->
    # This line flattens the array structure produced by mapBy
    # See Array.prototype.reduce for how it works
    @get('testResults').mapBy('validatedResources').reduce(((prev, cur) -> prev.concat(cur)), [])
  ).property('testResults')
})

`export default TestRun`
