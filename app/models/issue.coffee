`import DS from 'ember-data'`

Issue = DS.Model.extend
  method: DS.attr("string")
  status: DS.attr("string")
  test_run: DS.belongsTo("test-run", async: true)
  server: DS.belongsTo("test-run", async:true)
  resource: DS.attr("string")
  message: DS.attr("string")

`export default Issue`
