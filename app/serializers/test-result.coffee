`import DS from 'ember-data'`

TestResultSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin, {
  primaryKey: '_id'
  attrs:
    results: {embeddded: 'always'}
  normalize: (type, hash, prop) ->
    delete hash.result # Even if populated I want to force an ajax call
    hash.links = {results: "result"}
    @_super(type,hash,prop)
})

`export default TestResultSerializer`
