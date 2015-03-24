`import DS from 'ember-data'`

ResultSerializer = DS.RESTSerializer.extend(DS.EmbeddedRecordsMixin, {
  attrs:
    links: {embeddded:'always'}
    requires: {embeddded:'always'}
    validates: {embeddded:'always'}
    warnings: {embeddded:'always'}
  normalize: (type, hash, prop) ->
    # Retain test result data as responseData since data is reserved
    hash.responseData = hash.data
    @_super(type,hash,prop)
})

`export default ResultSerializer`
