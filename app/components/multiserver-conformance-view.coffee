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

    @get('destinationConformance.rest').forEach( (rest) ->
      rest.get('resource').forEach( (resource) ->
        # console.log "Duplicate resource detected! #{resource.get('fhirType')}" if resourceMap[resource.get('fhirType')]
        resourceMap[resource.get('fhirType')] = { right: resource, left: null }
      )
    )

    @get('conformance.rest').forEach( (rest) ->
      rest.get('resource').forEach( (resource) ->
        if resourceMap[resource.get('fhirType')]
          resourceMap[resource.get('fhirType')]['left'] = resource
        else
          # console.log "Missing resource detected! #{resource.get('fhirType')}"
          resourceMap[resource.get('fhirType')] = { right: null, left: resource }
      )
    )

    # console.log resourceMap

    fhirTypes = _.sortBy(_.keys(resourceMap), (ft) -> ft)
    sortedResourceMap = {}
    _.each(fhirTypes, (ft) ->
      sortedResourceMap[ft] = resourceMap[ft]
    )

    cc = @get('conformance')
    cc.get('rest.firstObject.resource').clear()

    operationAttrs = @get('operations').map((op) ->
      switch op
        when 'historyInstance' then 'history-instance'
        when 'historyType' then 'history-type'
        when 'searchType' then 'search-type'
        else op
    )

    for fhirType, diff of sortedResourceMap
      if !diff.left && !diff.right
        # console.log "empty: #{fhirType}"
      else if diff.left && diff.right
        # console.log "full: #{fhirType}"
        # console.log diff
        for op in operationAttrs
          leftOp = diff.left.get('operation')[op]
          rightOp = diff.right.get('operation')[op]
          if leftOp && rightOp
            leftOp = 'test-filled'
          else
            # console.log "missing op: [#{op}] #{diff.left.get('operation')[op]} - #{diff.right.get('operation')[op]}"
            # console.log "figuring out #{op}"
            if !leftOp && !rightOp
              # console.log "setting #{op} to empty circle"
              diff.left.get('operation')[op] = 'test-empty'
            else if leftOp && !rightOp
              # console.log "setting #{op} to left-circle"
              diff.left.get('operation')[op] = 'left-circle'
            else if !leftOp && rightOp
              # console.log "setting #{op} to right-circle"
              diff.left.get('operation')[op] = 'right-circle'
        cc.get('rest.firstObject.resource').pushObject diff.left
      else if !diff.left && diff.right
        # console.log "right: #{fhirType}"
        # console.log diff.right
        for op in operationAttrs
          if diff.right.get('operation')[op]
            diff.right.get('operation')[op] = 'right-circle'
          else
            # console.log "missing right op: [#{op}] #{diff.right.get('operation')[op]}"
            diff.right.get('operation')[op] = 'test-empty'
        cc.get('rest.firstObject.resource').pushObject diff.right
      else if diff.left && !diff.right
        # console.log "left: #{fhirType}"
        # console.log diff.left
        for op in operationAttrs
          if diff.left.get('operation')[op]
            diff.left.get('operation')[op] = 'left-circle'
          else
            # console.log "missing left op: [#{op}] #{diff.left.get('operation')[op]}"
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
