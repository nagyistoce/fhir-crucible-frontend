`import DS from 'ember-data'`

TestRun = DS.Model.extend({
  testResults: DS.hasMany('test-result')
  conformance: DS.belongsTo("conformance")
  date: DS.attr("date")
  server: DS.belongsTo("server", {async: true})
})

`export default TestRun`
