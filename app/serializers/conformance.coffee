`import DS from 'ember-data'`

ConformanceSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin, {
  primaryKey: '_id'
  attrs:
    rest: {embedded:'always'}
  normalize: (type, hash, prop) ->
    hash.id = Em.generateGuid(hash, "conformance")
    @_super(type, hash, prop)
})

`export default ConformanceSerializer`
