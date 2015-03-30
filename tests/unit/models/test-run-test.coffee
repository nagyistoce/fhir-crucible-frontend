`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'test-run', {
  # Specify the other units that are required for this test.
  needs: ['model:test-result', 'model:conformance', 'model:server', 'model:test', 'model:result', 'model:mode']
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
