`import Ember from 'ember'`

TestsController = Ember.Controller.extend({
  itemController: 'test'
  actions:
    getConformance: ->
      results = $.ajax(
        url: "/tests/conformance"
        type: "GET"
        data: {'url' : $('input[name="test-url"]').val()}
      ).then( (response) =>
        console.log response
        conformance = response.results.text.div
        @set('conformance', conformance.replace('<table class="grid">','<table class="table table-bordered table-condensed">'))
      )
    goToLink: (item, anchor) ->
      $elem = $(anchor)
      $scrollTo = $('body').scrollTop($elem.offset().top)
      @transitionToRoute(item.route).then($scrollTo)
    goToTest: (test) ->
      @send('goToLink','tests', "##{test.resource_class?.split('::')?[1]||''}-#{test.test_method}")
    executeAll: ->
      @forEach (test) ->
        test.send('execute')

  hasResults: ( ->
    @filter((t) -> t.get('results')?.length)?.length > 0
  ).property('@each.results')

  total: ( ->
    # @get('model').get('length')
    # Toggle above for Test Suite totals, below for test methods total
    @get('model').reduce(((s,m) -> s + m.get('tests').length), 0)
  ).property('@each')

  totalResults: ( ->
    # @filter((t) -> t.get('results')?.length)?.length
    # Toggle above for Test Suite totals, below for test methods total
    @filter((t) -> t.get('results')?.length).reduce(((s,t) -> s + t.get('results').length), 0)
  ).property('@each.results')

  executionProgress: ( ->
    parseInt( @get('totalResults') / @get('total') * 100 )
  ).property('@each.results')

  progressStyle: ( ->
    if @get('executionProgress') < 2
      "width: 2%;"
    else
      "width: #{@get('executionProgress')}%;"
  ).property('@each.results')

  isComplete: ( ->
    @get('executionProgress') != 100
  ).property('@each.results')
})

`export default TestsController`
