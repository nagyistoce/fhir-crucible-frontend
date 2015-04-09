`import Ember from 'ember'`
`import ConformanceViewComponent from '../components/conformance-view'`

MultiserverConformanceViewComponent = ConformanceViewComponent.extend
  destinationConformance: null

  collapsedConformance: (->
    return false unless @get('conformance.rest') &&
      @get('destinationConformance.rest')

    resourceMap = {}
    secondExclusive = {}
    temp = []

    # Add all of server 2's resources to the map
    @get('destinationConformance.rest').forEach( (rest) ->
      rest.get('resource').forEach( (resource) ->
        resourceMap[resource.get('fhirType')] = { right: resource, left: null }
      )
    )

    # Add all of server 1's resources to the map
    @get('conformance.rest').forEach( (rest) ->
      rest.get('resource').forEach( (resource) ->
        if resourceMap[resource.get('fhirType')]
          resourceMap[resource.get('fhirType')]['left'] = resource
        else
          resourceMap[resource.get('fhirType')] = { right: null, left: resource }
      )
    )

    # Clean up the resources map and sort them by resource name
    fhirTypes = _.sortBy(_.keys(resourceMap), (ft) -> ft)
    sortedResourceMap = {}
    _.each(fhirTypes, (ft) ->
      sortedResourceMap[ft] = resourceMap[ft]
    )

    # Clear out the resources on the main conformance model
    cc = @get('conformance')
    cc.get('rest.firstObject.resource').clear()

    # Replace operations with attribute-accessible values
    operationAttrs = @get('operations').map((op) ->
      switch op
        when 'historyInstance' then 'history-instance'
        when 'historyType' then 'history-type'
        when 'searchType' then 'search-type'
        else op
    )

    # walk through each resource in the resource map
    for fhirType, diff of sortedResourceMap
      # if the resource doesn't exist in either server
      if !diff.left && !diff.right

      # if the resource exists in both servers
      else if diff.left && diff.right
        # walk through each FHIR RESTFul operation
        for op in operationAttrs
          leftOp = diff.left.get('operation')[op]
          rightOp = diff.right.get('operation')[op]
          if leftOp && rightOp
            leftOp = 'test-filled'
          else
            if !leftOp && !rightOp
              diff.left.get('operation')[op] = 'test-empty'
            else if leftOp && !rightOp
              diff.left.get('operation')[op] = 'left-circle'
            else if !leftOp && rightOp
              diff.left.get('operation')[op] = 'right-circle'
        cc.get('rest.firstObject.resource').pushObject diff.left

      # if the resource only exists in server 2
      else if !diff.left && diff.right
        for op in operationAttrs
          if diff.right.get('operation')[op]
            diff.right.get('operation')[op] = 'right-circle'
          else
            diff.right.get('operation')[op] = 'test-empty'
        cc.get('rest.firstObject.resource').pushObject diff.right

      # if the resource only exists in server 1
      else if diff.left && !diff.right
        for op in operationAttrs
          if diff.left.get('operation')[op]
            diff.left.get('operation')[op] = 'left-circle'
          else
            diff.left.get('operation')[op] = 'test-empty'
        cc.get('rest.firstObject.resource').pushObject diff.left

    @get('conformance')
  ).property('conformance', 'destinationConformance')

  actions:
    multiserverSelect: ->
      selected = $('#multiserver-selector').val()
      $('#resource-chart .test-filled, .test-empty, .left-circle, .right-circle').css('visibility', 'hidden')
      switch selected
        when "Server 1 AND Server 2" then $('#resource-chart .test-filled').css('visibility', 'visible')
        when "Server 1 OR Server 2" then $('#resource-chart .test-filled, .test-empty, .left-circle, .right-circle').css('visibility', 'visible')
        when "Server 1 - EXCLUSIVE" then $('#resource-chart .left-circle').css('visibility', 'visible')
        when "Server 2 - EXCLUSIVE" then $('#resource-chart .right-circle').css('visibility', 'visible')
        else console.log 'Please check selector'

`export default MultiserverConformanceViewComponent`
