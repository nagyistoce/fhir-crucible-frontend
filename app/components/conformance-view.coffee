`import Ember from 'ember'`

ConformanceViewComponent = Em.Component.extend
  server: null
  testResults: null
  actions: ["read", "vread", "update", "delete", "historyInstance", "validate", "historyType", "create", "searchType"]
  conformanceResults: (->
    # We're going to make a computed property that merges conformance and testResults
    results = @get('testResults').mapBy('validatedResources').reduce(((prev, cur) -> prev.concat(cur)), [])
    # Because conformance may not always be loaded we need to handle that case
    (@get('server.conformance.rest')||[]).forEach((rest) ->
      rest.get('resource').forEach((res)->
        res.get('interaction').forEach((interaction) ->
          interactionTests = results.filterBy('resource', res.get('fhirType')).filterBy('method', interaction.code)
          interaction.status = null
          if interactionTests.length > 0
            interaction.status = if interactionTests.everyBy('pass', true) then "pass" else "fail"
          # console.log interaction
        )
      )
    )
  ).observes('testResults', 'server.conformance.rest')

`export default ConformanceViewComponent`
