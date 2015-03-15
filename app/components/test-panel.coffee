`import Ember from 'ember'`
`import uuid from '../utils/uuid'`

TestPanel = Ember.Component.extend({
  test: null

  toggleId: (->
    uuid()
  ).property(),

  toggleSelector: (->
    "##{@get('toggleId')}"
  ).property('toggleId')

  testDownloadURL: (->
    "/ctl/#{@get('test.specificTitle')}.xml"
  ).property('test.specificTitle')
})

`export default TestPanel`
