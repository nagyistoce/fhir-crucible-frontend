`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'mode', {
  # Specify the other units that are required for this test.
  needs: ['model:fhir-type']
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
