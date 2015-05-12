`import DS from 'ember-data'`

AggregateSummary = DS.Model.extend({
  summaries: DS.hasMany('summary', async: true)
})

`export default AggregateSummary`
