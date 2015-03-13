`import Ember from 'ember'`
`import TabbableMixin from '../../../mixins/tabbable'`
`import { module, test } from 'qunit'`

module 'TabbableMixin'

# Replace this with your real tests.
test 'it works', (assert) ->
  TabbableObject = Ember.Object.extend TabbableMixin
  subject = TabbableObject.create()
  assert.ok subject
