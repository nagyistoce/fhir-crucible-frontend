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
  testResults: DS.attr()
  read: (-> @get('operation')['read']||false).property('operation')
  readStatus: (->
    # if @get('testStatus')['read']?
    @get('testResults')?['read']?.status
  ).property('operation')
  vread: (-> @get('operation')['vread']||false).property('operation')
  # vreadStatus: (-> @get('operation')['vread']?.status).property('operation')
  update: (-> @get('operation')['update']||false).property('operation')
  # updateStatus: (-> @get('operation')['update']?.status).property('operation')
  delete: (-> @get('operation')['delete']||false).property('operation')
  # deleteStatus: (-> @get('operation')['delete']?.status).property('operation')
  historyInstance: (-> @get('operation')['history-instance']||false).property('operation')
  # historyInstanceStatus: (-> @get('operation')['history-instance']?.status).property('operation')
  validate: (-> @get('operation')['validate']||false).property('operation')
  # validateStatus: (-> @get('operation')['validate']?.status).property('operation')
  historyType: (-> @get('operation')['history-type']||false).property('operation')
  # historyTypeStatus: (-> @get('operation')['history-type']?.status).property('operation')
  create: (-> @get('operation')['create']||false).property('operation')
  createStatus: (->
    @get('testResults')?['create']
  ).property('operation')
  searchType: (-> @get('operation')['search-type']||false).property('operation')
  # searchTypeStatus: (-> @get('operation')['search-type']?.status).property('operation')
})

`export default FhirType`
