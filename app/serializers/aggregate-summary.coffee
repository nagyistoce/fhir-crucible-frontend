`import DS from 'ember-data'`

AggregateSummary = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin, {
  primaryKey: '_id'

})

`export default AggregateSummary`
