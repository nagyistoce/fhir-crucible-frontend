`import DS from 'ember-data'`

Conformance = DS.Model.extend({
  acceptUnknown: DS.attr("boolean")
  contained: DS.attr()
  date: DS.attr("date")
  description: DS.attr("string")
  document: DS.attr()
  experimental: DS.attr("boolean")
  fhirVersion: DS.attr("string")
  format: DS.attr()
  identifier: DS.attr("string")
  implicitRules: DS.attr()
  language: DS.attr()
  messaging: DS.attr()
  modifier_id: DS.attr()
  name: DS.attr("string")
  profile: DS.attr()
  publisher: DS.attr("string")
  rest: DS.hasMany("mode")
  status: DS.attr("string")
  telecom: DS.attr()
  text: DS.attr()
  version: DS.attr()
  versionNum: DS.attr("string")
  xmlId: DS.attr("string")
})

`export default Conformance`
