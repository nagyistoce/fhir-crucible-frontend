`import DS from 'ember-data'`

Resource = DS.Model.extend({
  methods: DS.attr()
  resource: DS.attr('string')
})

`export default Resource`
