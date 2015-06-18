`import DS from 'ember-data'`

SummarySerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin,{
  primaryKey: '_id'

  attrs:
    compliance: {embedded:'always'}
})

`export default SummarySerializer`
