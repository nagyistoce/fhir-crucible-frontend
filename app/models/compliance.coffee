`import Ember from 'ember'`
`import DS from 'ember-data'`

Compliance = DS.Model.extend({
  name: DS.attr('string')
  total: DS.attr("number")
  passed: DS.attr("number")
  failed: DS.attr("number")
  skipped: DS.attr("number")
  errors: DS.attr("number")
  children: DS.hasMany('compliance')
  issues: DS.hasMany('issue')

  percentPassing: Ember.computed('total', 'passed', ->
    ((@get('passed')||0)/(@get('total')||1))*100)
  sortedIssues: (->
    # This will collect all issues with similar messages
    nest = d3.nest().key((d) -> d.msg)
    issues = nest.entries(@get('issues'))
    issues.sort((a,b) ->
      b.values.length - a.values.length
    )
  ).property('issues')

  starburstJSON2: Ember.computed('name', 'children.[]', ->
    {
      name: @get('name'),
      content: @,
      children: @get('children').map((child) -> child.get('starburstJSON2'))
    }
  )
})

`export default Compliance`
