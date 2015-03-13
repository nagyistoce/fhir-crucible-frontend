`import Ember from 'ember'`
`import DefaultRouteMixin from '../../../mixins/default-route'`
`import { module, test } from 'qunit'`

module 'DefaultRouteMixin'

# Replace this with your real tests.
test 'it works', (assert) ->
  DefaultRouteObject = Ember.Object.extend DefaultRouteMixin
  subject = DefaultRouteObject.create()
  assert.ok subject
