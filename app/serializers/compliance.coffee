`import DS from 'ember-data'`

ComplianceSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin,{
  primaryKey: 'name'

  attrs:
    children: {embedded:'always'}
})

`export default ComplianceSerializer`
