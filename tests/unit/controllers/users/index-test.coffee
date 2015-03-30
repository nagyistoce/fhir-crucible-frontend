`import { test, moduleFor } from 'ember-qunit'`

moduleFor 'controller:users/index', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

# Replace this with your real tests.
test 'it exists', (assert) ->
  # Because we have async code in this controller we need to wrap it in Ember.run. It'd be better to wrap the code in the controller instead of the test.
  Ember.run(this, ->
    controller = @subject()
    assert.ok controller
  )
