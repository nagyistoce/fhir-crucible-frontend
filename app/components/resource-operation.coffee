`import Ember from 'ember'`

ResourceOperationComponent = Ember.Component.extend
  tagName: ''
  resource: null
  operation: null
  validatedResources: null

  supported: (->
    @resource.get(@operation)
  ).property('resource')

  operationTests: (->
    @validatedResources?.reduce(((prev, cur) -> prev.concat(cur)), []).filterBy('resource', @resource.get('fhirType')).filterBy('method', @operation)
  ).property('resource', 'validatedResources')

  failingTests:(->
    @validatedResources?.reduce(((prev, cur) -> prev.concat(cur)), []).filterBy('resource', @resource.get('fhirType')).filterBy('method', @operation).filterBy('passed', false)
  ).property('resource', 'validatedResources')

  passingTests:(->
    @validatedResources?.reduce(((prev, cur) -> prev.concat(cur)), []).filterBy('resource', @resource.get('fhirType')).filterBy('method', @operation).filterBy('passed', true)
  ).property('resource', 'validatedResources')

  operationTestStatus: (->
    operationTests = @validatedResources?.reduce(((prev, cur) -> prev.concat(cur)), []).filterBy('resource', @resource.get('fhirType')).filterBy('method', @operation)
    if operationTests?.length > 0
      return if operationTests.everyBy('passed', true) then 'results-pass' else 'results-failed'
    else
      return null
  ).property('resource', 'validatedResources')

`export default ResourceOperationComponent`
