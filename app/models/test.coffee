`import DS from 'ember-data'`

Test = DS.Model.extend({
  name: DS.attr('string')
  title: DS.attr('string')
  author: DS.attr('string')
  description: DS.attr('string')
  resource_class: DS.attr('string')
  methods: DS.attr()
  selected: DS.attr("bool", {default: false})
})

`export default Test`
