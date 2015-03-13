`import DS from 'ember-data'`

FhirTypeSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin, {
  primaryKey: '_id'
})

`export default FhirTypeSerializer`
