`import DS from 'ember-data'`

Server = DS.Model.extend({
  url: DS.attr("string")
  name: DS.attr("string")
  conformance: DS.belongsTo('conformance', {async: 'true'})
  unsortedTests: DS.attr()
  selected: DS.attr("boolean")
  summary: DS.belongsTo('summary',{async:true, inverse: 'server'})

  activeTestCount: (->
    @get('tests').filterBy('active', true).getEach('tests').getEach('length').reduce(((s,t) -> s + t),0)
  ).property('tests.@each.active')

  completedTestCount: (->
    @get('tests').filterBy('completed', true).filterBy('active', true).getEach('tests').getEach('length').reduce(((s,t) -> s + t),0)
  ).property('tests.@each.active', 'tests.@each.completed')

  executionProgress: (->
    parseInt( @get('completedTestCount') / Math.max(@get('activeTestCount'),1) * 100)
  ).property('activeTestCount', 'completedTestCount')

  isComplete: (->
    @get('tests').filterBy('running', true).length != 0
  ).property('tests.@each.running')

  progressStyle: (->
    if @get('executionProgress') < 2 then "width: 2%;" else "width: #{@get('executionProgress')}%;"
  ).property('executionProgress')

  runningTestCount:( ->
    @get('tests').filterBy('running', true).length
  ).property('tests.@each.running')

  tests: Em.computed.sort('unsortedTests', (test1, test2) -> test1.get('id').localeCompare(test2.get('id')))

  updateConformanceResults: (->
    return unless @get('tests')?
    tests = @get('tests').filter((t) -> _(t.get('summary')).keys().length > 0).getEach('summary')
    conf = @get('conformance')
    @set('conformance', null) #FIXME Change model directly to trigger rerender
    for summary in tests
      for resource, results of summary
        if resource == 'system'
          conf.get('rest')[0].results = _(conf.get('rest')[0].results).extend(results)
        else
          _(conf.get('rest')[0].resource).findWhere( fhirType: resource ).results = _(_(conf.get('rest')[0].resource).findWhere( fhirType: resource ).results).extend(results)
    @set('conformance', conf)
  ).observes('tests.@each.results') # Replace with 'isComplete' for more performant rendering
})

`export default Server`
