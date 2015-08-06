`import DS from 'ember-data'`

Issue = DS.Model.extend({
  suite: DS.belongsTo('test', async: true)
  test_id: DS.attr("String")
  test_result: DS.belongsTo('test-result', async: true)
  test_method: DS.attr("String")
  msg: DS.attr("String")
  tag: DS.attr("String")
})

`export default Issue`
