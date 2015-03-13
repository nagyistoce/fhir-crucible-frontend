`import DS from 'ember-data'`

TestSerializer = DS.ActiveModelSerializer.extend({
  primaryKey: '_id'
})

`export default TestSerializer`
