`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'conformance', {
  # Specify the other units that are required for this test.
  needs: ['model:mode', 'model:fhir-type']
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
