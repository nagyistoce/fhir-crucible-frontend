`import DS from 'ember-data'`

ResultSerializer = DS.RESTSerializer.extend(DS.ActiveModelSerializer, {
  attrs:
    links: {embeddded:'always'}
    requires: {embeddded:'always'}
    validates: {embeddded:'always'}
})

`export default ResultSerializer`
