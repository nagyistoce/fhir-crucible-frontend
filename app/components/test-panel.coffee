`import Ember from 'ember'`
`import TabbableMixin from '../mixins/tabbable'`

TestPanel = Ember.Component.extend(TabbableMixin, {
  test: null

  testDownloadURL: (->
    "/ctl/#{@get('test.specificTitle')}.xml"
  ).property('test.specificTitle')
})

`export default TestPanel`
