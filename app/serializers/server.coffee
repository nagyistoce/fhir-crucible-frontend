`import DS from 'ember-data'`

ServerSerializer = DS.ActiveModelSerializer.extend({
  normalize: (type, hash, prop) ->
    hash.links = {conformance: 'conformance', summary:"/api/summary/?server_id=#{hash.id}"}
    @_super(type,hash,prop)
})

`export default ServerSerializer`
