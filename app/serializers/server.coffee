`import DS from 'ember-data'`

ServerSerializer = DS.ActiveModelSerializer.extend({
  normalize: (type, hash, prop) ->
    hash.links = {conformance: 'conformance', summary:"summary", issues:"issues"}
    @_super(type,hash,prop)
})

`export default ServerSerializer`
