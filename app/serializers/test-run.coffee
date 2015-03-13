`import DS from 'ember-data'`

TestRunSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin, {
  primaryKey: '_id'
  attrs:
    testResults: {embedded:'always'}
    conformance: {embedded:'always'}
})

`export default TestRunSerializer`
