`import Ember from 'ember'`
`import uuid from '../utils/uuid'`

TabbableMixin = Ember.Mixin.create({
  toggleId: (->
    uuid()
  ).property()

  toggleSelector: (->
    "##{@get('toggleId')}"
  ).property('toggleId')
})

`export default TabbableMixin`
