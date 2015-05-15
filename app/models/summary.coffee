`import DS from 'ember-data'`

Summary = DS.Model.extend({
  compliance: DS.attr()#DS.belongsTo("compliance")
  generatedAt: DS.attr("date")
  server: DS.belongsTo("server", async: true, inverse:'summary')
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
    if @get('generatedAt')
      moment(@get('generatedAt')).fromNow()
    else
      '-'
  ).property('generatedAt')

  sortedIssues: (->
    # This will collect all issues with similar messages
    nest = d3.nest().key((d) -> d.msg)
    issues = nest.entries(@get('compliance.issues'))
    issues.sort((a,b) ->
      b.values.length - a.values.length
    )
  ).property('compliance.issues')
  topTenIssues: (->
    @get('sortedIssues')[0..9]
  ).property('sortedIssues')
  otherIssues: (->
    @get('sortedIssues')[10..-1]
  ).property('sortedIssues')
})

`export default Summary`
