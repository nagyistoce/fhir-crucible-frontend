`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'server', {
  # Specify the other units that are required for this test.
  needs: ['model:conformance', 'model:mode', 'model:fhir-type']
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
