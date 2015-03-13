`import Ember from 'ember'`
`import DefaultRoute from '../../mixins/default-route'`

ServersResultsRoute = Ember.Route.extend(DefaultRoute, {
  model: (params) ->
    @store.find('server', params.server_id)
  afterModel: (server) ->
    tests = server.get("tests")||[]
    @transitionTo('servers.show', server) if tests.length == 0
    test.set("results", null) for test in tests
    # Retain all active tests
    @executableTests = (test for test in tests when test.get('active'))
    # Execute the first test, which will execute subsequent tests, if any
    @execute(@executableTests.shift(), server) if @executableTests.length>0

  execute: (test, server) ->
    test.set("running", true)
    params = {}
    params.url = server.get("url")
    if test.get('resource_class')
      params.resource_class = test.get('resource_class')
    paramsString = Object.keys(params).map((k) -> (k+"="+params[k])).join("&")
    suitePromise = DS.PromiseObject.create({promise: $.get("/tests/execute/#{test.get("title")}?#{paramsString}")})
    suitePromise.then(() =>
      test.set("running", false)
      res= []
      title = test.get('title')
      title += "_#{test.get('resource_class').split('::')[1]}" if test.get('resource_class')?
      for testResult in suitePromise.content.results
        res.push(testResult[title])
      test.set("results", res)
      @execute(@executableTests.shift(), server) if @executableTests.length>0
    )
  actions:
    rerun: ->
      @transitionTo('servers.show', @currentModel)
})

`export default ServersResultsRoute`
