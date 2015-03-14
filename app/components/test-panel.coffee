`import Ember from 'ember'`

TestPanel = Ember.Component.extend({
  test: null

  toggleId: (->
    'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, (c) ->
      r = Math.random()*16|0
      v = if c == 'x' then r else (r&0x3|0x8)
      v.toString(16)
    )
  ).property(),

  toggleSelector: (->
    "##{@get('toggleId')}"
  ).property('toggleId')

  testDownloadURL: (->
    "/ctl/#{@get('test.specificTitle')}.xml"
  ).property('test.specificTitle')
})

`export default TestPanel`
