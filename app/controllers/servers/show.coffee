`import Ember from 'ember'`

ServersShowController = Ember.Controller.extend({
  tests: []
  server: Ember.computed.oneWay('model')

  actions:
    executeTests:->
      run = @store.createRecord('testRun', { server: @get('server') })
      run.set('conformance', @get('server.conformance'))
      run.get('testResults').pushObjects(@get('tests').filterBy('selected').map((test) => @store.createRecord('testResult', {'test': test})))
      run.save().then(=>
        run.get('testResults').filterBy('id', null).invoke('deleteRecord');
        @transitionToRoute('test_runs.show', run)
      )
      return
})

`export default ServersShowController`
