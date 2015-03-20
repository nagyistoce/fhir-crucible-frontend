`import Ember from 'ember'`

ServersShowController = Ember.Controller.extend({
  tests: []
  server: Ember.computed.oneWay('model')
  savingTestRun: false

  actions:
    selectDeselectAll: ->
      # toggle the checkbox of 'selectDeselect' and toggle the checkboxes

    executeTests:->
      @set('savingTestRun', true)
      run = @store.createRecord('testRun', { server: @get('server') })
      run.set('conformance', @get('server.conformance'))
      run.get('testResults').pushObjects(@get('tests').filterBy('selected').map((test) => @store.createRecord('testResult', {'test': test})))
      Em.RSVP.all( [run.save(), @get('server.conformance')] ).then(=>
        run.get('testResults').filterBy('id', null).invoke('deleteRecord');
        @transitionToRoute('test_runs.show', run).then( =>
          Ember.run.schedule('afterRender', @, ->
            @set('savingTestRun', false)
          )
        )
      )
      return
})

`export default ServersShowController`
