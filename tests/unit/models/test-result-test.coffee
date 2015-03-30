`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'test-result', {
  # Specify the other units that are required for this test.
  needs: ['model:test', 'model:test-run', 'model:result', 'model:conformance', 'model:server']
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
