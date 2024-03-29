`import DS from 'ember-data'`

Compliance = DS.Model.extend({
  total: DS.attr("number")
  passed: DS.attr("number")
  failed: DS.attr("number")
  skipped: DS.attr("number")
  errors: DS.attr("number")
  children: DS.hasMany('compliance')
  issues: DS.attr()
  sortedIssues: (->
    # This will collect all issues with similar messages
    nest = d3.nest().key((d) -> d.msg)
    issues = nest.entries(@get('issues'))
    issues.sort((a,b) ->
      b.values.length - a.values.length
    )
  ).property('issues')
})

`export default Compliance`
