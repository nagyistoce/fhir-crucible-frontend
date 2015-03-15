`import Ember from 'ember'`

ServersShowController = Ember.Controller.extend({
  tests: []
  server: Ember.computed.oneWay('model')

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

`export default ServersShowController`
