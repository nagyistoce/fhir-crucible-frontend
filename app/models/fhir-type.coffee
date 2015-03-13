`import DS from 'ember-data'`

FhirType = DS.Model.extend({
  fhirType: DS.attr()
  interaction: DS.attr()
  profile: DS.attr()
  readHistory: DS.attr()
  searchInclude: DS.attr()
  searchParam: DS.attr()
  updateCreate: DS.attr()
  versioning: DS.attr()
  xmlId: DS.attr()
  operation: DS.attr()
  results: DS.attr()
  read: (-> @get('operation')['read']||false).property('operation')
  vread: (-> @get('operation')['vread']||false).property('operation')
  update: (-> @get('operation')['update']||false).property('operation')
  delete: (-> @get('operation')['delete']||false).property('operation')
  historyInstance: (-> @get('operation')['history-instance']||false).property('operation')
  validate: (-> @get('operation')['validate']||false).property('operation')
  historyType: (-> @get('operation')['history-type']||false).property('operation')
  create: (-> @get('operation')['create']||false).property('operation')
  searchType: (-> @get('operation')['search-type']||false).property('operation')
})

`export default FhirType`
