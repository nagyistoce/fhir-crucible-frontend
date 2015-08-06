`import DS from 'ember-data'`

IssueSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin, {

})

`export default IssueSerializer`
