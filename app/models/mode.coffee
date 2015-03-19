`import DS from 'ember-data'`

Mode = DS.Model.extend({
  documentation: DS.attr()
  interaction: DS.attr()
  mode: DS.attr()
  operation: DS.attr()
  xmlId: DS.attr()
  results: DS.attr()
  resource: DS.hasMany('fhir-type')
  resourceNames: (-> @get('resource').mapBy('fhirType')).property('resource')
})

`export default Mode`
