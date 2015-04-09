`import Ember from 'ember'`
`import uuid from '../utils/uuid'`

TabbableMixin = Ember.Mixin.create({
  toggleId: (->
    "tabbable-#{Ember.generateGuid()}"
  ).property()

  toggleSelector: (->
    "##{@get('toggleId')}"
  ).property('toggleId')
})

`export default TabbableMixin`
