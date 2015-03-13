`import DS from 'ember-data'`

ServerSerializer = DS.ActiveModelSerializer.extend({
  normalize: (type, hash, prop) ->
    hash.links = {conformance: 'conformance'}
    @_super(type,hash,prop)
})

`export default ServerSerializer`
