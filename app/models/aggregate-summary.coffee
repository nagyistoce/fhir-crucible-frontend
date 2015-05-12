`import DS from 'ember-data'`

AggregateSummary = DS.Model.extend({
  name: DS.attr('string')
  servers: DS.attr()
  summaries: DS.hasMany('summary', async: true)
})

`export default AggregateSummary`
