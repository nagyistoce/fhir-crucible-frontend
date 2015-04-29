`import Ember from 'ember'`
`import fhirCategories from '../../utils/fhir-categories'`

TestRunsShowController = Ember.Controller.extend({
  server: null
  destinationServer: null

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

  checkCategories: (->
    # FIXME: Replace either this method or the observes with a listener that
    # fires the generate method after a testRun has been fully-fetched
    fhirCategories.generate(@get('model'))
  ).observes('model.testResults.@each.results')

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
        @transitionToRoute('servers.show', @get('model.server'))

})

`export default TestRunsShowController`
