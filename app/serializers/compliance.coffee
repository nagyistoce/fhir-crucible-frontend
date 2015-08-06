`import DS from 'ember-data'`

ComplianceSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin,{
  primaryKey: 'name'

  normalize: (prop, hash, type) ->
    hash.issues = hash.issues?.map((el) ->
      el.id = Ember.generateGuid({}, type)
      el
      )
    @_super(prop, hash,type)

  attrs:
    children: {embedded:'always'}
    issues: {embedded:'always'}
})

`export default ComplianceSerializer`
