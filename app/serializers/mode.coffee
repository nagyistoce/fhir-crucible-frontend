`import DS from 'ember-data'`

ModeSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin, {
  primaryKey: '_id'
  attrs:
    resource: {embedded:'always'}
})

`export default ModeSerializer`
