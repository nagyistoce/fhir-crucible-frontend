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

  percentPassed: (->
    return 0 if @get('compliance.total') == 0
    Math.round(@get('compliance.passed') / @get('compliance.total') * 100)
  ).property('compliance.passed', 'compliance.total')

  failed: (->
    @get('compliance.failed')
  ).property('compliance.failed')

  generatedFromNow: (->
    if @get('testRun.date')
      moment(@get('testRun.date')).fromNow()
    else
      '-'
  ).property('testRun.date')
})

`export default Summary`
