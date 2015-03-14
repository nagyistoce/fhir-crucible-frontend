`import Ember from 'ember'`
`import UuidGeneratorMixin from '../mixins/uuid-generator'`

TestPanel = Ember.Component.extend(UuidGeneratorMixin, {
  test: null

  toggleId: (->
    @_generateUuid()
  ).property(),

  toggleSelector: (->
    "##{@get('toggleId')}"
  ).property('toggleId')

  testDownloadURL: (->
    "/ctl/#{@get('test.specificTitle')}.xml"
  ).property('test.specificTitle')
})

`export default TestPanel`
