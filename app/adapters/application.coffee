`import DS from 'ember-data'`

ApplicationAdapter = DS.ActiveModelAdapter.extend({
  namespace: "api"
})

Ember.Inflector.inflector.uncountable('summary')

`export default ApplicationAdapter`
