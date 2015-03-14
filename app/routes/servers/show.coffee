`import Ember from 'ember'`

ServersShowRoute = Ember.Route.extend({
  model: (params) ->
    console.log "Test"
    Ember.RSVP.hash(
      server: @store.find('server', params.server_id)
      tests: @store.findAll("test")
    )
  afterModel: (model) ->
    # conformance = DS.PromiseObject.create({promise: $.get("/api/servers/conformance?url=#{model.server.get("url")}")})
    # conformance.then(() => model.server.set("conformance", @store.createRecord('conformance', json: [conformance.content])))

  actions:
    executeTests:->
      run = @store.createRecord('testRun', {'server': @currentModel.server})
      run.set('conformance', @currentModel.server.get('conformance'))
      run.get('testResults').pushObjects(@currentModel.tests.filterBy('selected').map((test) => @store.createRecord('testResult', {'test': test})))
      run.save().then(=>
        run.get('testResults').filterBy('id', null).invoke('deleteRecord');
        @transitionTo('test_runs.show', run)
      )
})

`export default ServersShowRoute`
