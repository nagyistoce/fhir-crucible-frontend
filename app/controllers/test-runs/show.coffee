`import Ember from 'ember'`
`import fhirCategories from '../../utils/fhir-categories'`

TestRunsShowController = Ember.Controller.extend({
  server: null
  destinationServer: null
  groupBySuite: false
  filterValue: null
  selectedTestResult: ((key, value) ->
    return value if arguments.length > 1
    @get('model.testResults.firstObject.results.firstObject')
  ).property('model.testResults.[]')
  testsExecuting: (->
    @get('model.testResults').mapBy('hasResults').contains(false)
  ).property('model.testResults.@each.hasResults')

  executionProgress: (->
    total = @get('model.testResults').mapBy('test').getEach('methods')
      .getEach('length').reduce( ((s,t) -> s+t), 0)
    loaded = @get('model.testResults').mapBy('results')
      .getEach('length').reduce( ((s,t) -> s+t), 0)
    ( ( loaded / Math.max(total,1) ) * 100 )
  ).property('model.testResults.@each.results')

  progressStyle: (->
    progress = @get('executionProgress') || 2
    Ember.$('.execution-progressbar').css("width","#{progress}%")
  ).observes('executionProgress')
  

  actions:
    rerun: ->
      if @get('model.isMultiserver')
        multiserver = {
          server: @get('server')
          destinationServer: @get('destinationServer')
          multiserver_id: "#{@get('server.id')}-#{@get('destinationServer.id')}"
        }
        @transitionToRoute('multiservers.show', multiserver)
      else
        @transitionToRoute('servers.test', @get('model.server'))

    groupByIndividualTests: ->
      @set('groupBySuite', false)
      return

    groupByTestSuites: ->
      @set('groupBySuite', true)
      return

    filter: (val) ->
      @set('filterValue', val)

})

`export default TestRunsShowController`
