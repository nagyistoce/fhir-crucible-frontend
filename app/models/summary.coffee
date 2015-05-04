`import DS from 'ember-data'`

Summary = DS.Model.extend({
  compliance: DS.attr()
  generatedAt: DS.attr("date")
  server: DS.belongsTo("server", async: true)
  testRun: DS.belongsTo("test-run", async: true)

  serverName: (->
    @get('server.name')
  ).property('server.name')

  total: (->
    @get('compliance.total')
  ).property('compliance.total')

  passed: (->
    @get('compliance.passed')
  ).property('compliance.passed')

  failed: (->
    @get('compliance.failed')
  ).property('compliance.failed')
})

`export default Summary`
